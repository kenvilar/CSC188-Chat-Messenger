package chat_messenger

class List_of_employee {

	String firstName;
	String lastName;
	String address;
	String userName;

    static constraints = {
		firstName(blank:false)
		lastName(blank:false)
		address(blank:false)
		userName(blank:false)
    }
}
