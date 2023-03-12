<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<!-- Main css -->
<link rel="stylesheet" href="css/register.css">

<!-- NAV BAR -->
<link rel="stylesheet" href="css/navbar.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"/>


<!--FOOTER-->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Fredoka+One&family=Play&display=swap" rel="stylesheet"> 
<link rel="stylesheet" href="css/footer.css">

<title>REGISTER</title>
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
   
<!--Register to mga idol -->
<div class="login-body">


 <div class="sign-in-form">
 <i class="fa-solid fa-user fa-3x"></i>
 <h1> Sign-Up</h1>
 
 <form method="post" action="register" name="reg-form">
 
   <input type="text" class="input-box" placeholder="Name" id="name" name="name" required PATTERN="^[a-zA-Z-]{0,10}$" title="Input characters only | Input a maximum of 10 characters">
    <input type="date" class="input-box" placeholder="Birthdate" id="birthdate" name="birthdate" required>
    <label>
    Gender:
    </label>
  
 	 <input type="radio" name="gender" value="Male" required> Male
<input type="radio" name="gender" value="Female" required> Female
		
    <input type="email" class="input-box" placeholder="Email" id="email" name="email" required>
    <input type="text" class="input-box" placeholder="Username" id="uname" name="uname" PATTERN="^[a-z0-9A-Z_-]{0,10}$" required title="Symbols aren't allowed | Input a maximum of 10 characters or numbers only">
  <input type="password" class="input-box" placeholder="Password" id="pass" name="pass" required 
  title="Enter atleast 8 characters | Include atleast one (1) upper case letter | Include atleast one (1) number | Include atleast one (1) special character" 
  pattern="^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[@$#?!%^&*-]).{8,}$">
  <i class="fa-regular fa-eye" id="togglePassword" style="margin-left: -30px; 
cursor: pointer;"></i>
    <label for="sec">Security Question:</label>
    <br>
<select name="secQ" id="secQ" required="required">
	<option value="">--Select Question--</option>
	<option value="Sec Q1">Where was your best family vacation as a kid? </option>
	<option value="Sec Q2">What city were you born in? </option>
	<option value="Sec Q3">In what city did your parents meet?</option>
</select>
<br><br>
      <input type="text" class="input-box" placeholder="Answer" id="secA" name="secA" required>
  <p> <span>  <input type="checkbox" required> </span> Agree to the <a href="termsofservice.jsp">terms and condition</a></p>
  <input type= "submit" class="sbtn" value="Register" />
  <hr>
  <p> Already have an account? <a href="login.jsp"> Log in </a> </p>
  
 </form>
 </div>
 </div>
  <script src="vendor/jquery/jquery.min.js"></script>
    <script src="js/main.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
    
    <script type ="text/javascript">
    
    var status =document.getElementById("status").value;
    if (status == "regisFailed"){
    	swal("Account didn't registered", "try again");
    }
    else if (status == "regisFailedUname"){
    	swal("Username Already Exist", "try including numbers");
    }
 
    </script>
    
 <script>
 const togglePassword = document.querySelector('#togglePassword');
  const password = document.querySelector('#pass');

  togglePassword.addEventListener('click', function (e) {
    // toggle the type attribute
    const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
    password.setAttribute('type', type);
    // toggle the eye slash icon
    this.classList.toggle('fa-eye-slash');
});
  </script>
<!-- Sign up Ends Here -->
</body>
<br><br>
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