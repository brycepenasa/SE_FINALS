package newp;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.sql.*;
import java.io.IOException;

@WebServlet("/order")
public class order extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@SuppressWarnings("resource")
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String hadd = request.getParameter("hadd");
		String city = request.getParameter("city");
		String zip = request.getParameter("zip");
		String contact = request.getParameter("contact");
		String email = request.getParameter("email");

		RequestDispatcher dp = null;
		Connection con = null;
		PreparedStatement pst1 = null;
		PreparedStatement pst2 = null;
		PreparedStatement pst3 = null;
		PreparedStatement pst4 = null;
		PreparedStatement pst5 = null;
		ResultSet rs = null;

		try {
			// Get database connection
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sefinals?useSSL=false", "root", "admin");
			HttpSession session = request.getSession();
			String uname = (String) session.getAttribute("uname");
			
			
			// Insert order information into orders table
			pst1 = con.prepareStatement(
					"INSERT INTO orders(firstname, lastname, hadd, city, zip, contact, email,uname) VALUES (?, ?, ?, ?, ?, ?, ?, ?)",
					Statement.RETURN_GENERATED_KEYS);
			pst1.setString(1, fname);
			pst1.setString(2, lname);
			pst1.setString(3, hadd);
			pst1.setString(4, city);
			pst1.setString(5, zip);
			pst1.setString(6, contact);
			pst1.setString(7, email);
			pst1.setString(8, uname);
			int rowCount = pst1.executeUpdate();

			int orderId = -1;
			if (rowCount > 0) {
				// Get the auto-generated orderid from the orders table
				rs = pst1.getGeneratedKeys();
				if (rs.next()) {
					orderId = rs.getInt(1);
				}
			}

			// Insert each cart item into productorders
			if (orderId > 0) {			
				pst3 = con.prepareStatement("SELECT c.id, c.qty, c.name, c.price, c.uname FROM cart c JOIN products p ON c.id = p.id WHERE uname = ?");
				pst3.setString(1, uname);
				rs = pst3.executeQuery();
			
				while (rs.next()) {
					int id = rs.getInt("id");
					String productName = rs.getString("name");
					int quantity = rs.getInt("qty");
					double price = rs.getDouble("price");
					double subtotal = quantity * price; // Calculate subtotal
					
					//DITO
					pst2 = con.prepareStatement(
							"INSERT INTO productorders(id, orderid, name, qty, price, subtotal, uname) VALUES (?, ?, ?, ?, ?, ?, ?)");
					pst2.setInt(1, id);
					pst2.setInt(2, orderId);
					pst2.setString(3, productName);
					pst2.setInt(4, quantity);
				
					pst2.setDouble(5, price);
					pst2.setDouble(6, subtotal);
					pst2.setString(7, uname);
					pst2.executeUpdate();
					
					// Update products table with new quantity
					pst4 = con.prepareStatement("UPDATE products SET qty = qty - ? WHERE id = ?");
			        pst4.setInt(1, quantity);
			        pst4.setInt(2, id);
			        pst4.executeUpdate();
				}
				
				dp = request.getRequestDispatcher("order.jsp");
				request.setAttribute("status", "success");
				dp.forward(request, response);
			} else {
				dp = request.getRequestDispatcher("order.jsp");
				request.setAttribute("status", "failed");
				dp.forward(request, response);
			}
		} catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			dp = request.getRequestDispatcher("order.jsp");
			request.setAttribute("status", "failed");
			dp.forward(request, response);
		} finally {
			

			// Close database resources
			try {
				if (rs != null) {
					rs.close();
				}
				if (pst1 != null) {
					pst1.close();
				}
				if (pst2 != null) {
					pst2.close();
				}
				if (pst3 != null) {
					HttpSession session = request.getSession();
					String uname = (String) session.getAttribute("uname");
					pst3.close();
					pst3 = con.prepareStatement("DELETE FROM cart WHERE uname= ?");
					pst3.setString(1, uname);
			        pst3.executeUpdate();
				}
				if (con != null) {
					con.close();
				}
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
		}
	}
}
