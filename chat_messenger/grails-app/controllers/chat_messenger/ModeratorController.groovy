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
		println "ang mga parameter kai " + params
		
		def firstName = params.firstName
		def lastName = params.lastName
		def address = params.address
		def username = params.userName
		def password = params.password
		def confirmPassword = params.confirmPassword
		
		def exist_username = db.rows("select username from employee")
		def exist_pasword = db.rows("select password from employee")

		Date now = new Date()
		def date = g.formatDate(format:"yyyy", date:new Date())
		[date:date]

		Random random = new Random()
		String idCode = (String) random.nextInt(9000) + 1000

		String idNumber = date+"-"+idCode
		
		if(exist_username.username.contains(username) || exist_pasword.password.contains(password)) {
			index()
			render "The username or password you entered is already exist!"
		}else {
			switch(password) {
				case confirmPassword:
					//db.execute("insert into employee (first_name,last_name,address,username,password) values('${firstName}','${lastName}','${address}','${username}','${password}')");
					params.put('enabled', true)
					def employee = new Employee(params)
					if(employee.save(flush: true))
						println "na save sya!"
					
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
