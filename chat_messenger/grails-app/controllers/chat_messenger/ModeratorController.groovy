package chat_messenger

class ModeratorController {

    def index() { 
		render(view:"moderatorPage")
	}

	def addEmployee() {
		def db = new Sql(dataSource)

		def firstName = params.firstName
		def lastName = params.lastName
		def location = params.location
		def userName = params.userName

		Date now = new Date()
		def date = g.formatDate(format:"yyyy", date:new Date())
		[date:date]

		Random random = new Random()
		String idCode = (String) random.nextInt(9000) + 1000

		String idNumber = date+"-"+idCode

		db.execute("""insert into listOfEmployee(id,firstName,lastName,location,userName) 
					values('${idNumber}','${firstName}','${lastName}','${location}','${userName}')""")

		index()
	}

}
