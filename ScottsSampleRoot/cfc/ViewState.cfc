<cfcomponent>
	<cfproperty name="data" type="struct" />

	<cffunction name="init" output="false">
		
		<cfreturn this />
	</cffunction>

	<cffunction name="getValue" access="public" output="false" returntype="any">
		<cfargument name="argDataName" type="string" required="true" />
		<cfreturn StructFind(variables.data, "#arguments.argDataName#") />
		
	</cffunction>

	<cffunction name="getValues" access="public" output="false" returntype="any">
		<cfreturn variables.data />
		
	</cffunction>

	<cffunction name="setData" access="public" output="false" returntype="void">
		<cfargument name="argData" type="struct" required="true" />
		<cfset variables.data = arguments.argData />
		
	</cffunction>

</cfcomponent>