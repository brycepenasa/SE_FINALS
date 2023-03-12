

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import jakarta.servlet.http.HttpSession;

public class Logout extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	RequestDispatcher rs = null;
		
	HttpSession session = request.getSession();
	session.removeAttribute("uname");
	request.setAttribute("status", "logoutSuccess");
	 rs = request.getRequestDispatcher("login.jsp");	
		rs.include(request, response);
	}

}
