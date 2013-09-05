package chat_messenger

import org.springframework.dao.DataIntegrityViolationException
import groovy.sql.Sql
import grails.plugins.springsecurity.Secured
@Secured('IS_AUTHENTICATED_FULLY')
class UserController {

	def searchableService
	def dataSource
	def sessionFactory

	def springSecurityService
	
    def index() { 
		def db = new Sql(dataSource)
		def result = db.rows("select * from employee order by first_name asc")
		def employee = Employee.get(springSecurityService.principal.id)
		render(view:"UserMainPage",model:[result:result, employee:employee])
	}
	
	def editUser(){
		def db = new Sql(dataSource)
	
		def firstName = params.firstName
		def lastName = params.lastName
		def password = params.password
		def address = params.address
	
		//db.execute (INSERT INTO employee (first_name,last_name,address,password) 
		//	VALUES('${firstName}','${lastName}','${address}','${password}')");)

		db.execute ("""UPDATE employee
			SET 
				first_name = '${firstName}', 
				last_name = '${lastName}', 
				address = '${address}',
				password = '${password}'
			WHERE """)//id dayun
		//replace everything
		
		//db.execute ("""INSERT INTO employee (first_name,last_name,address,password) 
		//	VALUES('${firstName}','${lastName}','${address}','${password}')""")
	}
}
