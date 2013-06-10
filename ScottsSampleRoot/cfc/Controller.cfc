<cfcomponent>

	<cffunction name="handleEvent" access="public" returnType="struct">
		<cfargument name="event" type="struct" required="true" />

		<cfset var eventResult = "" />
		<cfset var eventName = event.getName() />

		<!--- Check if a function with the same name as the event exists --->
		<cfif isDefined("variables.#eventName#")>
			<cfinvoke method="#eventName#" returnvariable="eventResult">
				<cfinvokeargument name="event" value="#arguments.event#">
			</cfinvoke>
			<cfreturn eventResult />
		</cfif>
		<!--- If the function was not found then throw an error --->
		<cfthrow type="MissingEventHandlerException" />

	</cffunction>

	<cffunction name="PostXml" access="public" output="false" returntype="any">
		<cfargument name="event" type="struct" required="true" />
		
		<!--- Get the form data out of the event --->
		<cfset var SampleXmlForm = arguments.event.getAttribute('samplexml') />

		<!--- Create the output string to return --->
		<cfset var viewState = application.viewState.init() />
		<cfset viewStateData = StructNew()>
		<cfset viewStateData["SampleXmlForm"] = '#SampleXmlForm#'>
		<cfset viewState.setData(viewStateData) />
		    	<cfsavecontent variable="output">
		<cfinclude template="../views/postxml.cfm">
		</cfsavecontent>

		<!--- Create and return the event result --->
		<cfset var eventResult = application.eventResult.init() />
		<cfset eventResult.setOutput(output) />
		<cfreturn eventResult />

	</cffunction>

</cfcomponent>