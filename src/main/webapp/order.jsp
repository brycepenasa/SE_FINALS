<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@page import ="jakarta.servlet.http.HttpSession"%>
<%
String id = request.getParameter("userId");
String driverName = "com.mysql.cj.jdbc.Driver";
String connectionUrl = "jdbc:mysql://soundsdreamy.mysql.database.azure.com:3306/";
String dbName = "sefinals";
String userId = "admindreamy";
String password = "@Soundsdreamy10";

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
<!-- Main CSS-->
<link rel="stylesheet" href="css/orderform.css">

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

<title>ORDER</title>
<link rel="website icon" type="jpg" href="images/logo.jpg">
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
			<li><a href="cart2.jsp"><i class="fa-solid fa-cart-shopping"></i></a></li>
			<li><a href="./Logout"><i class="fa-solid fa-right-from-bracket"></i></a></li>
		</ul>
	</nav>

</header>
<body>
	<input type="hidden" id="status"
		value="<%=request.getAttribute("status")%>">
	<div class="container">
		<div class="title">
			<h2>ORDER FORM</h2>
		</div>
		<div class="d-flex">
		
		<%
		Connection connectionu = null;
		PreparedStatement statementu = null;
		ResultSet resultSetu = null;
		RequestDispatcher dispatcheru = null;
		
		try {
			String unameu = (String) session.getAttribute("uname");
		  connectionu = DriverManager.getConnection(connectionUrl + dbName, userId, password);
		    String sqlu = "SELECT * FROM users WHERE uname = ?";
		     statementu = connectionu.prepareStatement(sqlu);
		    statementu.setString(1, unameu);
		    resultSetu = statementu.executeQuery();

		    while (resultSetu.next()) {
		%>
			<form method="post" action="order" name="order">
				<label> <span class="fname">First Name <span
						class="required">*</span></span> <input type="text" name="fname"
					id="fname" value="<%=resultSetu.getString("fname")%>">
				</label> <label> <span class="lname">Last Name <span
						class="required">*</span></span> <input type="text" name="lname"
					id="lname" value="<%=resultSetu.getString("lname")%>">
				</label> <label> <span>Street Address <span class="required">*</span></span>
					<input type="text" name="hadd" id="hadd"
					placeholder="House number and street name" required>
				</label> <label> <span>Town / City <span class="required">*</span></span>
					<input type="text" name="city" id="city">
				</label> <label> <span>Postcode / ZIP <span class="required">*</span></span>
					<input type="text" name="zip" id="zip">
				</label> <label> <span>Contact Number <span class="required">*</span></span>
					<input type="text" name="contact" id="contact">
				</label> <label> <span>Email Address <span class="required">*</span></span>
					<input type="email" name="email" id="email" value="<%=resultSetu.getString("email")%>">
				</label> <input type="submit" class="button" value="Order"onclick="return confirm('Place Order? Click \'Okay\' to proceed or \'Cancel\' to cancel command.')" />
			</form>
			<%
		    }
		    }
		catch (Exception e) {
			e.printStackTrace();
			} finally {

			try {
			statementu.close();
			} catch (Exception e) {
			e.printStackTrace();
			}
			try {
			connectionu.close();
			} catch (Exception e) {
			e.printStackTrace();
			}
			}
			%>
			<div class="Yorder">
				<table>
					<tr>
						<th colspan="2">Your order</th>
					</tr>
					<%
					double total = 0; // initialize the total variable outside the loop
					%>
					<%
					try {
						String uname = (String) session.getAttribute("uname");
					    Connection connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
					    String id2 = request.getParameter("id");

					    String sql = "SELECT * FROM cart WHERE uname = ?";
					    PreparedStatement statement = connection.prepareStatement(sql);
					    statement.setString(1, uname);
					    ResultSet resultSet = statement.executeQuery();

					    while (resultSet.next()) {
					        String name = resultSet.getString("name");
					        int qty = resultSet.getInt("qty");
					        double price = resultSet.getDouble("price");
				
					        double subtotal = qty * price;
					        total += subtotal;
					        					    
					%>
					<tr>
						<td><%=name%> x <%=qty%></td>
						<td>&#8369;<span class="subtotal"><%=subtotal%></span></td>
					</tr>
					<%
					} // end of while loop
					connection.close();
					} catch (Exception e) {
					e.printStackTrace();
					}
					%>

					<tr>
						<td>Shipping</td>
						<td>Shipping Fee from courier</td>
					</tr>
					<tr>
						<td>Total<br>(Excluding Shipping Fee)
						</td>
						<td>&#8369;<span class="total"><%=total%></span></td>
						<!-- display the total -->
					</tr>

				</table>

				<br>
				<div>
					<input type="radio" name="dbt" value="cd" required> Cash on Delivery
				</div>
				

			</div>
			<!-- order -->
		</div>
	</div>
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">

	<script type="text/javascript">
		var status = document.getElementById("status").value;
		if (status == "success") {
			swal("Success", "Order Sent","success");
		}
	</script>
	<br><br><br>
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
</html>
