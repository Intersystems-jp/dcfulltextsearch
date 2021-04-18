Class DC.REST Extends %Base [ Language = objectscript ]
{

ClassMethod getURLs(pKeyword As %String) As %Status
{

  set status = $$$OK
  	
  set result=##class(%SQL.Statement).%ExecDirect(,"SELECT id,title,url FROM DC.Topic WHERE %ID %FIND Search_Index(textindex,?)",.pKeyword)

  set resultset = result.%CurrentResult
  
  set urls = []

  While resultset.%Next(.sc) {

    If $$$ISERR(sc) quit
    
    set item = {}
		
	set item.id = resultset.id
	set item.title = resultset.title
	set item.url = resultset.url
	
	do urls.%Push(item)
		
  }
  write urls.%ToJSON()
  
  quit status
}

}
