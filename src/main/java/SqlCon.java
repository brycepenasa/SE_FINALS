
import java.sql.*;
public class SqlCon {

	
	public static Connection getCon()
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://soundsdreamy.mysql.database.azure.com:3306/","admindreamy","@Soundsdreamy10");
			return con;
		}
		catch(Exception e)
		{
			System.out.print(e);
			return null;
		}
	}
}
