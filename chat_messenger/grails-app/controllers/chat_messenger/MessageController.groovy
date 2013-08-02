package chat_messenger

import org.springframework.dao.DataIntegrityViolationException

import grails.plugins.springsecurity.Secured

@Secured('IS_AUTHENTICATED_FULLY')

class MessageController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def springSecurityService
	
    def index() {
       
    }
	
	private lookupEmployee() {
		Employee.get(springSecurityService.principal.id)
	}
	
	def showConversation(){
		def employeeInstance = Employee.get(params.id)
		def messages = currentConversation(employeeInstance)
		return [messages: messages, employeeInstance: employeeInstance]		
		
	}
	
	def renderView(){
		
	}
	def sendMessage() {
		def employeeInstance = Employee.get(params.id)
		def message = new Message(message: params.message)	
		message.sender = lookupEmployee()
		message.receiver = Employee.get(params.id)
		message.save()
		def messages = currentConversation(employeeInstance)
		render (view: 'showConversation', model: [messages:messages, employeeInstance: employeeInstance]) 
	}
	
	private currentConversation(Employee e) {
		def emp = lookupEmployee()		
		def query = Message.where{
			( (sender == emp && receiver == e)  || (sender == e && receiver == emp) )
			
		}.order 'dateCreated', 'desc'
		def messages = query.list(max: 10)
		println "ang mga messages kai " + messages
		messages
	}
	
    

    

    

   
}
