package chat_messenger

import org.springframework.dao.DataIntegrityViolationException
import groovy.sql.Sql

class ModeratorController {

	def searchableService
	def dataSource
	def sessionFactory

    def index() { 
		render(view:"moderatorMainPage")
	}

	def addEmployee() {
		def db = new Sql(dataSource)

		def firstName = params.firstName
		def lastName = params.lastName
		def address = params.address
		def userName = params.userName
		
		def exist_username = db.rows("select user_name from list_of_employee")

		Date now = new Date()
		def date = g.formatDate(format:"yyyy", date:new Date())
		[date:date]

		Random random = new Random()
		String idCode = (String) random.nextInt(9000) + 1000

		String idNumber = date+"-"+idCode
		
		if(exist_username.user_name.contains(userName)) {
			index()
			render "The username you entered is already exist!"
		}else {
			db.execute("""insert into list_of_employee(id,first_name,last_name,address,user_name) 
				   values('${idNumber}','${firstName}','${lastName}','${address}','${userName}')""");
		}
		
		index()
	}

}
