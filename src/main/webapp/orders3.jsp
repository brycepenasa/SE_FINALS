<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

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
<title>MANAGE ORDERS</title>
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
	<img class="logo" src="images/logopaynal.png"> <input
		type="checkbox" id="menu-bar"> <label for="menu-bar"><i
		class="fa-solid fa-bars"></i></label>
	<nav class="navbar">
		<ul>
			<li><a href="home3.jsp">HOME</a></li>
			<li><a href="loungewear3.jsp">PRODUCTS</a></li>
			<li style="background: #FAB4BF;"><a href="orders3.jsp">MANAGE
					ORDERS</a></li>
			<li><a href="inventory.jsp">MANAGE INVENTORY</a></li>
			<li><a href="manageFeedbackDashboard.jsp">MANAGE FEEDBACK</a></li>
			<li><a href="./Logout"><i
					class="fa-solid fa-right-from-bracket"></i></a></li>
		</ul>
	</nav>

</header>
<br>
<h1 style="font-size: 50px;">Orders</h1>
<body>
	<form action="<%=request.getRequestURI()%>" method="get">
		<label for="search">Customer Name:</label> <input type="text" class="form-control" name="search"
							placeholder="<%=request.getParameter("search") == null ? "name" : ""%>"
							value="<%=request.getParameter("search") == null ? "" : request.getParameter("search")%>">   <input type="submit" value="Search">
	</form>
	
	
	<br>	<br>	
	<form action="monthlyreport.jsp" method="get">
		<label for="month">Select month:</label> <select id="month"
			name="month">
			<option value="01">January</option>
			<option value="02">February</option>
			<option value="03">March</option>
			<option value="04">April</option>
			<option value="05">May</option>
			<option value="06">June</option>
			<option value="07">July</option>
			<option value="08">August</option>
			<option value="09">September</option>
			<option value="10">October</option>
			<option value="11">November</option>
			<option value="12">December</option>
		</select> <label for="year">Select year:</label> <select id="year" name="year">
			<option value="2023">2023</option>
			<option value="2023">2024</option>
			<option value="2023">2025</option>
			<option value="2023">2026</option>
			<option value="2023">2027</option>
			<!-- Add more options as needed -->
		</select> <input type="submit" value="Generate Report">
	</form>
	<div class="container"
		style="display: flex; justify-content: center; margin-bottom: 200px">
		<table
			style="border-spacing: 50px 20px; border-color: black; border-style: solid; margin-top: 20px; margin-bottom: 20px;">
			<thead>
				<tr>
					<th style="border-top: 2px solid; border-bottom: 2px solid;">Name</th>
					<th style="border-top: 2px solid; border-bottom: 2px solid;">Address</th>
					<th style="border-top: 2px solid; border-bottom: 2px solid;">Contact
						No.</th>
					<th style="border-top: 2px solid; border-bottom: 2px solid;">Product
						Name</th>
					<th style="border-top: 2px solid; border-bottom: 2px solid;">Price</th>
					<th style="border-top: 2px solid; border-bottom: 2px solid;">Qty</th>

					<th style="border-top: 2px solid; border-bottom: 2px solid;">Subtotal</th>
					<th style="border-top: 2px solid; border-bottom: 2px solid;">Total</th>
					<th style="border-top: 2px solid; border-bottom: 2px solid;">Date
						Ordered</th>
					<th style="border-top: 2px solid; border-bottom: 2px solid;">Status</th>
					<th style="border-top: 2px solid; border-bottom: 2px solid;">Tracking Number</th>
					<th style="border-top: 2px solid; border-bottom: 2px solid;">Actions</th>
					<!-- END -->
				</tr>
			</thead>
			<tbody>
				<%
				Connection connection = null;

				PreparedStatement statement = null;
				ResultSet resultSet = null;

				int quantity = 0;
				double subtotal = 0;

				try {

					Class.forName(driverName);

					// Create a connection to the database
					connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);

					String searchQuery = request.getParameter("search");

					// Construct the SQL query
					String sql = "SELECT po.name, po.price, po.qty, po.status, po.productorderid, po.tracking, o.timestamp_col, o.firstname, o.lastname, o.hadd, o.city, o.zip, o.contact, po.orderid, "
					+ "(SELECT SUM(subtotal) FROM productorders WHERE orderid = po.orderid) AS total "
					+ "FROM productorders po " + "JOIN orders o ON po.orderid = o.orderid ";

					// Prepare the statement
			if (searchQuery == null || searchQuery.isEmpty()) {
    statement = connection.prepareStatement(sql);
} else {
	sql += "WHERE po.name LIKE ? OR po.price LIKE ? OR po.qty LIKE ? OR po.status LIKE ? OR o.firstname LIKE ? OR o.lastname LIKE ? OR o.hadd LIKE ? OR o.city LIKE ? OR o.zip LIKE ? OR o.contact LIKE ?";
	statement = connection.prepareStatement(sql);
	String searchPattern = "%" + searchQuery + "%";
	for (int i = 1; i <= 10; i++) {
statement.setString(i, searchPattern);
	}
    // Execute SQL query and check for results
    ResultSet rs = statement.executeQuery();
 	
    		if (rs.next()) {
     
    } else {
    	 %>
						<td><p class="display-3" style="text-align: center; color:red; font-size:30px; ">Not found</p></td>
				<% 
    }
}
					// Execute the query
					resultSet = statement.executeQuery();

					while (resultSet.next()) {
						String orderid = resultSet.getString("orderid");
						String firstname = resultSet.getString("firstname");
						String lastname = resultSet.getString("lastname");
						String fullname = firstname + " " + lastname;
						String hadd = resultSet.getString("hadd");
						String city = resultSet.getString("city");
						int zip = resultSet.getInt("zip");
						String address = hadd + " " + city + " " + Integer.toString(zip);
						String contact = resultSet.getString("contact");
						String name = resultSet.getString("name");
						int price = resultSet.getInt("price");
						int qty = resultSet.getInt("qty");

						double total = resultSet.getDouble("total");
						// String status = resultSet.getString("status"); // not used in the output
						subtotal = 0;

						int productorderid = resultSet.getInt("productorderid");
						String time = resultSet.getString("timestamp_col");
						String tracking = resultSet.getString("tracking");
				%>
				<tr>


					<%
					if (orderid.equals(prevProductOrderID)) {
						subtotal = qty * price;
					%>

					<td></td>
					<td></td>
					<td></td>

					<td><%=name%></td>
					<td>₱<%=price%></td>
					<td><%=qty%></td>
					<td>₱<%=String.format("%.2f", subtotal)%></td>
					<td><%=String.format("-")%></td>
					<td><%=String.format("-")%></td>
					<td><%=String.format("-")%></td>



					<%
					} else {
					subtotal = qty * price;
					%>


					<td><%=fullname%></td>
					<td><%=address%></td>
					<td><%=contact%></td>
					<td><%=name%></td>
					<td>₱<%=price%></td>
					<td><%=qty%></td>

					<td>₱<%=String.format("%.2f", subtotal)%></td>
					<td>₱<%=String.format("%.2f", total)%></td>
					<td><%=time%></td>



					<%
					if (!resultSet.getString("status").equalsIgnoreCase("DELIVERED")) {
					%>
					<form method="POST">
					
						<td><select name="status">
								<option value="PROCESSING"
									<%=resultSet.getString("status").equals("PROCESSING") ? "selected" : ""%>
									<%=resultSet.getString("status").equals("FOR DELIVERY") ? "disabled" : ""%>>PROCESSING</option>
								<option value="FOR DELIVERY"
									<%=resultSet.getString("status").equals("FOR DELIVERY") ? "selected" : ""%>>FOR
									DELIVERY</option>
								<option value="DELIVERED"
									<%=resultSet.getString("status").equals("PROCESSING") ? "disabled" : ""%>>DELIVERED</option>
									<%=resultSet.getString("status").equals("DELIVERED") ? "selected" : ""%>>DELIVERED</option>
						</select></td>
							<td><input style="width: 100%;"type="text" name="tracking" value="<%=resultSet.getString("tracking")%>"></td>
						<td><input type="hidden" name="orderid" value="<%=orderid%>">
							<input type="hidden" name="id" value="<%=productorderid%>"><input
							style="padding: 5px 15px; background: #FFBCC6; color: black; border: 0 none; border-radius: 5px; width: 100px; height: 30px; margin-bottom: 8px;"
							type="submit" name="updates" value="Update"
							onclick="return confirm('Update Order Status? Click \'Okay\' to proceed or \'Cancel\' to cancel command.')">


							<input type="hidden" name="productorderid"
							value="<%=productorderid%>"> <input
							style="padding: 5px 15px; background: #FFBCC6; color: black; border: 0 none; border-radius: 5px; width: 100px; height: 30px;"
							type="submit" name="delete" value="Cancel"
							onclick="return confirm('Are you sure you want to cancel this order? Click \'Okay\' to proceed or \'Cancel\' to cancel command.')">
					</form>
					<%
					} else {
					%>
					<td><%=resultSet.getString("status")%></td>
					<td><%=resultSet.getString("tracking")%></td>

					<%
					}
					%>
			
					<%
					}
					prevProductOrderID = orderid;
					}

					if (request.getMethod().equals("POST")) {
					String productOrderIdParam = request.getParameter("orderid");
					String status = request.getParameter("status");
					String tracking = request.getParameter("tracking");
					int it = Integer.parseInt(productOrderIdParam);
					if (request.getParameter("updates") != null) {
					if (productOrderIdParam != null && !productOrderIdParam.isEmpty()) {
						int productOrderId = Integer.parseInt(productOrderIdParam);

						try {
							String sql10 = "UPDATE productorders SET status = ?, tracking = ? WHERE orderid = ?";
							statement = connection.prepareStatement(sql10);
							statement.setString(1, status);
							statement.setString(2, tracking);
							statement.setInt(3, productOrderId);
							statement.executeUpdate();

						} catch (SQLException ex) {
							// handle the exception
						}
					}

					}

					if (request.getParameter("delete") != null) {
					if (productOrderIdParam != null) {
						int id4 = Integer.parseInt(productOrderIdParam);

						// delete the order from the orders table
						String sql3 = "DELETE FROM orders WHERE orderid = ?";
						PreparedStatement statement2 = connection.prepareStatement(sql3);
						statement2.setInt(1, id4);
						statement2.executeUpdate();

						// get the product id and quantity from the productorders table
						String sql4 = "SELECT * FROM productorders WHERE orderid = ?";
						PreparedStatement statement3 = connection.prepareStatement(sql4);
						statement3.setInt(1, id4);
						ResultSet resultSet2 = statement3.executeQuery();
						int productId = 0;
						int quantity1 = 0;
						String name = "";
						if (resultSet2.next()) {
							name = resultSet2.getString("name");
							productId = resultSet2.getInt("id");
							quantity1 = resultSet2.getInt("qty");
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

						String sql9 = "UPDATE sales SET sale = ? WHERE name = ?";
						PreparedStatement statement8 = connection.prepareStatement(sql9);
						statement8.setInt(1, finalSale);
						statement8.setString(2, name);
						statement8.executeUpdate();
					}
					}
					response.sendRedirect("orders3.jsp");
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
</body>

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
				<li><a href="termsofservice3.jsp">TERMS AND CONDITION</a></li>
				<li><a href="privacypolicy3.jsp">PRIVACY POLICY</a></li>
				<li><a href="faqs3.jsp">FAQS</a></li>
			</ul>
		</div>

		<div class="row">SoundsDreamy &copy; 2023. ALL RIGHTS RESERVED
			|| SHOP NOW!!</div>
	</div>
</footer>
</html>
