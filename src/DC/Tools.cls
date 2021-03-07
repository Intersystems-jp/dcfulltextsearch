Class DC.Tools Extends %Base [ Language = objectscript ]
{

ClassMethod CollectDCContentsUrl(pUrl As %String) As %Status
{
 set status = $$$OK
 
 set reader=##class(%XML.Reader).%New()
 set httprequest=##class(%Net.HttpRequest).%New()
 // MYSSL should be set up
 set httprequest.SSLConfiguration="MYSSL"
 //pUrl = "https://jp.community.intersystems.com/sitemap.xml"
 set status=reader.OpenURL(pUrl,,httprequest)
 
 set doc = reader.Document
 // urlset
 set status = doc.MoveToFirstChild(1)
 // url
 set status = doc.MoveToFirstChild(1)
 set count = 0
 for {
	 // loc
	 set status = doc.MoveToFirstChild(1)
	 // text = url
	 kill text
	 set status = doc.GetText(.text)
	 if text [ "/post" {
		 set ^||dccontents($increment(count)) = text
	 }	 
	 // url
	 set status = doc.MoveToParent(1)
	 // next url
	 set status = doc.MoveToNextSibling(1)
	 if 'status quit	 
 }
 set ^||dccontents = count
 quit status
}

ClassMethod BuildDCContentsDB() As %Status
{
 set status = $$$OK
 
 if '$data(^||dccontents) {
	 write "contents url not setup",!
	 write "run ##class(DC.Tools).CollectDCContentsUrl() first",!
	 quit $$$OK
 }
 
 set start = $piece($zts,",",2)
 do ##class(DC.Topic).%KillExtent()
 
 write "total # of contents = ",^||dccontents,!

 for i= 1:1:^||dccontents {
	 set url = $get(^||dccontents(i))
	 set protocol = $piece(url,":")
	 set https = $select(protocol="https":1,1:0)
	 set server = $piece(url,"/",3)
	 set httprequest = ##class(%Net.HttpRequest).%New()
	 set httprequest.Server = server
	 set httprequest.Port = 80
	 if https set httprequest.Port = 443
	 set httprequest.Https = https
	 set httprequest.SSLConfiguration = "MYSSL"
	 
	 set status = httprequest.Get(url)
	 set statuscode = httprequest.HttpResponse.StatusCode
	 
	 if statuscode = 200 {
		 write "number ",i, " is processing",!
		 set textstream = httprequest.HttpResponse.Data
		 set length = 360000
		 set textdata = textstream.Read(.length,.status)
		 set contentdb = ##class(DC.Topic).%New()
		 set contentdb.url = url
		 set title = $piece(url,"post/",2)
		 set contentdb.Title = ##class(%CSP.Page).UnescapeURL(title,"UTF8")		 
		 set contentdb.Text = textdata
		 set status = contentdb.%Save()
	 }
	 
	 
 } 
 set end = $piece($zts,",",2)
 write "elapsed time = ",end - start,!
 kill ^||dccontents
 quit status
}

}
