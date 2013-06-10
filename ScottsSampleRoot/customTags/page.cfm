<cfif thisTag.executionMode eq "start">
	<cfparam name="attributes.section" default="home" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta name="description" content="My Code Sample Website" />
	<meta name="keywords" content="jquery, Responsive Vcard, Template, Vcard, Clean Slide" />
	<meta http-equiv="X-UA-Compatible" content="IE=9" />
	<meta http-equiv="X-UA-Compatible" content="IE=7" />
	<title>This is my WebSite</title>
	
	<!-- Loading Google Web fonts -->
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css' />
	<link href='http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300,700' rel='stylesheet' type='text/css' />
	<link href='http://fonts.googleapis.com/css?family=IM+Fell+DW+Pica' rel='stylesheet' type='text/css' />
	<link href='http://fonts.googleapis.com/css?family=Droid+Sans:400,700' rel='stylesheet' type='text/css' />
	
	<!-- CSS Files -->
	<link href="assets/css/reset.css" rel="stylesheet" type="text/css" />
	<link href="assets/css/style.css" rel="stylesheet" type="text/css"  id="color" />
	<link href="assets/css/typography.css" rel="stylesheet" type="text/css"  id="customFont"/>
	<link href="assets/css/arial_content.css" rel="stylesheet" type="text/css"  id="contentfont"/>
	
	<!-- include jQuery library -->
	<script type="text/javascript" src="assets/js/jquery-1.7.min.js"></script>

	<script src="assets/js/raphael.js" type="text/javascript"></script>

	<script>
		window.onerror = function(msg, url, linenumber){
		    alert('Error message: ' + msg + '\nURL: ' + url + '\nLine Number: ' + linenumber);
			
		    return true
		}
		
		//Build JSON SkillsObj so it can be used on any page
		var skills = '{"skills":[' +
		'{"skillName":"ColdFusion <br />5,MX,7,8,10","skillType":"Coding" },' +
		'{"skillName":"JavaScript","skillType":"Coding" },' +
		'{"skillName":"XML/XSLT","skillType":"Customization" },' +
		'{"skillName":"JSON","skillType":"Coding" },' +
		'{"skillName":"ASP.NET/C#","skillType":"Coding" },' +
		'{"skillName":"SQL","skillType":"Coding" }]}';
		
		skillsObj = JSON.parse(skills);
		
	</script>

	<cfif attributes.section eq "resume">
		<script>
			//create work experience xhtml from sample2 XML using XSLT and populate innerXML
			//This is called from CustomTags/page.cfm using onload event in body tag
			
			 function loadXMLDoc(dname)
			 {
			 if (window.ActiveXObject)
			   {
			   xhttp=new ActiveXObject("Msxml2.XMLHTTP.3.0");
			   }
			 else
			   {
			   xhttp=new XMLHttpRequest();
			   }
			 xhttp.open("GET",dname,false);
			 xhttp.send("");
			 return xhttp.responseXML;
			 }
			
			 function displayResult()
			 {			
			 xml=loadXMLDoc("XmlSamples/sample2.xml");
			 xsl=loadXMLDoc("XmlSamples/sample2.xsl");
			 
			 // code for IE
			 if (window.ActiveXObject)
			   {
			   ex=xml.transformNode(xsl);
	
			   document.getElementById("WorkExperience").innerHTML=ex;
			   }
			 // code for Mozilla, Firefox, Opera, etc.
			 else if (document.implementation && document.implementation.createDocument)
			   {
			   xsltProcessor=new XSLTProcessor();
			   xsltProcessor.importStylesheet(xsl);
			   resultDocument = xsltProcessor.transformToFragment(xml,document);
			   document.getElementById("WorkExperience").appendChild(resultDocument);
			   }
			 }	
		</script>
	</cfif>


</head>
	
<body <cfif attributes.section eq "resume">onload="displayResult()"</cfif>>

	<!-- wrapper -->
	<div class="clr" id="top-head">&nbsp;</div>
	<div id="container">
		<!--header -->
		<div id="header" >
			<div class="logo-bg" >
				<!--logo -->
				<div class="logo">
					<img src="assets/images/logo.png" alt="Logo" width="202" height="52" border="0"  id="logo" />
				</div>
				
				<!--head right -->
				<div class="right">
				
					<!--// Navigation //-->
					<div class="menu_nav">
						<div id="nav-wrap">
							<ul class="arrowunderline" id="nav">
								<li class="home" <cfif attributes.section eq "home">id="selected"</cfif>><a href="index.cfm">Home</a></li>
								<li class="about" <cfif attributes.section eq "about">id="selected"</cfif>><a href="about.cfm">About</a></li>
								<li class="resume" <cfif attributes.section eq "resume">id="selected"</cfif>><a href="resume.cfm">Resume</a></li>
								<li class="contact" <cfif attributes.section eq "contact">id="selected"</cfif>><a href="contact.cfm">Contact</a></li>	
							</ul>
						</div>
					</div>
					<!--// Navigation End //-->
				</div>
				<!--// -head right end //-->
			</div>
			<!--// logo bg end //-->
		</div>
		<!--header end -->
		
<cfelse>
	
				<div class="clr"></div>
			</div><!--card pattern end -->
			<div class="clr "></div>
		</div>		  <!--content end -->	
		<div class="bottom-shade"></div>
	</div>  <!--Container / wrapper end -->	
	
<cfif attributes.section eq "resume">	
	<script>
		
	//Create education XML Document object from sample XML and fill in innerHTML elements

	 if (window.XMLHttpRequest)
	   {// code for IE7+, Firefox, Chrome, Opera, Safari
	   xmlhttp=new XMLHttpRequest();
	   }
	 else
	   {// code for IE6, IE5
	   xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	   }
	 xmlhttp.open("GET","XmlSamples/sample.xml",false);
	 xmlhttp.send();
	 xmlDoc=xmlhttp.responseXML;

	 document.getElementById("schoolName1").innerHTML=
	 xmlDoc.getElementsByTagName("School")[0].childNodes[0].nodeValue;
	 document.getElementById("degreeName1").innerHTML=
	 xmlDoc.getElementsByTagName("Degree")[0].childNodes[0].nodeValue;
	 document.getElementById("yearEarned1").innerHTML=
	 xmlDoc.getElementsByTagName("Year")[0].childNodes[0].nodeValue;
	 
	 document.getElementById("schoolName2").innerHTML=
	 xmlDoc.getElementsByTagName("School")[1].childNodes[0].nodeValue;
	 document.getElementById("degreeName2").innerHTML=
	 xmlDoc.getElementsByTagName("Degree")[1].childNodes[0].nodeValue;
	 document.getElementById("yearEarned2").innerHTML=
	 xmlDoc.getElementsByTagName("Year")[1].childNodes[0].nodeValue;
 </script>

	<script>
		
		//JSON skillsObj created in CustomTags/page.cfm
		
		document.getElementById("skill1").innerHTML=skillsObj.skills[0].skillName 
		document.getElementById("skill2").innerHTML=skillsObj.skills[1].skillName 
		document.getElementById("skill3").innerHTML=skillsObj.skills[2].skillName 
		document.getElementById("skill4").innerHTML=skillsObj.skills[3].skillName 
		document.getElementById("skill5").innerHTML=skillsObj.skills[4].skillName 
		document.getElementById("skill6").innerHTML=skillsObj.skills[5].skillName 
	</script>

<cfelseif (attributes.section eq "home")>
	
	<script>
		
		//JSON skillsObj created in CustomTags/page.cfm
		
		document.getElementById("skillName1").innerHTML=skillsObj.skills[0].skillName 
		document.getElementById("skillType1").innerHTML=skillsObj.skills[0].skillType 
		document.getElementById("skillName2").innerHTML=skillsObj.skills[1].skillName 
		document.getElementById("skillType2").innerHTML=skillsObj.skills[1].skillType 
		document.getElementById("skillName3").innerHTML=skillsObj.skills[2].skillName 
		document.getElementById("skillType3").innerHTML=skillsObj.skills[2].skillType 
		document.getElementById("skillName4").innerHTML=skillsObj.skills[3].skillName 
		document.getElementById("skillType4").innerHTML=skillsObj.skills[3].skillType 
		document.getElementById("skillName5").innerHTML=skillsObj.skills[4].skillName 
		document.getElementById("skillType5").innerHTML=skillsObj.skills[4].skillType 
		document.getElementById("skillName6").innerHTML=skillsObj.skills[5].skillName 
		document.getElementById("skillType6").innerHTML=skillsObj.skills[5].skillType 
	</script>

</cfif>

</body>
</html>
</cfif>		