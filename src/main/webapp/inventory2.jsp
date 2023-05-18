<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="jakarta.servlet.http.HttpServletResponse"%>
<%@page import= "jakarta.servlet.RequestDispatcher" %>
<%@page  import= "jakarta.servlet.http.HttpServletRequest"%>

<%
String id = request.getParameter("userId");
String driverName = "com.mysql.cj.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "sefinals";
String userId = "root";
String password = "admin";

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
<title>Inventory</title>
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
		<li><a href="orders3.jsp">MANAGE ORDERS</a></li>
		<li style="background:#FAB4BF;"><a href="inventory.jsp">MANAGE INVENTORY</a></li>
		<li><a href="manageFeedbackDashboard.jsp">MANAGE FEEDBACK</a></li>
		<li><a href="./Logout"><i class="fa-solid fa-right-from-bracket"></i></a></li>
		</ul>
	</nav>

</header>
<br>
<h1 style="font-size:50px;">Inventory Report</h1>
<body>

<input type ="hidden" id="status" value="<%= request.getAttribute("status")%>"><br><br>


<div class="container" style="display: flex; justify-content: center;">

	<table style="border-spacing: 40px; border-color: black; border-style: solid; margin-top:20px; margin-bottom:20px;">
		<tr>
			<th style="border-top: 2px solid; border-bottom: 2px solid; ">Name</th>
			
			<th style="border-top: 2px solid; border-bottom: 2px solid; ">Quantity</th>
			
		</tr>
		
		
		<%
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		RequestDispatcher dispatcher = null;
		try {
		    connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
		    String search = request.getParameter("search");
		    String sortprice = request.getParameter("sortprice");
		    String sortqty = request.getParameter("sortqty");
		    
	    	    
		    String sql = "SELECT * FROM products";
		    sql += " ORDER BY qty ASC";

		    statement = connection.prepareStatement(sql);
		    resultSet = statement.executeQuery();


			while (resultSet.next()) {
		%>
			<tr>
				<form method="POST">
				<td><%=resultSet.getString("name")%></td>
				<td><%=resultSet.getInt("qty")%></td>
				<td><input type="hidden" name="id" value="<%=resultSet.getInt("id")%>"></td>
				
			</form>
			</tr>
			
		<%
		
		if (request.getMethod().equals("POST")) {
			String name = request.getParameter("name");
		int quantity = Integer.parseInt(request.getParameter("qty"));
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
	</table>
	</div>

	
</body>
<!-- BAGONG COOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOODE -->
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