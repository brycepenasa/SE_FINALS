package newp;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
//import java.sql.ResultSet;

@WebServlet("/productpage2")
public class feedback extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException{
	    
		HttpSession session = request.getSession();
		String uname = (String) session.getAttribute("uname");
		String rating= request.getParameter("rating");
		String review = request.getParameter("review");
		int productid = Integer.parseInt(request.getParameter("id"));
	//	Part picture = request.getPart("picture");
		String query = "SELECT COUNT(*) FROM feedbacks WHERE productid = ? AND uname = ?";
		String query2 = "insert into feedbacks(uname,rating,review,productid) values(?,?,?,?)";
		String query3 = "update feedbacks set rating = ?, review = ? where uname = ? and productid = ?";
		String query4= "SELECT id, uname, status FROM productorders WHERE uname =?";
		RequestDispatcher dp = null;
		Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    PreparedStatement pstmt2 = null;
	    PreparedStatement pstmt3 = null;
	   
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://soundsdreamy.mysql.database.azure.com:3306/sefinals", "admindreamy", "@Soundsdreamy10");
			
			pstmt3 = con.prepareStatement(query4);
			pstmt3.setString(1, uname);
			rs = pstmt3.executeQuery();
			while(rs.next()){
				int pid = rs.getInt("id");
				String puname = rs.getString("uname");
				String pstatus = rs.getString("status");
				
				if(puname.equals(uname) && pstatus.equals("DELIVERED") && pid == productid){
					
					pstmt = con.prepareStatement(query);
					pstmt.setInt(1, productid);
					pstmt.setString(2, uname);
			         rs = pstmt.executeQuery();
			         rs.next();
			         int count = rs.getInt(1);
			           
			        // InputStream fileInputStream = picture.getInputStream();
			         if(count > 0) {
			        	 pstmt2 = con.prepareStatement(query3);
			        	 	pstmt2.setString(1, rating);
			 				pstmt2.setString(2, review);
			 				pstmt2.setString(3, uname);
			 				pstmt2.setInt(4, productid);
			 			int rowCount = pstmt2.executeUpdate();
			 			if (rowCount > 0) {
							request.setAttribute("status", "updateSuccess");
						dp = request.getRequestDispatcher("productpage2.jsp?id=%productid%");
						
										}
						else {
						request.setAttribute("status", "updateFailed");
						dp = request.getRequestDispatcher("productpage2.jsp?id=%productid%");
						
							}
						
			          }   
			         else{
				
			        	 pstmt = con.prepareStatement(query2);
					
			        	 pstmt.setString(1,uname);
			        	 pstmt.setString(2,rating);
			        	 pstmt.setString(3,review);
			        	 pstmt.setInt(4,productid);
			        //	 pstmt.setBinaryStream(5, fileInputStream, (int) picture.getSize());
			        	
					
						int rowCount = pstmt.executeUpdate();
					
						if (rowCount > 0) {
						request.setAttribute("status", "feedbackSuccess");
						dp = request.getRequestDispatcher("productpage2.jsp?id=%productid%");
							
										}
						else {
					request.setAttribute("status", "feedbackFailed");
						dp = request.getRequestDispatcher("productpage2.jsp?id=%productid%");
						
							}	
			         	}
									
				}
				else {
					request.setAttribute("status", "feedbackOrderFailed");
				dp = request.getRequestDispatcher("productpage2.jsp?id=%productid%");	
				}
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
