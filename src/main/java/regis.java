import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/register")
public class regis extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException{
	    

		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String birthdate= request.getParameter("birthdate");
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		String uname = request.getParameter("uname");
		String pass = request.getParameter("pass");
		String ques = request.getParameter("secQ");
		String ans = request.getParameter("secA");
		String query = "SELECT uname, email FROM users WHERE uname = ? OR email = ?";
		String query2 = "insert into users(fname,lname,birthdate,gender,email,uname,pass,secQ,secA) values(?,?,?,?,?,?,?,?,?)";
		RequestDispatcher dp = null;
		Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://soundsdreamy.mysql.database.azure.com:3306/", "admindreamy", "@Soundsdreamy10");
			pstmt = con.prepareStatement(query);
	         pstmt.setString(1, uname);
	         pstmt.setString(2, email);
	         rs = pstmt.executeQuery();
	         dp = request.getRequestDispatcher("register.jsp");  /////
	       
	         
	         if (rs.next()) {
	        	
	        	 request.setAttribute("status", "regisFailedUname");
	        	 dp = request.getRequestDispatcher("register.jsp");
	        	 dp.forward(request,response);
	          }   
	         else{
	        
	        	 pstmt = con.prepareStatement(query2);
			
	        	 pstmt.setString(1,fname);
	        	 pstmt.setString(2,lname);
	        	 pstmt.setString(3,birthdate);
	        	 pstmt.setString(4,gender);
	        	 pstmt.setString(5,email);
	        	 pstmt.setString(6,uname);
	        	 pstmt.setString(7,pass);
	        	 pstmt.setString(8,ques);
	        	 pstmt.setString(9,ans);
			
				int rowCount = pstmt.executeUpdate();
			
				if (rowCount > 0) {
					request.setAttribute("status", "regisSuccess");
					dp = request.getRequestDispatcher("login.jsp");
								}
				else {
					request.setAttribute("status", "regisFailed");
					dp = request.getRequestDispatcher("register.jsp");
					}
				dp.forward(request,response);
	         	}
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
