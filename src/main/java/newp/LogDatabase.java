package newp;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LogDatabase {
	public boolean validate(loginbean login) throws ClassNotFoundException {
		boolean status = false;
		Class.forName("com.mysql.cj.jdbc.Driver");
		try (Connection connection = DriverManager									
				.getConnection("jdbc:mysql://localhost:3306/sefinals?useSSL=false", "root", "admin");
																	
				PreparedStatement ps = connection
						.prepareStatement("SELECT * FROM users WHERE uname = ? and pass = ? ")) {
			ps.setString(1, login.getUname());	
			ps.setString(2, login.getPass());
			
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
