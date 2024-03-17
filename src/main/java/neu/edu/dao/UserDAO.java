package neu.edu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import neu.edu.data.UserRegistration;
import neu.edu.data.converter.UserConverter;
import neu.edu.database.DatabaseConnector;

public class UserDAO {
	private Connection connection;
	
	public UserDAO() {

	}
	
	public List<UserRegistration> getList() {
		PreparedStatement pst = null;
		
		List<UserRegistration> users = new ArrayList<UserRegistration>();
		
		try {
			connection = DatabaseConnector.getInstance().getConnection();
			pst = connection.prepareStatement("SELECT * FROM user");
			
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				UserRegistration user = UserConverter.toUser(rs);
				users.add(user);
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
		
		
		return users;
		
	}
	
	public UserRegistration getUser(String username) {
		PreparedStatement pst = null;
		UserRegistration user = new UserRegistration();
		
		try {
			connection = DatabaseConnector.getInstance().getConnection();
			pst = connection.prepareStatement("SELECT * FROM user WHERE username=?");
			pst.setString(1,username);
			
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				user = UserConverter.toUser(rs);
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
		
		return user;
	}
	
	public boolean deleteUser(String userName) {
		boolean isSuccess = true;
		PreparedStatement pst = null;
		
		try {
			connection = DatabaseConnector.getInstance().getConnection();
			pst = connection.prepareStatement("DELETE FROM user WHERE username=?");
			pst.setString(1, userName);

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
