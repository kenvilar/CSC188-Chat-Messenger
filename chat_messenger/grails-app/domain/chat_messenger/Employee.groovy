package chat_messenger

class Employee {

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

	static searchable = [only: ['firstName', 'lastName']]
	static constraints = {
		username blank: false, unique: true
		password blank: false
	}

	static mapping = {
		password column: '`password`'
	}

	Set<Authority> getAuthorities() {
		EmployeeAuthority.findAllByEmployee(this).collect { it.authority } as Set
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
