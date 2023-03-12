<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Main CSS-->
<link rel="stylesheet" href="css/orderform.css">

<!-- NAV BAR -->
<link rel="stylesheet" href="css/navbar.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"/>


<!--FOOTER-->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Fredoka+One&family=Play&display=swap" rel="stylesheet"> 
<link rel="stylesheet" href="css/footer.css">

<title>ORDER</title>
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
<div class="container">
  <div class="title">
      <h2>ORDER FORM</h2>
  </div>
<div class="d-flex">

  <form method="post" action="order" name="order">
    <label>
      <span class="fname">First Name <span class="required">*</span></span>
      <input type="text" name="fname" id="fname" >
    </label>
    <label>
      <span class="lname">Last Name <span class="required">*</span></span>
      <input type="text" name="lname" id="lname">
    </label>
    <label>
      <span>Street Address <span class="required">*</span></span>
      <input type="text" name="hadd" id="hadd" placeholder="House number and street name" required>
    </label>
    <label>
      <span>Town / City <span class="required">*</span></span>
      <input type="text" name="city" id="city"> 
    </label>
    <label>
      <span>Postcode / ZIP <span class="required">*</span></span>
      <input type="text" name="zip" id="zip"> 
    </label>
    <label>
      <span>Contact Number <span class="required">*</span></span>
      <input type="text" name="contact" id="contact"> 
    </label>
    <label>
      <span>Email Address <span class="required">*</span></span>
      <input type="email" name="email" id="email"> 
    </label>
    <input type="submit" class="button" value="Order" />
  </form>
  <div class="Yorder">
    <table>
      <tr>
        <th colspan="2">Your order</th>
      </tr>
      <tr>
        <td>Green Drip Pantulog x 2(Small)</td>
        <td>&#8369;190.00</td>
      </tr>
      <tr>
        <td>Subtotal</td>
        <td>&#8369;380.00</td>
      </tr>
      <tr>
        <td>Shipping</td>
        <td>Shipping Fee from courier</td>
      </tr>
    </table><br>
    <div>
      <input type="radio" name="dbt" value="cd"> Cash on Delivery
    </div>
    <div>
      <input type="radio" name="dbt" value="cd"> GCASH <span>
      <img src="images/gcash.jpeg" alt="" width="50">
      </span>
    </div>
     
  </div><!-- order -->
 </div>
</div>
<script src="vendor/jquery/jquery.min.js"></script>
    <script src="js/main.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
    
    <script type ="text/javascript">
    
    var status =document.getElementById("status").value;
    if (status == "success"){
    	swal("Success", "Order Sent");
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
</html>