<cfcomponent output="true">
	<cfproperty name="output" type="any" />

	<cffunction name="init" output="false">
		<cfargument name="argData" type="struct" required="false" />
		
		<cfreturn this />
	</cffunction>

	<cffunction name="getOutput" access="public" output="false" returntype="any">
		<cfreturn output />
		
	</cffunction>

	<cffunction name="setOutput" access="public" output="false" returntype="void">
		<cfargument name="argOutput" type="any" required="true" />
		<cfset output=argOutput />
		
	</cffunction>

</cfcomponent>