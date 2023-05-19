<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="jakarta.servlet.http.HttpServletResponse"%>
<%@page import= "jakarta.servlet.RequestDispatcher" %>
<%@page  import= "jakarta.servlet.http.HttpServletRequest"%>

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
<h1 style="font-size:50px;">Manage Inventory</h1>
<body>
<form action="" method="get">
  <label for="search">Product Name:</label>
  <input type="text" class="form-control" name="search"
							placeholder="<%=request.getParameter("search") == null ? "Search products..." : ""%>"
							value="<%=request.getParameter("search") == null ? "" : request.getParameter("search")%>">
  <input type="submit" value="Search">
</form>
<input type ="hidden" id="status" value="<%= request.getAttribute("status")%>"><br><br>
<a  
href="addnewform.jsp" style="border-style:solid; border-radius:4px; padding:5px;font-family: 'Play', sans-serif; color:black; text-decoration:none; font-size:20px;"> Add New Product
</a>
&emsp;          
<a  
href="inventory2.jsp" style="border-style:solid; border-radius:4px; padding:5px;font-family: 'Play', sans-serif; color:black; text-decoration:none; font-size:20px;"> Generate Inventory Report
</a>

<div class="container" style="display: flex; justify-content: center;">

	<table style="border-spacing: 10px; border-color: black; border-style: solid; margin-top:20px; margin-bottom:20px;">
		<tr>
			<th style="border-top: 2px solid; border-bottom: 2px solid; ">Name</th>
			<th style="border-top: 2px solid; border-bottom: 2px solid; ">Description</th>
			<th style="border-top: 2px solid; border-bottom: 2px solid; ">Fabric</th>
			<th style="border-top: 2px solid; border-bottom: 2px solid; ">Fitting</th>
			<th style="border-top: 2px solid; border-bottom: 2px solid; ">Length (Top)</th>
			<th style="border-top: 2px solid; border-bottom: 2px solid; ">Width</th>
			<th style="border-top: 2px solid; border-bottom: 2px solid; ">Length (Bottom)</th>
			<th style="border-top: 2px solid; border-bottom: 2px solid; ">Waistline</th>
			<th style="border-top: 2px solid; border-bottom: 2px solid; ">Price</th>
			<th style="border-top: 2px solid; border-bottom: 2px solid; ">Quantity</th>
			<th style="border-top: 2px solid; border-bottom: 2px solid; ">Actions</th>
		</tr>
		
		<tr>
		<td></td>
			<td></td>
				<td></td>
					<td></td>
						<td></td>
							<td></td>
								<td></td>
									<td></td>
										<td>
		<div class="container">
	  <div class="row">
            <div class="col-md-12">
                <form method="get" action="">
                    <div class="input-group mb-3">
                        <select class="form-select" name="sortprice" onchange="this.form.submit()">
                            <option value="">Sort by price</option>
                            <option value="asc" <%= request.getParameter("sortprice") != null && request.getParameter("sortprice").equals("asc") ? "selected" : "" %>>Low to high</option>
                            <option value="desc" <%= request.getParameter("sortprice") != null && request.getParameter("sortprice").equals("desc") ? "selected" : "" %>>High to low</option>
                        </select>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    </td>
    <td>
		<div class="container">
	  <div class="row">
            <div class="col-md-12">
                <form method="get" action="">
                    <div class="input-group mb-3">
                        <select class="form-select" name="sortqty" onchange="this.form.submit()">
                            <option value="">Sort by Quantity</option>
                            <option value="asc" <%= request.getParameter("sortqty") != null && request.getParameter("sortqty").equals("asc") ? "selected" : "" %>>Low to high</option>
                            <option value="desc" <%= request.getParameter("sortqty") != null && request.getParameter("sortqty").equals("desc") ? "selected" : "" %>>High to low</option>
                        </select>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    </td>
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

		    if (search != null && !search.isEmpty()) {
		        sql += " WHERE name LIKE '%" + search + "%'"
		            + " OR description LIKE '%" + search + "%'"
		            + " OR price LIKE '%" + search + "%'"
		            + " OR qty LIKE '%" + search + "%'"
		            + " OR fabric LIKE '%" + search + "%'"
		            + " OR fitting LIKE '%" + search + "%'";
		    }

		    if (sortprice != null && sortprice.equals("asc")) {
		        sql += " ORDER BY price ASC, qty ASC";
		    } else if (sortprice != null && sortprice.equals("desc")) {
		        sql += " ORDER BY price DESC, qty ASC";
		    } else if (sortqty != null && sortqty.equals("asc")) {
		        sql += " ORDER BY qty ASC, price ASC";
		    } else if (sortqty != null && sortqty.equals("desc")) {
		        sql += " ORDER BY qty DESC, price ASC";
		    }

		    statement = connection.prepareStatement(sql);
		    resultSet = statement.executeQuery();

		    if (!resultSet.isBeforeFirst()) {
		        // Display "Not Found" message
		        %>
		        <td><p class="display-3" style="text-align: center; color:red; font-size:20px; ">Not Found</p></td>
		        <% 
		    }

		    // display the data
		    while (resultSet.next()) {
		%>
			<tr>
				<form method="POST">
				<td><input type="text" name="name" value="<%=resultSet.getString("name")%>"></td>
				<td><textarea rows="6" cols="15" name="description"  ><%=resultSet.getString("description")%>"</textarea></td>
				<td><input style="width: 75%;type="text" name="fabric" value="<%=resultSet.getString("fabric")%>"></td>
				<td><input type="text" name="fitting" value="<%=resultSet.getString("fitting")%>"></td>
				<td><input style="width: 50%;"type="text" name="length" value="<%=resultSet.getString("length")%>"></td>
				<td><input style="width: 50%;"type="text" name="width" value="<%=resultSet.getString("width")%>"></td>
				<td><input style="width: 50%;"type="text" name="length2" value="<%=resultSet.getString("length2")%>"></td>
				<td><input style="width: 50%;"type="text" name="waistline" value="<%=resultSet.getString("waistline")%>"></td>
				<td><input style="width: 50%;"type="number" name="price" value="<%=resultSet.getInt("price")%>"></td>
				<td><input style="width: 50%;"type="number" name="qty" value="<%=resultSet.getInt("qty")%>"></td>
				<td><input type="hidden" name="id" value="<%=resultSet.getInt("id")%>">
				
				
				<input
					type="submit" style=" padding: 5px 15px;
        background: #FFBCC6; color:black;
        border: 0 none; border-radius: 5px; width:100px; height:30px;"name="update" value="Update" onclick="return confirm('Update item? Click \'Okay\' to proceed or \'Cancel\' to cancel command.')"><br><br>
        <input
					type="submit" style=" padding: 5px 15px;
        background: #FFBCC6; color:black;
        border: 0 none; border-radius: 5px; width:100px; height:30px;"name="delete" value="Delete" onclick="return confirm('Are you sure you want to delete this item? Click \'Okay\' to proceed or \'Cancel\' to cancel command.')"></td>
			</form>
			</tr>
			
		<%
		
		if (request.getMethod().equals("POST")) {
			String name = request.getParameter("name");
			String description = request.getParameter("description");
			String fabric = request.getParameter("fabric");
			String fitting = request.getParameter("fitting");
			String length = request.getParameter("length");
			String width = request.getParameter("width");
			String length2 = request.getParameter("length2");
			String waistline = request.getParameter("waistline");
		int id4 = Integer.parseInt(request.getParameter("id"));
		int quantity = Integer.parseInt(request.getParameter("qty"));
		int pric = Integer.parseInt(request.getParameter("price"));
		if (request.getParameter("update") != null) {
			sql = "UPDATE products SET price = ?, qty = ?, name = ?, description = ?, fabric = ?, fitting = ?, length = ?, width = ?, length2 = ?, waistline = ? WHERE id = ?";
			statement = connection.prepareStatement(sql);
			statement.setInt(1, pric);
			statement.setInt(2, quantity);
			statement.setString(3, name);
			statement.setString(4, description);
			statement.setString(5, fabric);
			statement.setString(6, fitting);
			statement.setString(7, length);
			statement.setString(8, width);
			statement.setString(9, length2);
			statement.setString(10, waistline);
			statement.setInt(11, id4);
			
			statement.executeUpdate();
		
			
		} else if (request.getParameter("delete") != null) {
			sql = "DELETE FROM sales WHERE name = ?";
			statement = connection.prepareStatement(sql);
			statement.setString(1, name);
			
			statement.executeUpdate();
			
			String sqlmoto = "DELETE FROM products WHERE name = ?";
			PreparedStatement st = connection.prepareStatement(sqlmoto);
			st.setString(1, name);
			st.executeUpdate();
			
		}
		request.setAttribute("status", "editSuccess");
		response.sendRedirect("inventory.jsp");
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
	    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
    
    <script type ="text/javascript">
    
    var status =document.getElementById("status").value;
    if (status == "editSuccess"){
    	swal("Success", "Item is updated", "success");
    }
    else if (status == "deleteSuccess"){
    	swal("Success", "Item Deleted", "success");
    }
    else if (status == "addProductSuccess"){
    	swal("Success", "New Product Added]", "success");
    }
    
 
    </script>
	
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
