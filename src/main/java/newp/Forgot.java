package newp;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/forgot")
public class Forgot extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ForDatabase database;

	public void init() {
		database = new ForDatabase();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uname = request.getParameter("uname");
		String secQ = request.getParameter("secQ");
		String secA = request.getParameter("secA");
		
		forgotbean forgotbean = new forgotbean();
		forgotbean.setUname(uname);
		forgotbean.setSecQ(secQ);
		forgotbean.setSecA(secA);
	
		HttpSession session=request.getSession();
			try {
				
				if (database.validate(forgotbean)) {
					request.setAttribute("status", "success");
				session = request.getSession();
				session.setAttribute("uname", uname);
							
					response.sendRedirect("newPassword.jsp"); 
						
				}
				else {
					request.setAttribute("status", "failed");
					RequestDispatcher rs = request.getRequestDispatcher("forgot.jsp");	
					rs.include(request, response);
				}
				
			}
			catch(IOException e){
				response.getWriter().append("An error occurred while communicating with the reCAPTCHA authentication server." + e.toString());
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
	}
}