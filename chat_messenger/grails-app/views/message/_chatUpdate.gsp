

<g:each in="${messages}" status="i" var="message">
			<strong>${message.sender.firstName} said</strong>
			${message.message}<br/>
			<div class="messageTime">at <g:formatDate date="${message.dateCreated}"/></div>
</g:each>