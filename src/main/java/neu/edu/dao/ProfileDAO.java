package neu.edu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import neu.edu.database.DatabaseConnector;

public class ProfileDAO {
	private Connection connection;
	
	public boolean updateBasicDetails(String email, String firstName, String lastName, String userName) {
		boolean isSuccess = true;
		PreparedStatement pst = null;
		
		try {
			connection = DatabaseConnector.getInstance().getConnection();
			pst = connection.prepareStatement("UPDATE user SET email=?, first_name=?, last_name=? WHERE username=?");
			pst.setString(1,email);
			pst.setString(2,firstName);
			pst.setString(3,lastName);
			pst.setString(4,userName);
			
			int rs = pst.executeUpdate();
			if(rs == 0) {
				isSuccess = false;
			}
		} catch (SQLException e) {
			isSuccess = false;
			e.printStackTrace();
		} finally {
			try {
				pst.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return isSuccess;
	}

	public boolean updatePasswordDetails(String password, String userName) {
		boolean isSuccess = true;
		PreparedStatement pst = null;
		
		try {
			connection = DatabaseConnector.getInstance().getConnection();
			pst = connection.prepareStatement("UPDATE user SET password=MD5(?) WHERE username=?");
			
			pst.setString(1,password);
			pst.setString(2,userName);
			
			int rs = pst.executeUpdate();
			System.out.println(rs);
			if(rs == 0) {
				isSuccess = false;
			}
		} catch (SQLException e) {
			isSuccess = false;
			e.printStackTrace();
		} finally {
			try {
				pst.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return isSuccess;
	}
}
