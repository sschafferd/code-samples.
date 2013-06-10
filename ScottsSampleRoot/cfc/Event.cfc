<cfcomponent>
	<cfset variables.eventName =''>
	<cfset variables.eventAttributes = structNew()>

	<cffunction name="init" output="false">
		<cfargument name="formData" type="struct" required="true" />
		<cfset var name = "" />
		<cfset var eventName = "" />

		<!--- Set all of the form parameters as event attributes --->
		<cfloop item="name" collection="#arguments.formData#">
			<cfset setAttribute(LCase(name),arguments.formData[name]) />
		</cfloop>
		
		<cfset setName(getAttribute('event')) />
		
		<cfreturn this />
	</cffunction>

	<cffunction name="getName" access="public" output="false" returntype="string">
		<cfreturn variables.eventName />
		
	</cffunction>

	<cffunction name="setName" access="public" output="false" returntype="void">
		<cfargument name="argEventName" type="string" required="true" />
		<cfset eventName=argEventName />
		
	</cffunction>

	<cffunction name="getAttribute" access="public" output="false" returntype="string">
		<cfargument name="argEventName" type="string" required="true" />
		<cfreturn StructFind(variables.eventAttributes, LCase("#argEventName#")) />
				
	</cffunction>

	<cffunction name="getAttributes" access="public" output="false" returntype="struct">
		<cfreturn variables.eventAttributes />
				
	</cffunction>
	<cffunction name="setAttribute" access="public" output="false" returntype="void">
		<cfargument name="name" type="string" required="true" />
		<cfargument name="value" type="string" required="true" />
		<cfset structInsert(variables.eventAttributes,name,value)>
		
	</cffunction>

	<cffunction name="hasAttribute" access="public" output="true" returntype="boolean">
		<cfargument name="argEventName" type="string" required="true" />
		
		<cfif StructFind(variables.eventAttributes, LCase('#argEventName#'))>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>

	</cffunction>

</cfcomponent>