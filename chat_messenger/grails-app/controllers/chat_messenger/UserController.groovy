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
}
