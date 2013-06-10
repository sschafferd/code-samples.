<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
	<head>
		<script>
			window.onerror = function(msg, url, linenumber){
			    alert('Error message: ' + msg + '\nURL: ' + url + '\nLine Number: ' + linenumber)
			    return true
			}
			
		</script>
	</head>
	
	<body>
		<div class="clr">
			<cfoutput>
			<cfset SampleXmlFormData = viewState.getValue('SampleXmlForm') />
			<cfif (isDefined("SampleXmlFormData"))>
				<cfset ParsedXML = XmlParse(SampleXmlFormData)>
				<cfif isXML(ParsedXML)>	
					<cfset selectedJobElements = xmlSearch(parsedXML,"/ResumeListings/Jobs/job/Company")>
					sampleXML contains #ArrayLen(selectedJobElements)# jobs.<br />
					<cfset CountVar = 0> 
					<ul>
					<cfloop condition = "CountVar LESS THAN ArrayLen(selectedJobElements)"> 
					    <cfset CountVar = CountVar + 1> 
					    <li>#selectedJobElements[CountVar].XmlText#</li> 
					</cfloop>
					</ul>
	
					<cfset selectedEducatonElements = xmlSearch(parsedXML,"/ResumeListings/Education/Schools/School")>
					sampleXML contains #ArrayLen(selectedEducatonElements)# Schools.<br />
					<cfset CountVar = 0> 
					<ul>
					<cfloop condition = "CountVar LESS THAN ArrayLen(selectedEducatonElements)"> 
					    <cfset CountVar = CountVar + 1> 
						<li>School number #CountVar#
							<cfset CountChildrenVar = 0>
							<cfset educationRecords = ArrayNew(1)>
							<ul>
							<cfloop condition = "CountChildrenVar LESS THAN ArrayLen(selectedEducatonElements[CountVar].XmlChildren)">
								<cfset CountChildrenVar = CountChildrenVar + 1> 
								<li>#selectedEducatonElements[CountVar].XmlChildren[CountChildrenVar].XmlName# is #selectedEducatonElements[CountVar].XmlChildren[CountChildrenVar].XmlText#</li> 
							</cfloop>
							</ul>
						</li>
					</cfloop>
					</ul>
				<cfelse>
					sampleXML form variable did not contain valid XML.
				</cfif>
				<cfdump var="#parsedXML#" />
			<cfelse>
				sampleXML form variable found.
			</cfif>
			</cfoutput>
		</div>
	</body>
</html>