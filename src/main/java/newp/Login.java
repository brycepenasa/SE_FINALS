package newp;

import jakarta.servlet.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;

@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private LogDatabase database;

	public void init() {
		database = new LogDatabase();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uname = request.getParameter("uname");
		String pass = request.getParameter("pass");
		String admin= "admin";
		loginbean loginbean = new loginbean();
		loginbean.setUname(uname);
		loginbean.setPass(pass);
		RequestDispatcher rs = null;
			
			try {
				if (database.validate(loginbean)) {
						request.setAttribute("status", "success");
						HttpSession session = request.getSession();
						session.setAttribute("uname", uname);
						System.out.println(uname);
						System.out.println(admin);
						if (uname.equals(admin)){
							rs = request.getRequestDispatcher("home3.jsp");	
							rs.include(request, response);
						}
						else{
							rs = request.getRequestDispatcher("home2.jsp");	
							rs.include(request, response);
						}
						
						 
						
						
				}
				else {
					request.setAttribute("status", "failed");
					 rs = request.getRequestDispatcher("login.jsp");	
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
