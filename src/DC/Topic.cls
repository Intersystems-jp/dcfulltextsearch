Class DC.Topic Extends %Persistent [ Language = objectscript ]
{

Property Text As %Text(COLLATION = "SQLUPPER", LANGUAGECLASS = "%TextJapanese", MAXLEN = 3000000);

Property url As %String(MAXLEN = 1000);

Property Title As %String(MAXLEN = 1000);

Index TextIndex On (Text) As %iFind.Index.Basic(INDEXOPTION = 0, LANGUAGE = "ja", LOWER = 1);

Storage Default
{
<Data name="TopicDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Text</Value>
</Value>
<Value name="3">
<Value>url</Value>
</Value>
<Value name="4">
<Value>Title</Value>
</Value>
</Data>
<DataLocation>^DC.TopicD</DataLocation>
<DefaultData>TopicDefaultData</DefaultData>
<IdLocation>^DC.TopicD</IdLocation>
<IndexLocation>^DC.TopicI</IndexLocation>
<StreamLocation>^DC.TopicS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
