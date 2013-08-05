package chat_messenger

import org.apache.commons.lang.builder.HashCodeBuilder

class List_of_employeeAuthority implements Serializable {

	List_of_employee list_of_employee
	Authority authority

	boolean equals(other) {
		if (!(other instanceof List_of_employeeAuthority)) {
			return false
		}

		other.list_of_employee?.id == list_of_employee?.id &&
			other.authority?.id == authority?.id
	}

	int hashCode() {
		def builder = new HashCodeBuilder()
		if (list_of_employee) builder.append(list_of_employee.id)
		if (authority) builder.append(authority.id)
		builder.toHashCode()
	}

	static List_of_employeeAuthority get(long list_of_employeeId, long authorityId) {
		find 'from List_of_employeeAuthority where list_of_employee.id=:list_of_employeeId and authority.id=:authorityId',
			[list_of_employeeId: list_of_employeeId, authorityId: authorityId]
	}

	static List_of_employeeAuthority create(List_of_employee list_of_employee, Authority authority, boolean flush = false) {
		new List_of_employeeAuthority(list_of_employee: list_of_employee, authority: authority).save(flush: flush, insert: true)
	}

	static boolean remove(List_of_employee list_of_employee, Authority authority, boolean flush = false) {
		List_of_employeeAuthority instance = List_of_employeeAuthority.findByList_of_employeeAndAuthority(list_of_employee, authority)
		if (!instance) {
			return false
		}

		instance.delete(flush: flush)
		true
	}

	static void removeAll(List_of_employee list_of_employee) {
		executeUpdate 'DELETE FROM List_of_employeeAuthority WHERE list_of_employee=:list_of_employee', [list_of_employee: list_of_employee]
	}

	static void removeAll(Authority authority) {
		executeUpdate 'DELETE FROM List_of_employeeAuthority WHERE authority=:authority', [authority: authority]
	}

	static mapping = {
		id composite: ['authority', 'list_of_employee']
		version false
	}
}
