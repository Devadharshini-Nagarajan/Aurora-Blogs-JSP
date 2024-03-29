package neu.edu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import neu.edu.data.UserRegistration;
import neu.edu.data.UserSession;
import neu.edu.database.DatabaseConnector;

public class LoginDAO {

	private Connection connection;

	public LoginDAO() {

	}

	public UserSession validateLogin(String username, String password) {

		PreparedStatement pst = null;
		UserSession userSession = null;

		try {
			connection = DatabaseConnector.getInstance().getConnection();
			pst = connection.prepareStatement("SELECT * FROM user WHERE username=? and password=MD5(?)");
			pst.setString(1, username);
			pst.setString(2, password);

			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				String usernameFromDB = rs.getString("username");
				String emailFromDB = rs.getString("email");
				String roleFromDB = rs.getString("role");
				String firstNameFromDB = rs.getString("first_name");
				String lastNameFromDB = rs.getString("last_name");
				System.out.println(usernameFromDB);

				userSession = new UserSession(usernameFromDB, emailFromDB, roleFromDB, firstNameFromDB, lastNameFromDB);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pst.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return userSession;

	}

}