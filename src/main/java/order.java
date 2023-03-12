import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/order")
public class order extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException{
		
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String hadd= request.getParameter("hadd");
		String city = request.getParameter("city");
		String zip = request.getParameter("zip");
		String contact = request.getParameter("contact");
		String email = request.getParameter("email");
		
		RequestDispatcher dp = null;
		Connection con = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sefinals?useSSL=false", "root", "admin");
			PreparedStatement pst = con.prepareStatement("insert into orders(firstname,lastname,hadd,city,zip,contact,email) values(?,?,?,?,?,?,?)");
			
			pst.setString(1,fname);
			pst.setString(2,lname);
			pst.setString(3,hadd);
			pst.setString(4,city);
			pst.setString(5,zip);
			pst.setString(6,contact);
			pst.setString(7,email);
			
			int rowCount = pst.executeUpdate();
			dp = request.getRequestDispatcher("order.jsp");  /////
			if (rowCount > 0) {
				request.setAttribute("status", "success");
				
			}
			else {
				request.setAttribute("status", "failed");
			}
			dp.forward(request,response);
			
			} 
		
		catch (Exception e) {
			e.printStackTrace();
		}
		
		finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}