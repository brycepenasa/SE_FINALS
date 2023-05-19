package newp;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
//import java.sql.ResultSet;

@WebServlet("/feedbackpage")
public class feedbackReply extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException{
	    
		int productid = Integer.parseInt(request.getParameter("id"));
		String uname = request.getParameter("userfeedback");
		String reply = request.getParameter("reply");

		RequestDispatcher dispatcher = null;
		Connection con = null;
	
	   
	    try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://soundsdreamy.mysql.database.azure.com:3306/sefinals", "admindreamy", "@Soundsdreamy10");
			PreparedStatement pst = con.prepareStatement("update feedbacks set admin_reply = ? where uname = ? and productid = ?");
			pst.setString(1, reply);
			pst.setString(2, uname);
			pst.setInt(3, productid);

			int rowCount = pst.executeUpdate();
			if (rowCount > 0) {
				request.setAttribute("status", "replySuccess");
				dispatcher = request.getRequestDispatcher("feedbackpage.jsp?id=%productid%");
			} else {
				request.setAttribute("status", "replyFailed");
				dispatcher = request.getRequestDispatcher("feedbackpage.jsp?id=%productid%");
			}
			dispatcher.forward(request, response);
		} catch (Exception e) {
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
