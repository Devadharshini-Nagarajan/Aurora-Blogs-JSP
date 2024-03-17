package neu.edu.data.converter;

import java.sql.ResultSet;
import java.sql.SQLException;

import neu.edu.data.UserRegistration;

public class UserConverter {

	public static UserRegistration toUser(ResultSet rs) {
		UserRegistration user = new UserRegistration();
		
		try {
			user.setUsername(rs.getString("username"));
			user.setFirstName(rs.getString("first_name"));
			user.setLastName(rs.getString("last_name"));
			user.setEmail(rs.getString("email"));
			String roleFromDB = rs.getString("role");
			if(roleFromDB.equalsIgnoreCase("admin")) {
				user.setRole(UserRegistration.Role.ADMIN);
			} else {
				user.setRole(UserRegistration.Role.USER);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}
}
