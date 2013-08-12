package chat_messenger

import org.springframework.dao.DataIntegrityViolationException
import groovy.sql.Sql

class UserController {

	def searchableService
	def dataSource
	def sessionFactory

    def index() { 
		def db = new Sql(dataSource)
		def result = db.rows("select * from list_of_employee order by first_name asc")
		render(view:"UserMainPage",model:[result:result])
	}
	
	def editUser(){
		def db = new Sql(dataSource)
	
		def firstName = params.firstName
		def lastName = params.lastName
		def password = params.password
		def address = params.address
	
		//db.execute (INSERT INTO list_of_employee (first_name,last_name,address,password) 
		//	VALUES('${firstName}','${lastName}','${address}','${password}')");)
		
		db.execute ("""UPDATE list_of_employee
			SET 
				first_name = '${firstName}', 
				last_name = '${lastName}', 
				address = '${address}',
				password = '${password}'
			WHERE """)//id dayun
		//replace everything
		
		//db.execute ("""INSERT INTO list_of_employee (first_name,last_name,address,password) 
		//	VALUES('${firstName}','${lastName}','${address}','${password}')""")
	}
}
