<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

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

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- NAV BAR -->
<link rel="stylesheet" href="css/navbar.css">
<link rel="stylesheet" href="css/bootstrap2.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" />

<!--FOOTER-->
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
<link rel="stylesheet" href="css/slider.css">
</head>
<title>HOME</title>
<link rel="website icon" type="jpg" href="images/logo.jpg">
<header>
	<img class="logo" src="images/logopaynal.png"> <input type="checkbox"
		id="menu-bar"> <label for="menu-bar"><i
		class="fa-solid fa-bars"></i></label>
	<nav class="navbar">
		<ul>
			<li style="background:#FAB4BF;"><a href="home3.jsp">HOME</a></li>
		<li><a href="loungewear3.jsp">PRODUCTS</a></li>
		<li><a href="orders3.jsp">MANAGE ORDERS</a></li>
		<li><a href="inventory.jsp">MANAGE INVENTORY</a></li>
		<li><a href="manageFeedbackDashboard.jsp">MANAGE FEEDBACK</a></li>
		<li><a href="./Logout"><i class="fa-solid fa-right-from-bracket"></i></a></li>
		</ul>
	</nav>

</header>

<body style="overflow-x: hidden;">
<input type ="hidden" id="status" value="<%= request.getAttribute("status")%>">
	<br><br><br><br><br>
	<div>
<div style="width: 100%; height:100%;"class="carousel slide" data-pause="false" data-ride="carousel" id="carousel">
            <div class="carousel-inner ">
              <div class="carousel-item active"> <img class="d-block img-fluid w-100" style="height: 835px;"src="images/banner.jpg" >
                <div class="carousel-caption">          
                </div>
              </div>
              <div class="carousel-item"> <a href="loungewear3.jsp"><img class="d-block img-fluid w-100" style="height: 835px;" src="images/ban.png"></a>
                <div class="carousel-caption">                 
                </div>
              </div>
              <div class="carousel-item"> <img class="d-block img-fluid w-100"style="height: 835px;" src="images/bann.png">
                <div class="carousel-caption">                  
                </div>
              </div>
            </div> <a class="carousel-control-prev" href="#carousel" role="button" data-slide="prev"> <span class="carousel-control-prev-icon"></span> <span class="sr-only">Previous</span> </a> <a class="carousel-control-next" href="#carousel" role="button" data-slide="next"> <span class="carousel-control-next-icon"></span> <span class="sr-only">Next</span> </a>
          </div>
				<div class="col-md-12" >
		<br><br><br><br>
		
<h1 style="text-align: center">Featured Items</h1>

				
				</div>
			</div>
		</div>
	</div>

	<div class="slider" style="display: flex; justify-content: center; margin-top:20px;">
	<div class="slide-track">
		<div class="slide" style="margin-right: 5px;">
			<a href="productpage.jsp?id=1"><img src="images/1.jpg" height="400" width="400" alt="" /></a>
		</div>
		<div class="slide"style="margin-right: 5px;">
			<a href="productpage.jsp?id=2"><img src="images/2.jpg" height="400" width="400" alt="" /></a>
		</div>
		<div class="slide"style="margin-right: 5px;">
			<a href="productpage.jsp?id=3"><img src="images/3.jpg" height="400" width="400" alt="" /></a>
		</div>
		<div class="slide"style="margin-right: 5px;">
			<a href="productpage.jsp?id=4"><img src="images/4.jpg" height="400" width="400" alt="" /></a>
		</div>
		<div class="slide"style="margin-right: 5px;">
			<a href="productpage.jsp?id=5"><img src="images/5.jpg" height="400" width="400" alt="" /></a>
		</div>
		<div class="slide"style="margin-right: 5px;">
			<a href="productpage.jsp?id=6"><img src="images/6.jpg" height="400" width="400" alt="" /></a>
		</div>
		<div class="slide"style="margin-right: 5px;">
			<a href="productpage.jsp?id=7"><img src="images/7.jpg" height="400" width="400" alt="" /></a>
		</div>
		<div class="slide" style="margin-right: 5px;">
			<a href="productpage.jsp?id=1"><img src="images/1.jpg" height="400" width="400" alt="" /></a>
		</div>
		<div class="slide"style="margin-right: 5px;">
			<a href="productpage.jsp?id=2"><img src="images/2.jpg" height="400" width="400" alt="" /></a>
		</div>
		<div class="slide"style="margin-right: 5px;">
			<a href="productpage.jsp?id=3"><img src="images/3.jpg" height="400" width="400" alt="" /></a>
		</div>
		<div class="slide"style="margin-right: 5px;">
			<a href="productpage.jsp?id=4"><img src="images/4.jpg" height="400" width="400" alt="" /></a>
		</div>
		<div class="slide"style="margin-right: 5px;">
			<a href="productpage.jsp?id=5"><img src="images/5.jpg" height="400" width="400" alt="" /></a>
		</div>
		<div class="slide"style="margin-right: 5px;">
			<a href="productpage.jsp?id=6"><img src="images/6.jpg" height="400" width="400" alt="" /></a>
		</div>
		<div class="slide"style="margin-right: 5px;">
			<a href="productpage.jsp?id=7"><img src="images/7.jpg" height="400" width="400" alt="" /></a>
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
		crossorigin="anonymous" style=""></script>
		
		<script src="vendor/jquery/jquery.min.js"></script>
    <script src="js/main.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
    
    <script type ="text/javascript">
    
    var status =document.getElementById("status").value;
    if (status == "success"){
    	swal("Welcome ${uname}", "Let Your Dreams Become Real!!" ,"success");
    }
 
    </script>
		<br><br><br><br>
		<div class="container">
      <div style="background: #f4aeb8;"class="row p-4" >
        <div class="p-4 col-md-6 bg-light">
        <br>
          <h1 style="text-align:center;"class="m-0">About Us</h1>
          
          <p style="font-size: 18px; text-align: justify;"class="my-4">Welcome to SOUNDSDREAMY, a small business founded by Mrs. Patricia Gozun in 2020. Our mission is to provide sleepwear and loungewear to our customers with the highest quality standards and excellent customer service. We take pride in being a small, locally-owned business and strive to make a positive impact on the community. At Soundsdreamy, we believe in building lasting relationships with our customers by going above and beyond to meet their needs. Our team is dedicated to ensuring that every customer has a positive experience with us. We are passionate about providing comfy clothes and are committed to continuous improvement to provide the best possible products for our customers. Thank you for choosing Soundsdreamy, and we look forward to serving you!</p>
        </div>
        <div class="p-0 col-md-6">
          <img class="img-fluid d-block" src="images/logo.jpg"> </div>
      </div>
    </div>
</body>
<br><br><br><br>
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


