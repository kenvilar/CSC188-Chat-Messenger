package chat_messenger

import org.springframework.dao.DataIntegrityViolationException

import grails.plugins.springsecurity.Secured

@Secured('IS_AUTHENTICATED_FULLY')

import org.icepush.PushContext
import org.codehaus.groovy.grails.web.context.ServletContextHolder as SCH
class MessageController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def springSecurityService
	
    def index() {
       
    }
	
	private lookupEmployee() {
		Employee.get(springSecurityService.principal.id)
	}
	
	def startConversation(){
		def employeeInstance = Employee.get(params.id)
	//	def messages = currentConversation(employeeInstance)
	//	return [messages: messages, employeeInstance: employeeInstance]		
		[employeeInstance: employeeInstance]
	}
	
	
	def sendMessage() {
		println "the parameters are : " + params
		def employeeInstance = Employee.get(params.id)
		def message = new Message(message: params.message)	
		message.sender = lookupEmployee()
		message.receiver = Employee.get(params.id)
		message.save()
		def messages = currentConversation(employeeInstance)
		render (view: 'showConversation', model: [employeeInstance: employeeInstance])
		 
	}
	
	def displayConversation={
		println "ang mga parameters kaiiiii : " + params
		println "ang employee kai : " + Employee.get(params.id)
		def messages = currentConversation(Employee.get(params.id))
		if(messages.size() == 0){
			println "walay sulod ang conversation"
		}
		else{
			println "ang sulod sa messages kai : " + messages
			render(template:"chatUpdate",model:[messages:messages])
		}
	
	}
	
	def push(String s) {
        PushContext.getInstance(SCH.servletContext).push s
    }
	
	
	private currentConversation(Employee e) {
		def emp = lookupEmployee()		
		def query = Message.where{
			( (sender == emp && receiver == e)  || (sender == e && receiver == emp) )			
		}.order 'dateCreated', 'desc'
		def messages = query.list(max: 10)
		messages
	}
	   

    

   
}
