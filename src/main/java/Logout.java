
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;


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
