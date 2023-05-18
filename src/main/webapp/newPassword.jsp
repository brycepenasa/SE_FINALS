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
	<img class="logo" src="images/logopaynal.png"> <input type="checkbox"
		id="menu-bar"> <label for="menu-bar"><i
		class="fa-solid fa-bars"></i></label>
	<nav class="navbar">
		<ul>
			<li><a href="home.jsp">HOME</a></li>
			<li><a href="loungewear.jsp">PRODUCTS</a></li>
			<li><a href="orders.jsp">ORDERS</a></li>
			<li><a href="cart.jsp"><i class="fa-solid fa-cart-shopping"></i></a></li>
			<li style="background:#FAB4BF;"><a href="login.jsp"><i class="fa-solid fa-user"></i></a></li>
		</ul>
	</nav>

</header>

<body>
  <input type ="hidden" id="status" value="<%= request.getAttribute("status")%>">
<div class="contain" style="background: url(images/logina.jpg);
  background-repeat: no-repeat;
  background-size: 1887px;">
<!--Login to mga idol -->
<div class="login-body">


 <div class="sign-in-form" style="box-shadow: 10px 10px 20px #FAB4BF;">
 <i class="fa-solid fa-user fa-3x"></i>
 <h1> Hello ${uname}, reset your password?</h1>
 
 <form method="post" action="${pageContext.request.contextPath}/newPassword" name="newp-form">
  <input type="password" class="input-box" placeholder="New Password" id="pass" name="pass" required
  title="Enter atleast 8 characters | Include atleast one (1) upper case letter | Include atleast one (1) number | Include atleast one (1) special character" 
  pattern="^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[@$#?!%^&*-]).{8,}$"> <i class="fa-regular fa-eye" id="togglePassword" style="margin-left: -30px; 
cursor: pointer;"></i>
  <input type="password" class="input-box" placeholder="Confirm Password" id="confpass" name="confpass" required
  title="Enter atleast 8 characters | Include atleast one (1) upper case letter | Include atleast one (1) number | Include atleast one (1) special character" 
  pattern="^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[@$#?!%^&*-]).{8,}$">
  <i class="fa-regular fa-eye" id="togglePassword" style="margin-left: -30px; 
cursor: pointer;"></i>
<input type= "submit" class="sbtn" value="Reset Password" />
  <br>
  <hr>
  <p>Remembered Your Password?<a href="login.jsp"> Go back to login </a> </p>
  
 </form>
 
 <!--JavaScript -->
 <script src="vendor/jquery/jquery.min.js"></script>
    <script src="js/main.js"></script>
 
 <!--JavaScript -->
  <script>
  const togglePassword = document.querySelectorAll('.fa-eye');

  togglePassword.forEach((icon) => {
    icon.addEventListener('click', function (e) {
      // find the associated password input field
      const passwordField = this.previousElementSibling;
      
      // toggle the type attribute
      const type = passwordField.getAttribute('type') === 'password' ? 'text' : 'password';
      passwordField.setAttribute('type', type);
      
      // toggle the eye icon
      this.classList.toggle('fa-eye');
      this.classList.toggle('fa-eye-slash');
    });
  });

 
  </script>
  
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
	
	  <script type ="text/javascript">
    
    var status =document.getElementById("status").value;
   if(status == "resetFailed"){
 		swal("Password Didn't Match", "Try Again", "error");
 	}

    </script>
 </div>
 </div>
 </div>
<!-- Log In Ends Here -->
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
					<li><a href="termsofservice.jsp">TERMS AND CONDITION</a></li>
					<li><a href="privacypolicy.jsp">PRIVACY POLICY</a></li>
					<li><a href="faqs.jsp">FAQS</a></li>
				</ul>
</div>

<div class="row">
SoundsDreamy &copy; 2023. ALL RIGHTS RESERVED || SHOP NOW!!
</div>
</div>
</footer>
</html>