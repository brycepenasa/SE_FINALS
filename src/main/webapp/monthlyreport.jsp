<%@page import="java.sql.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="height:100%;">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/cart.css">
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
			<li><a href="home3.jsp">HOME</a></li>
		<li><a href="loungewear3.jsp">PRODUCTS</a></li>
		<li style="background:#FAB4BF;"><a href="orders3.jsp">MANAGE ORDERS</a></li>
		<li><a href="inventory.jsp">MANAGE INVENTORY</a></li>
		<li><a href="manageFeedbackDashboard.jsp">MANAGE FEEDBACK</a></li>
		<li><a href="./Logout"><i class="fa-solid fa-right-from-bracket"></i></a></li>
		</ul>
	</nav>

</header>
<br><br>
<h1 style="font-size:50px;">Sales Report</h1>
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
<%
// Get the selected month and year from the request parameters
String selectedMonth = request.getParameter("month");
String selectedYear = request.getParameter("year");

// Create a Calendar object to get the first and last day of the selected month and year
Calendar calendar = Calendar.getInstance();
calendar.set(Calendar.YEAR, Integer.parseInt(selectedYear));
calendar.set(Calendar.MONTH, Integer.parseInt(selectedMonth) - 1);
calendar.set(Calendar.DAY_OF_MONTH, 1);
Date startDate = new Date(calendar.getTimeInMillis());
calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
Date endDate = new Date(calendar.getTimeInMillis());

// Construct the SQL query to get the orders within the selected month and year
String sql = "SELECT po.name, po.price, po.qty, po.status, po.productorderid, o.timestamp_col, o.firstname, o.lastname, o.hadd, o.city, o.zip, o.contact, po.orderid, "
		+ "(SELECT SUM(subtotal) FROM productorders WHERE orderid = po.orderid) AS total "
		+ "FROM productorders po JOIN orders o ON po.orderid = o.orderid " + "WHERE o.timestamp_col BETWEEN ? AND ? "
		+ "ORDER BY o.timestamp_col ASC";

// Create a connection to the database
Connection connection = null;
PreparedStatement statement = null;
ResultSet resultSet = null;

try {
	Class.forName(driverName);
	connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);

	// Prepare the statement with the SQL query
	statement = connection.prepareStatement(sql);
	statement.setDate(1, startDate);
	statement.setDate(2, endDate);

	// Execute the query and get the result set
	resultSet = statement.executeQuery();

	// Display the report in a table
%>
<div class="container" style="display: flex; justify-content: center;margin-bottom: 250px;">
	<table style=" border-spacing: 50px 0; border-color: black; border-style: solid; margin-top:20px;margin-bottom:20px;">
	<thead>
		<tr>
			<th style="padding:10px;">Order Date</th>
			<th style="padding:10px;">Customer Name</th>
			<th style="padding:10px;">Product Name</th>
			<th style="padding:10px;">Price</th>
			<th style="padding:10px;">Quantity</th>
			<th style="padding:10px;">Total</th>
		</tr>
	</thead>
	<tbody>
		<%
		// Iterate through the result set and display each row as a table row
		double grandTotal = 0;
		while (resultSet.next()) {
			String productName = resultSet.getString("name");
			double price = resultSet.getDouble("price");
			int quantity = resultSet.getInt("qty");
			double subtotal = price * quantity;
			double total = resultSet.getDouble("total");
			String status = resultSet.getString("status");
			String customerName = resultSet.getString("firstname") + " " + resultSet.getString("lastname");
			String orderDate = new SimpleDateFormat("MMM dd, yyyy").format(resultSet.getDate("timestamp_col"));
			String address = resultSet.getString("hadd") + ", " + resultSet.getString("city") + " "
			+ resultSet.getString("zip");
			String contactNo = resultSet.getString("contact");

			// Calculate the grand total
			grandTotal += total;
		%>
		<tr>
			<td style="padding:10px;"><%=orderDate%></td>
			<td style="padding:10px;"><%=customerName%></td>
			<td style="padding:10px;"><%=productName%></td>
			<td style="padding:10px;"><%=price%></td>
			<td style="padding:10px;"><%=quantity%></td>
			<td style="padding:10px;"><%=subtotal%></td>
		</tr>
		<%
		}

		// Display the grand total
		%>
		<tr>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
			<td style="font-weight:bold;">Grand Total:</td>
			<td style="font-weight:bold;">₱<%=grandTotal%></td>
			<td></td>
		</tr>
	</tbody>
</table>
</div>
<%
} catch (ClassNotFoundException e) {
e.printStackTrace();
} catch (SQLException e) {
e.printStackTrace();
} finally {
// Close the result set, statement, and connection
if (resultSet != null) {
	try {
		resultSet.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
}
if (statement != null) {
	try {
		statement.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
}
if (connection != null) {
	try {
		connection.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
}
}
%>

</body>
<footer>
	<div class="footer">
		<div class="row">
			<div class="col">

				<a href="https://www.facebook.com/soundsdreamy"><i
					class="fa-brands fa-facebook"></i></a> <a
					href="https://www.instagram.com/soundsdreamy/"><i
					class="fa-brands fa-instagram"></i></a> <a
					href="https://www.tiktok.com/@soundsdreamy"><i
					class="fa-brands fa-tiktok"></i></a> <a
					href="https://mail.google.com/mail/?view=cm&fs=1&to=soundsdreamy@gmail.com"><i
					class="fa-solid fa-envelope"></i></a>
			</div>
		</div>

		<div class="row">
			<div class="col">
				<ul>
					<li><a href="termsofservice3.jsp">TERMS AND CONDITION</a></li>
					<li><a href="privacypolicy3.jsp">PRIVACY POLICY</a></li>
					<li><a href="faqs3.jsp">FAQS</a></li>
				</ul>
			</div>
		</div>

		<div class="row">
			<div class="col">SoundsDreamy &copy; 2023. ALL RIGHTS RESERVED
				|| SHOP NOW!!</div>
		</div>
	</div>
</footer>
</html>

