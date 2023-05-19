package newp;

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
import jakarta.servlet.http.HttpSession;
/**
 * Servlet implementation class pass
 */
@WebServlet("/newPassword2")
public class Newp2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		String pass = request.getParameter("pass");
		String confpass = request.getParameter("confpass");
		RequestDispatcher dispatcher = null;
		
		if (pass != null && confpass != null && pass.equals(confpass)) {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://soundsdreamy.mysql.database.azure.com:3306/sefinals?useSSL=true", "admindreamy", "@Soundsdreamy10");
				PreparedStatement pst = con.prepareStatement("update users set pass = ? where email = ? ");
				pst.setString(1, pass);
				pst.setString(2, (String) session.getAttribute("email"));

				int rowCount = pst.executeUpdate();
				if (rowCount > 0) {
					request.setAttribute("status", "resetSuccess");
					dispatcher = request.getRequestDispatcher("login.jsp");
				} else {
					request.setAttribute("status", "resetFailed");
					dispatcher = request.getRequestDispatcher("newPassword2.jsp");
				}
				dispatcher.forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else {
			request.setAttribute("status", "resetFailed");
			dispatcher = request.getRequestDispatcher("newPassword2.jsp");
			dispatcher.forward(request, response);
		}
	}

}
