<html>
<head>
    
    <title>Instant Message</title>
    <g:javascript library="jquery" plugin="jquery" />
	<icep:bridge/>
</head>
<body>
    
 
    <h1>
		Now talking to <br>
		<g:if test="${employeeInstance?.username}">
			${employeeInstance.firstName} ${employeeInstance.lastName}
		</g:if>
	</h1>
		<g:form action="sendMessage" >
				
					<g:hiddenField name="id" value="${employeeInstance?.id}" />
					<g:textArea name="message" value="" id="messageArea" /><br/>
				
					<g:submitButton name="send" class="" value="Send Message" />
				
		</g:form>
    <div>
	
		 
		
		
		<g:each in="${messages}" status="i" var="message">
			<strong>${message.sender.realName} said</strong>
			${message.message}<br/>
			<div class="messageTime">at <g:formatDate date="${message.dateCreated}"/></div>
		</g:each>
		
    </div>
	<div>
		
		
	</div>
</body>
</html>