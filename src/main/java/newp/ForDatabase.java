package newp;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ForDatabase {
	public boolean validate(forgotbean forgot) throws ClassNotFoundException {
		boolean status = false;
		Class.forName("com.mysql.cj.jdbc.Driver");
		try (Connection connection = DriverManager									
				.getConnection("jdbc:mysql://soundsdreamy.mysql.database.azure.com:3306/sefinals?useSSL=true", "admindreamy", "@Soundsdreamy10");
																	
				PreparedStatement ps = connection
						.prepareStatement("SELECT * FROM users WHERE uname = ? and secQ = ? and secA = ? ")) {
			ps.setString(1, forgot.getUname());	
			ps.setString(2, forgot.getSecQ());
			ps.setString(3, forgot.getSecA());
			
			System.out.println(ps);
			ResultSet resultset = ps.executeQuery();
			status = resultset.next();
		} catch (SQLException e) {
			printSQLException(e);
		}
		return status;
	}
	private void printSQLException(SQLException ex) {
		for (Throwable e : ex) {
			if (e instanceof SQLException) {
				e.printStackTrace(System.err);
				System.err.println("SQLState: " + ((SQLException) e).getSQLState());
				System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
				System.err.println("Message: " + e.getMessage());
				Throwable err = ex.getCause();
				while (err != null) {
					System.out.println("Cause: " + err);
					err = err.getCause();
				}
			}
		}
	}
}
