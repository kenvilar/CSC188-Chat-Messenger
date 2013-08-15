package chat_messenger

import org.apache.commons.lang.builder.HashCodeBuilder

class EmployeeAuthority implements Serializable {

	Employee employee
	Authority authority

	boolean equals(other) {
		if (!(other instanceof EmployeeAuthority)) {
			return false
		}

		other.employee?.id == employee?.id &&
			other.authority?.id == authority?.id
	}

	int hashCode() {
		def builder = new HashCodeBuilder()
		if (employee) builder.append(employee.id)
		if (authority) builder.append(authority.id)
		builder.toHashCode()
	}

	static EmployeeAuthority get(long employeeId, long authorityId) {
		find 'from EmployeeAuthority where employee.id=:employeeId and authority.id=:authorityId',
			[employeeId: employeeId, authorityId: authorityId]
	}

	static EmployeeAuthority create(Employee employee, Authority authority, boolean flush = false) {
		new EmployeeAuthority(employee: employee, authority: authority).save(flush: flush, insert: true)
	}

	static boolean remove(Employee employee, Authority authority, boolean flush = false) {
		EmployeeAuthority instance = EmployeeAuthority.findByEmployeeAndAuthority(employee, authority)
		if (!instance) {
			return false
		}

		instance.delete(flush: flush)
		true
	}

	static void removeAll(Employee employee) {
		executeUpdate 'DELETE FROM EmployeeAuthority WHERE employee=:employee', [employee: employee]
	}

	static void removeAll(Authority authority) {
		executeUpdate 'DELETE FROM EmployeeAuthority WHERE authority=:authority', [authority: authority]
	}

	static mapping = {
		id composite: ['authority', 'employee']
		version false
	}
}
