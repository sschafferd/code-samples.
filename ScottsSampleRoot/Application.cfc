component{
	this.name='SampleCodeWebsite';
	this.applicationTimeout=CreateTimeSpan(10, 0, 0, 0);
	this.sessionManagement=true;
	this.sessionTimeout=CreateTimeSpan(0, 0, 30, 0);
	this.ormEnabled=false;
	this.ormSettings={
		logsql=true,
		dbcreate="update",
		cfclocation="com/entity"
		};
	this.invokeImplicitAccessor=true;
	this.sessionCookie.httpOnly=true;
	this.sessionCookie.timeout='10';
	this.sessionCookie.disableupdate=true;
	
	function onApplicationStart(){
		application.myName='Scott';
		application.myPosition='A Web Developer';
		application.utilities = CreateObject('cfc.utilities');
		application.event = createObject('cfc.Event');
		application.controller = createObject('cfc.Controller');
		application.eventResult = createObject('cfc.eventResult');
		application.viewState = createObject('cfc.ViewState');
		return true;
	}
	
	function onRequestStart(string targetPage){
		if(structKeyExists(url, 'reload')){
			onApplicationStart();
			//ormReload();
		}
	}
	
	function onError( any Exception, string EventName){
		include 'sorry.cfm';
		var errorEmail = new mail();
		errorEmail.setTo('you@domain.com');
		errorEmail.setFrom('system@domain.com');
		errorEmail.setSubject('An Error has Occured');
		errorEmail.setBody('
			Message: #arguments.exception.message# <br />
			Details: #arguments.exception.detail# <br />
			Type: #arguments.exception.type# <br />
		');
		errorEmail.setType('html');
		
		//errorEmail.send();
	}
}