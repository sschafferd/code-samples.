<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
	<head>
		<script>
			window.onerror=function(msg, url, linenumber){
			  alert('Error message: '+msg+'\nURL: '+url+'\nLine Number: '+linenumber)
			  return true
			 }
			 
			//Pull Sample XML from web server
			function loadSampleXMLDoc(dname){
				if (window.ActiveXObject) {
					xhttp = new ActiveXObject("Msxml2.XMLHTTP.3.0");
				}
				else {
					xhttp = new XMLHttpRequest();
				}
				xhttp.open("GET", dname, false);
				xhttp.send("");
				
				return xhttp.responseText;
			}
			function getSampleXML(){

			    defaultSampleXML = loadSampleXMLDoc("sample3.xml");
				
				if (typeof defaultSampleXML != "string") {
					throw "defaultSampleXML is not string";
 				}
			    // code for IE
			    if (window.ActiveXObject) {
			        document.getElementById("sampleXmlFromServer").innerHTML = defaultSampleXML;
			    }
			     //code for Mozilla, Firefox, Opera, etc.
			    else 
			        if (document.implementation && document.implementation.createDocument) {
			            document.getElementById("sampleXmlFromServer").appendChild(defaultSampleXML);
			        }
			}
		</script>
	</head>
	
	<body onload="getSampleXML()">
			<!-- Content Start -->
			<div id="content">
					<form id="postSampleXML" action="xmlLandingPage.cfm" name="SampleXmlForm" method="post">
						<input type="hidden" name="event" value="PostXml" />
						<div class="textarea">
							<textarea id="sampleXmlFromServer" name="sampleXML" rows="20" cols="60" class="required"></textarea>
						</div>
						<div>
							<input id="submitBtn" value="Submit"  name="submit" type="submit" class="submitBtn" />
						</div>						
					</form>
			</div>
			<!--content end -->
	</body>
</html>