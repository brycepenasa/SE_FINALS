<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="java.io.File"%>
<%@ page import="javax.imageio.ImageIO"%>
<%@page import="java.io.ByteArrayInputStream"%>
<%@page import="java.util.Base64"%>

<%
String id = request.getParameter("userId");
String driverName = "com.mysql.cj.jdbc.Driver";
String connectionUrl = "jdbc:mysql://soundsdreamy.mysql.database.azure.com:3306/sefinals?allowPublicKeyRetrieval=true";
String userId = "admindreamy";
String password = "@Soundsdreamy10";

try {
	Class.forName(driverName);
} catch (ClassNotFoundException e) {
	e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<style>
.zoom {
	transition: transform .2s; /* Animation */
}

.zoom:hover {
	transform: scale(1.2);
	/* (150% zoom - Note: if the zoom is too large, it will go outside of the viewport) */
}
</style>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- PAGE settings -->
<title>LOUNGEWEAR</title>
<!-- CSS dependencies -->
<link rel="stylesheet" href="css/bootstrap2.css">
<link rel="stylesheet" href="css/navbar.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="wireframe.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Fredoka+One&family=Play&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="css/footer.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" />
<!--GOOGLE FONTS-->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Fredoka+One&family=Play&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="css/footer.css">
</head>
<link rel="website icon" type="jpg" href="images/logo.jpg">
</head>
<header>
	<img class="logo" src="images/logopaynal.png"> <input
		type="checkbox" id="menu-bar"> <label for="menu-bar"><i
		class="fa-solid fa-bars"></i></label>
	<nav class="navbar">
		<ul>
			<li><a href="home2.jsp">HOME</a></li>
			<li style="background: #FAB4BF;"><a href="loungewear2.jsp">PRODUCTS</a></li>
			<li><a href="orders2.jsp">ORDERS</a></li>
			<li><a href="cart2.jsp"><i class="fa-solid fa-cart-shopping"></i></a></li>
			<li><a href="./Logout"><i
					class="fa-solid fa-right-from-bracket"></i></a></li>
		</ul>
	</nav>

</header>
<body>
	<input type="hidden" id="status"
		value="<%=request.getAttribute("status")%>">

	<br>
	<br>
	<br>
	<br>
	<div class="py-5">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h1 class="display-3" style="text-align: center;">Loungewear</h1>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<form method="get" action="">
					<div class="input-group mb-3">
						<input type="text" class="form-control" name="search"
							placeholder="<%=request.getParameter("search") == null ? "Search products..." : ""%>"
							value="<%=request.getParameter("search") == null ? "" : request.getParameter("search")%>">
						<div class="input-group-append">
							<button class="btn btn-primary" type="submit">Search</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
		<div class="container">
	  <div class="row">
            <div class="col-md-12">
                <form method="get" action="">
                    <div class="input-group mb-3">
                        <select class="form-select" name="sort" onchange="this.form.submit()">
                            <option value="">Sort by price</option>
                            <option value="asc" <%= request.getParameter("sort") != null && request.getParameter("sort").equals("asc") ? "selected" : "" %>>Low to high</option>
                            <option value="desc" <%= request.getParameter("sort") != null && request.getParameter("sort").equals("desc") ? "selected" : "" %>>High to low</option>
                        </select>
                    </div>
                </form>
            </div>
        </div>
    </div>
	<div class="py-5">
		<div class="container">
			<div class="row">
				<%
				try {
				    connection = DriverManager.getConnection(connectionUrl, userId, password);
				    statement = connection.createStatement();
				    String searchTerm = request.getParameter("search");
				    String sql = "SELECT * FROM products";
				    String sortOption = request.getParameter("sort");
				    
				    if (searchTerm != null && !searchTerm.isEmpty()) {
				        sql += " WHERE name LIKE '%" + searchTerm + "%'";
				    }
				    
				    if (sortOption != null && !sortOption.isEmpty()) {
				        if (sortOption.equals("asc")) {
				            sql += " ORDER BY price ASC";
				        } else if (sortOption.equals("desc")) {
				            sql += " ORDER BY price DESC";
				        }
				    } else {
				        sql += " ORDER BY date_column DESC";
				    }
				   
				    resultSet = statement.executeQuery(sql);
				    
				    if (!resultSet.next()) {
				        %>
				        <br><br>
				        <div class="container">
				            <div class="row">
				                <div class="col-md-12">
				                    <p class="display-3" style="text-align: center; color:red; font-size:30px; ">Item not found, try searching for other keyword</p>
				                    <br><br><br><br><br><br><br>
				                </div>
				            </div>
				        </div>
				        <%
				    } else {
    resultSet = statement.executeQuery(sql);
    while (resultSet.next()) {
        String productName = resultSet.getString("name");
        Blob blob = resultSet.getBlob("image");
        byte[] data = blob.getBytes(1, (int) blob.length());

        // Convert the blob data to an image or other data type
        ByteArrayInputStream inputStream = new ByteArrayInputStream(data);
        BufferedImage image = ImageIO.read(inputStream);
%>

				<div class="col-md-3 p-3">
					<div class="card box zoom">
						<a><img class="card-img-top"
							src="data:image/jpg;base64,<%=Base64.getEncoder().encodeToString(data)%>"
							alt="Card image cap" /></a>
						<div class="card-body" style="text-align: center;">
							<h5 class="card-title"><%=resultSet.getString("name")%></h5>
							<p class="card-text font-weight-bold"
								style="font-size: 20px; color: #f66f83"">
								₱<%=resultSet.getString("price")%></p>
							<a href="productpage2.jsp?id=<%=resultSet.getString("id")%>"
								class="btn btn-sm btn-outline-secondary d-block mx-auto border-0">
								<i class="fa fa-eye"></i> View
							</a>
						</div>
					</div>
				</div>
				<%
						  
				}
    resultSet.close();
    statement.close();
				connection.close();
				    }} catch (Exception e) {
				e.printStackTrace();
				}
				%>
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
		integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
		crossorigin="anonymous"></script>

	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">

	<script type="text/javascript">
		var status = document.getElementById("status").value;
		if (status == "addToCartSuccess") {
			swal("Success!!", "Item Added To Cart", "success");
		}
	</script>
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
					<li><a href="termsofservice2.jsp">TERMS AND CONDITION</a></li>
					<li><a href="privacypolicy2.jsp">PRIVACY POLICY</a></li>
					<li><a href="faqs2.jsp">FAQS</a></li>
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
