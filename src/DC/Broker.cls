Class DC.Broker Extends %CSP.REST [ Language = objectscript ]
{

Parameter CONVERTINPUTSTREAM = 1;

Parameter HandleCorsRequest = 1;

XData UrlMap
{
<Routes>
  <Route Url="/Search/:Keyword" Method="GET" Call="DC.REST:getURLs"/>
</Routes>
}

}
