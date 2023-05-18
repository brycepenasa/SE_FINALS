<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import ="jakarta.servlet.http.HttpSession"%>

<%
String id = request.getParameter("userId");
String driverName = "com.mysql.cj.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "sefinals";
String userId = "root";
String password = "admin";
String check = "";
int stock = 0;
try {
	Class.forName(driverName);
} catch (ClassNotFoundException e) {
	e.printStackTrace();
}



	
%>


<!DOCTYPE html>
<html>
<head>
	
<meta charset="UTF-8">
<link rel="stylesheet" href="css/cart.css">
<title>CART</title>
<link rel="website icon" type="jpg" href="images/logo.jpg">

<!-- NAV BAR -->
<link rel="stylesheet" href="css/navbar.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" />

<!--FOOTER-->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Fredoka+One&family=Play&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="css/footer.css">

</head>
<header>
	<img class="logo" src="images/logopaynal.png"> <input type="checkbox"
		id="menu-bar"> <label for="menu-bar"><i
		class="fa-solid fa-bars"></i></label>
	<nav class="navbar">
		<ul>
			<li><a href="home2.jsp">HOME</a></li>
			<li><a href="loungewear2.jsp">PRODUCTS</a></li>
			<li><a href="orders2.jsp">ORDERS</a></li>
			<li style="background:#FAB4BF;"><a href="cart2.jsp"><i class="fa-solid fa-cart-shopping"></i></a></li>
			<li><a href="./Logout"><i class="fa-solid fa-right-from-bracket"></i></a></li>
		</ul>
	</nav>

</header>
<br>
<h1 style="font-size:50px;">Cart</h1>
<body>
<div class="container" style="display: flex; justify-content: center; margin-bottom:200px">
	<table style="border-spacing: 50px 20px; border-color: black; border-style: solid; margin-top:20px;margin-bottom:20px;">
		<tr>
			<th style="border-top: 2px solid; border-bottom: 2px solid;">Name</th>
			<th style="border-top: 2px solid; border-bottom: 2px solid;">Price</th>
			<th style="border-top: 2px solid; border-bottom: 2px solid;">Quantity</th>
			<th style="border-top: 2px solid; border-bottom: 2px solid;">Subtotal</th>
			
			<th style="border-top: 2px solid; border-bottom: 2px solid;">Actions</th>
		</tr>
		<!-- end -->
		<%
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		double total = 0;
		int quantity = 0;
		double subtotal = 0;

		try {
		    String uname = (String) session.getAttribute("uname");
		    connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
		    String sql = "SELECT c.id, c.name, c.price, c.qty, p.qty "  + "FROM cart c "
		            + "JOIN products p ON c.id = p.id " + "WHERE uname = ?";

		    statement = connection.prepareStatement(sql);
		    statement.setString(1, uname);
		    resultSet = statement.executeQuery();
		    System.out.println("try");

		    while (resultSet.next()) {
		    	check = "laman";
		        stock = resultSet.getInt("p.qty");
		 
		        System.out.println("while");
		        int id3 = resultSet.getInt("id");
		        quantity = resultSet.getInt("qty");
		        double price = Double.parseDouble(resultSet.getString("price"));
		        subtotal = quantity * price;
		        total += subtotal;

		        if (quantity > stock) {
		            System.out.println("if");
		            sql = "DELETE FROM cart WHERE id = ?";
		            PreparedStatement deleteStatement = connection.prepareStatement(sql);
		            deleteStatement.setInt(1, id3);
		            deleteStatement.executeUpdate();
		            deleteStatement.close();
		            response.sendRedirect("cart2.jsp");
		        }
		       
				
		%>
		<form method="POST">
			<tr>
				<td><%=resultSet.getString("name")%></td>
				<td><%=resultSet.getString("price")%></td>

				<td><input type="number" name="qty" value="<%=quantity%>"
					min="1" max="<%=resultSet.getString("p.qty")%>"></td>
				<td>₱<%=subtotal%></td>
				<td><input type="hidden" name="id" value="<%=id3%>"><input style=" padding: 5px 15px;
        background: #FFBCC6; color:black;
        border: 0 none; border-radius: 5px; width:100px; height:30px;"
					type="submit" name="update" value="Update" onclick="return confirm('Update Cart? Click \'Okay\' to proceed or \'Cancel\' to cancel command.')"> <input style=" padding: 5px 15px;
        background: #FFBCC6; color:black;
        border: 0 none; border-radius: 5px; width:100px; height:30px;"
					type="submit" name="delete" value="Delete" onclick="return confirm('Delete this item in cart? Click \'Okay\' to proceed or \'Cancel\' to cancel command.')"></td>
			</tr>
		</form>

		<%
		
		if (request.getMethod().equals("POST")) {
	
		quantity = Integer.parseInt(request.getParameter("qty"));
		int id4 = Integer.parseInt(request.getParameter("id"));
		if (request.getParameter("update") != null) {
			sql = "UPDATE cart SET qty = ? WHERE id = ?";
			statement = connection.prepareStatement(sql);
			statement.setInt(1, quantity);
			statement.setInt(2, id4);
			statement.executeUpdate();
		} else if (request.getParameter("delete") != null) {
			sql = "DELETE FROM cart WHERE id = ?";
			statement = connection.prepareStatement(sql);
			statement.setInt(1, id4);
			statement.executeUpdate();
		}
		response.sendRedirect("cart2.jsp");
	 	 
		}
		        
			
			}
			} catch (Exception e) {
	e.printStackTrace();
	} finally {

	try {
	statement.close();
	} catch (Exception e) {
	e.printStackTrace();
	}
	try {
	connection.close();
	} catch (Exception e) {
	e.printStackTrace();
	}
	}
	
		
		%>
		<tr>
			<td colspan="4" align="right"><b>Total:</b></td>
			<td>₱<%=total%></td>
			<td></td>
		</tr>
		<tr>
			<td colspan="5" align="right">
			
			<%if(check.equals("laman")){ %>
				<form method="POST" action="order.jsp">
					<input type="hidden" name="total" value="<%=total%>"> <input style=" padding: 5px 15px;
        background: #FFBCC6; color:black;
        border: 0 none; border-radius: 5px; width:100px; height:30px;"
						type="submit" name="checkout" value="Checkout">
				</form>
				<%} %>
		
		
			</td>
			<td></td>
		</tr>
	</table>
	</div>
</body>
<!-- BAGONG COOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOODE -->
<br><br>
<footer>
	<div class="footer">
		<div class="row">
			<a href="https://www.facebook.com/soundsdreamy"><i
				class="fa-brands fa-facebook"></i></a> <a
				href="https://www.instagram.com/soundsdreamy/"><i
				class="fa-brands fa-instagram"></i></a> <a
				href="https://www.tiktok.com/@soundsdreamy"><i
				class="fa-brands fa-tiktok"></i></a> <a
				href="https://mail.google.com/mail/?view=cm&fs=1&to=soundsdreamy@gmail.com"><i
				class="fa-solid fa-envelope"></i></a>
		</div>

		<div class="row">
				<ul>
					<li><a href="termsofservice2.jsp">TERMS AND CONDITION</a></li>
					<li><a href="privacypolicy2.jsp">PRIVACY POLICY</a></li>
					<li><a href="faqs2.jsp">FAQS</a></li>
				</ul>
		</div>

		<div class="row">SoundsDreamy &copy; 2023. ALL RIGHTS RESERVED
			|| SHOP NOW!!</div>
	</div>
</footer>
</html>