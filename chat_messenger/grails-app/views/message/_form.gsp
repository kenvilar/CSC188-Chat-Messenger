<%@ page import="chat_messenger.Message" %>



<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'message', 'error')} ">
	<label for="message">
		<g:message code="message.message.label" default="Message" />
		
	</label>
	<g:textField name="message" value="${messageInstance?.message}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'receiver', 'error')} required">
	<label for="receiver">
		<g:message code="message.receiver.label" default="Receiver" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="receiver" name="receiver.id" from="${chat_messenger.Employee.list()}" optionKey="id" required="" value="${messageInstance?.receiver?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'sender', 'error')} required">
	<label for="sender">
		<g:message code="message.sender.label" default="Sender" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="sender" name="sender.id" from="${chat_messenger.Employee.list()}" optionKey="id" required="" value="${messageInstance?.sender?.id}" class="many-to-one"/>
</div>

