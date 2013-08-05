package chat_messenger

class List_of_employee {

	String firstName;
	String lastName;
	String address;
	String userName;
	String password

    static constraints = {
		firstName(blank:false)
		lastName(blank:false)
		address(blank:false)
		userName(blank:false)
		password(blank:false)
    }
}
