<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import ="jakarta.servlet.http.HttpSession"%>
<%@page import= "jakarta.servlet.RequestDispatcher" %>
<%
String id = request.getParameter("userId");
String driverName = "com.mysql.cj.jdbc.Driver";
String connectionUrl = "jdbc:mysql://soundsdreamy.mysql.database.azure.com:3306/";
String dbName = "sefinals";
String userId = "admindreamy";
String password = "@Soundsdreamy10";
String prevProductOrderID = "";

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
<title>MY ORDERS</title>
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
			<li style="background:#FAB4BF;"><a href="orders2.jsp">ORDERS</a></li>
			<li><a href="cart2.jsp"><i class="fa-solid fa-cart-shopping"></i></a></li>
			<li><a href="./Logout"><i class="fa-solid fa-right-from-bracket"></i></a></li>
		</ul>
	</nav>

</header>
<br>
<h1 style="font-size:50px;">Orders</h1>
<body>
 
<div class="container" style="display: flex; justify-content: center; margin-bottom:200px">
	<table style="border-spacing: 50px 20px; border-color: black; border-style: solid; margin-top:20px;margin-bottom:20px;">
		<thead>
			<tr>
				<th style="border-top: 2px solid; border-bottom: 2px solid;">Name</th>
				<th style="border-top: 2px solid; border-bottom: 2px solid;">Price</th>
				<th style="border-top: 2px solid; border-bottom: 2px solid;">Qty</th>
				
				<th style="border-top: 2px solid; border-bottom: 2px solid;">Subtotal</th>
				<th style="border-top: 2px solid; border-bottom: 2px solid;">Total</th>
				<th style="border-top: 2px solid; border-bottom: 2px solid;">Date Ordered</th>
				<th style="border-top: 2px solid; border-bottom: 2px solid;">Status</th>
				<th style="border-top: 2px solid; border-bottom: 2px solid;">Tracking Number</th>
				<th style="border-top: 2px solid; border-bottom: 2px solid;">Actions</th>
				<!-- END -->
			</tr>
		</thead>
		<tbody>
			<%
		
			RequestDispatcher dispatcher = null;
			Connection connection = null;
			PreparedStatement statement = null;
			ResultSet resultSet = null;
			
			int quantity = 0;
			double subtotal = 0;
			
			try {
				String uname = (String) session.getAttribute("uname");
				Class.forName(driverName);
				connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
				String sql = "SELECT po.*, t.total FROM productorders po INNER JOIN (SELECT orderid, SUM(subtotal) as total FROM productorders GROUP BY orderid) t ON po.orderid = t.orderid WHERE po.uname = ?";
				
				statement = connection.prepareStatement(sql);
				statement.setString(1, uname);
				resultSet = statement.executeQuery();
			
				while (resultSet.next()) {
					   double total = resultSet.getDouble("total");
					String orderid = resultSet.getString("orderid");
					String name = resultSet.getString("name");
					int price = resultSet.getInt("price");
					int qty = resultSet.getInt("qty");
					int productId = resultSet.getInt("id");
					String reviewLink = "productpage2.jsp?id=" + productId;
					//SString status = resultSet.getString("status");
					
					int productorderid = resultSet.getInt("productorderid");
					String time = resultSet.getString("timestamp_col");
					String tracking = resultSet.getString("tracking");
			%>
			<tr>
			
			
			
			
			  <% if (orderid.equals(prevProductOrderID)){ 
						  subtotal = qty * price; %>
						 
		
						  <td><%=name%></td>
					    <td><%=price%></td>
					    <td><%=qty%></td>
					   
						<td>₱<%=String.format("%.2f", subtotal)%></td>
						<td><%=String.format("-")%></td>
						<td><%=String.format("-")%></td>
						  <td><%=String.format("-")%></td>
						  
					<% }else{    subtotal = qty * price;
									
					  %>  	  
						  
						  
				<td><%=name%></td>
<td><%=price%></td>
<td><%=qty%></td>

<td>₱<%=String.format("%.2f", subtotal)%></td>
<td>₱<%=String.format("%.2f", total)%></td>
<td><%=time%></td>
<td style="padding:20px;"><%=resultSet.getString("status")%></td>
<td style="padding:20px;"><%=resultSet.getString("tracking")%></td>
<% if (resultSet.getString("status").equalsIgnoreCase("DELIVERED")){ %>
    <td><a href="<%=reviewLink%>">Write a review</a></td>
<%} else { %>
    <td>NOT YET DELIVERED</td>
<% }
				}
prevProductOrderID = orderid;
			}
				if (request.getMethod().equals("POST")) {
					  String productOrderIdParam = request.getParameter("orderid");
					 	 if (productOrderIdParam != null) {
						        int id4 = Integer.parseInt(productOrderIdParam);

						            // delete the order from the orders table
						            String sql3 = "DELETE FROM orders WHERE orderid = ?";
						            PreparedStatement statement2 = connection.prepareStatement(sql3);
						            statement2.setInt(1, id4);
						            statement2.executeUpdate();
						           // dispatcher = request.getRequestDispatcher("orders2.jsp");
						            // get the product id and quantity from the productorders table
						            String sql4 = "SELECT * FROM productorders WHERE orderid = ?";
						            PreparedStatement statement3 = connection.prepareStatement(sql4);
						            statement3.setInt(1, id4);
						            ResultSet resultSet2 = statement3.executeQuery();
						            int productId = 0;
						            int quantity1 = 0;
						            String name = "";
						            if (resultSet2.next()) {
						                productId = resultSet2.getInt("id");
						                quantity1 = resultSet2.getInt("qty");
						                name = resultSet2.getString("name");
						            }

						            // update the product quantity in the products table
						            String sql5 = "SELECT * FROM products WHERE id = ?";
						            PreparedStatement statement4 = connection.prepareStatement(sql5);
						            statement4.setInt(1, productId);
						            ResultSet resultSet3 = statement4.executeQuery();
						            int currentQuantity = 0;
						            if (resultSet3.next()) {
						                currentQuantity = resultSet3.getInt("qty");
						            }
						            int newQuantity = currentQuantity + quantity1;
						            String sql6 = "UPDATE products SET qty = ? WHERE id = ?";
						            PreparedStatement statement5 = connection.prepareStatement(sql6);
						            statement5.setInt(1, newQuantity);
						            statement5.setInt(2, productId);
						            statement5.executeUpdate();
						        	
						        // delete the product order from the productorders table
						        String sql7 = "DELETE FROM productorders WHERE orderid = ?";
						        PreparedStatement statement6 = connection.prepareStatement(sql7);
						        statement6.setInt(1, id4);
						        statement6.executeUpdate();
				
						        String sql8 = "SELECT * FROM sales WHERE name = ?";
					            PreparedStatement statement7 = connection.prepareStatement(sql8);
					            statement7.setString(1, name);
					            ResultSet resultSet4 = statement7.executeQuery();
					            int sale = 0;
					            if (resultSet4.next()) {
					                sale = resultSet4.getInt("sale");    
					            }
					            int finalSale = sale - quantity1;
						        
						        String sql9= "UPDATE sales SET sale = ? WHERE name = ?";
						        PreparedStatement statement8 = connection.prepareStatement(sql9);
						        statement8.setInt(1, finalSale);
						        statement8.setString(2, name);
						        statement8.executeUpdate();
						    }
					 	
					 	response.sendRedirect("orders2.jsp");
					 	 
				}
	
			} catch (Exception e) {
			e.printStackTrace();
			} finally {
			try {
			if (resultSet != null)
				resultSet.close();
			if (statement != null)
				statement.close();
			if (connection != null)
				connection.close();
			} catch (Exception e) {
			e.printStackTrace();
			}
			}
			%>
			
	</table>
	
	</div>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
		
	 
</body>
	<br><br><br><br><br><br>
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
