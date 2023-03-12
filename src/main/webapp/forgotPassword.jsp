<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<!-- Main CSS-->
<link rel="stylesheet" href="css/login.css">

<!-- NAV BAR -->
<link rel="stylesheet" href="css/navbar.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"/>


<!--FOOTER-->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Fredoka+One&family=Play&display=swap" rel="stylesheet"> 
<link rel="stylesheet" href="css/footer.css">

<title>FORGOT PASSWORD</title>
<link rel="website icon" type="jpg"
href="images/logo.jpg">
</head>


<header>
	<img class="logo" src="images/logo.jpg">

<input type="checkbox" id="menu-bar">
	<label for="menu-bar"><i class="fa-solid fa-bars"></i></label>
<nav class="navbar">
	<ul>
		<li><a href="home.jsp">HOME</a></li>
		<li><a href="loungewear.jsp">LOUNGEWEAR</a></li>
		<li><a href="orders.jsp">ORDERS</a></li>
		<li><a href="cart.jsp"><i class="fa-solid fa-cart-shopping"></i></a></li>
		<li><a href="login.jsp"><i class="fa-solid fa-user"></i></a></li>
	</ul>
</nav>

</header>

<body>
 <input type ="hidden" id="status" value="<%= request.getAttribute("status")%>">
<div class="contain">
<div class="login-body">


 <div class="sign-in-form">
 <i class="fa-solid fa-user fa-3x"></i>
 <h1> Find your account</h1>
 
 <form method="post" action="<%=request.getContextPath()%>/forgotPassword">
  <input type="email" class="input-box" placeholder="Email" id="email" name="email">

 <input type= "submit" class="sbtn" value="Generate Code" />
  <br>
  <hr>
  <p> Remembered your password? <a href="login.jsp"> Go back to login </a> </p>
   <p><a href="forgot.jsp">Use Security Question </a> </p>
  
 </form>
 
 </div>
 </div>
 </div>
<!-- Log In Ends Here -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
	<script type ="text/javascript">
    
    var status =document.getElementById("status").value;
    if (status == "forgotEmailFailed"){
    	swal("Email isn't registered", "Try again");
    }
    </script>
</body>

<footer>
<div class="footer">
<div class="row">
<a href="https://www.facebook.com/soundsdreamy"><i class="fa-brands fa-facebook"></i></a>
<a href="https://www.instagram.com/soundsdreamy/"><i class="fa-brands fa-instagram"></i></a>
<a href="https://www.tiktok.com/@soundsdreamy"><i class="fa-brands fa-tiktok"></i></a>
<a href = "https://mail.google.com/mail/?view=cm&fs=1&to=soundsdreamy@gmail.com"><i class="fa-solid fa-envelope"></i></a>
</div>

<div class="row">
<ul>
<li><a href="termsofservice.jsp">TERMS OF SERVICE</a></li>
<li><a href="privacypolicy.jsp">PRIVACY POLICY</a></li>
<li><a href="refund.jsp">REFUND POLICY</a></li>
<li><a href="faqs.jsp">FAQS</a></li>
</ul>
</div>

<div class="row">
SoundsDreamy &copy; 2023. ALL RIGHTS RESERVED || SHOP NOW!!
</div>
</div>
</footer>
</html>