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
		def password = params.password
		def confirmPassword = params.confirmPassword
		
		def exist_username = db.rows("select user_name from list_of_employee")
		def exist_pasword = db.rows("select password from list_of_employee")

		Date now = new Date()
		def date = g.formatDate(format:"yyyy", date:new Date())
		[date:date]

		Random random = new Random()
		String idCode = (String) random.nextInt(9000) + 1000

		String idNumber = date+"-"+idCode
		
		if(exist_username.user_name.contains(userName) || exist_pasword.password.contains(password)) {
			index()
			render "The username or password you entered is already exist!"
		}else {
			switch(password) {
				case confirmPassword:
					db.execute("""insert into list_of_employee(id,first_name,last_name,address,user_name,password) 
					           values('${idNumber}','${firstName}','${lastName}','${address}','${userName}','${password}')""");
					index();
					break;
				default:
					index();
					break;
			}
		}
		index()
	}

}
