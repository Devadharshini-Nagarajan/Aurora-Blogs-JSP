package neu.edu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import neu.edu.data.UserRegistration;
import neu.edu.data.UserSession;
import neu.edu.database.DatabaseConnector;

public class RegistrationDAO {
	private Connection connection;
	
	public boolean insertUser(UserRegistration userRegistration) {
		boolean isSuccess = true;
		PreparedStatement pst = null;
		
		try {
			connection = DatabaseConnector.getInstance().getConnection();
			pst = connection.prepareStatement("INSERT INTO user (username, password, email, role, first_name, last_name) VALUES (?, MD5(?), ?, ?, ?, ?)");
			pst.setString(1, userRegistration.getUsername());
			pst.setString(2, userRegistration.getPassword());
			pst.setString(3, userRegistration.getEmail());
			pst.setString(4, userRegistration.getRole().USER.toString());
			pst.setString(5, userRegistration.getFirstName());
			pst.setString(6, userRegistration.getLastName());

			int rs = pst.executeUpdate();
		} catch (SQLException e) {
			isSuccess = false;
			e.printStackTrace();
		} finally {
			try {
				pst.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return isSuccess;
	}
}
