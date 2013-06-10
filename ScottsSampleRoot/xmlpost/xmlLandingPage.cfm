<cfparam name="form.event" default="">
<cfset event = application.event.init(form) />

<!--- Pass the event to the controller to handle --->
<cfset eventResult = application.controller.handleEvent(event) />
 
<!--- Display the result --->
<cfoutput>#eventResult.getOutput()#</cfoutput>

