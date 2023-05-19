<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

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
<body>
<form>
<select id="month" name="month" onchange="this.form.submit()">
<option value="">Select a month:</option>
  <option value="1">January</option>
  <option value="2">February</option>
  <option value="3">March</option>
  <option value="4">April</option>
  <option value="5">May</option>
  <option value="6">June</option>
  <option value="7">July</option>
  <option value="8">August</option>
  <option value="9">September</option>
  <option value="10">October</option>
  <option value="11">November</option>
  <option value="12">December</option>
</select>
</form>

<br><br>
<button style="border-style:solid; border-radius:4px; padding:5px;font-family: 'Play', sans-serif; color:black; text-decoration:none; font-size:20px;" onclick="printPage()">Download sales report as PDF</button>
<script>
function printPage() {
  // Call the window.print() method to open the print dialog box
  window.print();
}
</script>
<div class="container" style="display: flex; justify-content: center;margin-bottom: 250px;">
	<table style=" border-spacing: 200px 0; border-color: black; border-style: solid; margin-top:20px;margin-bottom:20px;">
		<tr >
			<th style="padding:20px;">Name</th>
			<th style="padding:20px;">Sales (pcs)</th>
			<th style="padding:20px;">Price</th>
			<th style="padding:20px;">Total</th>
		</tr>
		<%
		// Connect to the MySQL database
		// Load the MySQL JDBC driver
// Load the MySQL JDBC driver
// Load the JDBC driver
// Load the JDBC driver
Class.forName("com.mysql.cj.jdbc.Driver");

// Connect to the database
String url = "jdbc:mysql://soundsdreamy.mysql.database.azure.com:3306/sefinals";
String username = "admindreamy";
String password = "@Soundsdreamy10";
Connection conn = DriverManager.getConnection(url, username, password);

// Query the productorders table and calculate the total quantity for each product
String sql = "SELECT name, SUM(qty) FROM productorders GROUP BY name";

try {
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery(sql);

    // Loop through the result set and update the sales table with the new sale quantity
    while (rs.next()) {
        String name = rs.getString("name");
        int sum = rs.getInt("SUM(qty)");

        PreparedStatement ps = conn.prepareStatement("UPDATE sales SET sale = ? WHERE name = ?");
        ps.setInt(1, sum); // Set the new sale quantity
        ps.setString(2, name); // Identify the record to update using the product id
        ps.executeUpdate(); // Execute the prepared statement to update the data
    }

    // Query the sales table and display the results
    sql = "SELECT name, sale, price FROM sales";
    rs = stmt.executeQuery(sql);

    int totalSales = 0; // Initialize the total sales to 0

    while (rs.next()) {
        String name = rs.getString("name");
        int sale = rs.getInt("sale");
        int price = rs.getInt("price");
        int total = sale * price;

        totalSales += total; // Add the total for this product to the total sales

        %>
        <tr>
            <td style="padding:20px;"><%=name%></td>
            <td style="padding:20px;"><%=sale%></td>
            <td style="padding:20px;">₱<%=price%> </td>
            <td style="padding:20px;">₱<%=total%> </td>
        </tr>
        <%
    }

    // Display the total sales
    %>
    <tr>
        <td colspan="3" style="text-align:right;padding:20px;"><strong>Total Sales:</strong></td>
        <td style="padding:20px;">₱<%=totalSales%></td>
    </tr>
    <%

    // Close the result set, statement, and connection
    rs.close();
    stmt.close();
    conn.close();

} catch (SQLException e) {
    System.out.println(e.getMessage());
}

		%>

	</table>
	
	</div>
	
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

