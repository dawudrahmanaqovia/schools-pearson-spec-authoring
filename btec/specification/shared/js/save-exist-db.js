IO.setSaveXMLFunction(function(xmlURI, xmlDocument){

alert('>> Saving:'+xmlURI);
/*

Old code to create a filename automatically however this would not work long term
var fileNameAndPath = ' ' + xmlURI;
fileNameAndPath = fileNameAndPath.replace(/.*?WYSIWYM\//,'');
fileNameAndPath = fileNameAndPath.replace(/\//,'_');
fileNameAndPath = fileNameAndPath.replace(/\//,'_');*/

x = xmlDocument.getElementsByTagName("save_file_name")[0];
y = x.childNodes[0];
save_file_name = y.nodeValue;

/* 
Apache Configuration need to use save to local host from javascript without cross site error

ProxyRequests Off
ProxyPreserveHost On
ProxyPass	/spec/  http://localhost:8080/exist/rest/specification/

http://kode1100.com:8080/exist/rest/specification/

*/

var response = HTTPTools.putXML('/spec/'+save_file_name,xmlDocument,'UTF8');

if( response) alert(response)
else alert(save_file_name + ' saved successfully')

});
