package chat_messenger

class List_of_employee {

	transient springSecurityService

	
	String firstName;
	String lastName;
	String address;
	String username;
	String password;
	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	
	

    static constraints = {
		firstName(blank:false)
		lastName(blank:false)
		address(blank:false)
		username blank: false, unique: true
		password blank: false
    }
	

	static mapping = {
		password column: '`password`'
	}

	Set<Authority> getAuthorities() {
		List_of_employeeAuthority.findAllByList_of_employee(this).collect { it.authority } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}
}
