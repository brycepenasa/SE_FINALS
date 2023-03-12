<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

<!-- NAV BAR -->
<link rel="stylesheet" href="css/navbar.css">
<link rel="stylesheet" href="css/bootstrap2.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"/>

<!--FOOTER-->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Fredoka+One&family=Play&display=swap" rel="stylesheet"> 
<link rel="stylesheet" href="css/footer.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"/>
<!--GOOGLE FONTS-->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Fredoka+One&family=Play&display=swap" rel="stylesheet"> 
<link rel="stylesheet" href="css/footer.css">
</head>
<title>HOME</title>
<link rel="website icon" type="jpg"
href="images/logo.jpg">
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

  <div class="py-5">
    <div class="container" style=" margin-top: 100px; size: 50%;padding: 50px; border-style: solid; width:800px;]">
      <div class="row">
        <div class="col-md-12" style="">
          <div id="carouselExampleIndicators" class="carousel slide carousel-fade" data-ride="carousel">
            <ol class="carousel-indicators">
              <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"> </li>
              <li data-target="#carouselExampleIndicators" data-slide-to="1"> </li>
              <li data-target="#carouselExampleIndicators" data-slide-to="2"> </li>
            </ol>
            <div class="carousel-inner">
              <div class="carousel-item active"> <img class="d-block img-fluid w-100" src="images/4.jpg">
                <div class="carousel-caption">
                </div>
              </div>
              <div class="carousel-item "> <img class="d-block img-fluid w-100" src="images/5.jpg">
                <div class="carousel-caption">
                </div>
              </div>
              <div class="carousel-item"> <img class="d-block img-fluid w-100" src="images/6.jpg">
                <div class="carousel-caption">
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="py-5">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <h1 class="display-3">Featured Items</h1> 
        </div>
      </div>
    </div>
  </div>
  <div class="py-4 bg-light" style="">
    <div class="container">
      <div class="row">
        <div class="col-md-4 p-3" >
          <div class="card box-shadow">
            <img class="card-img-top" src="images/1.jpg">
            <div class="card-body">
              <p class="card-text">Clothing</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <a href="#" class="btn btn-sm btn-outline-secondary">Buy Now<br></a><a href="#" class="btn btn-sm btn-outline-secondary" style="margin-left: 10px;">Add to Cart</a>
                </div> 
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-4 p-3">
          <div class="card box-shadow">
            <img class="card-img-top" src="images/2.jpg">
            <div class="card-body">
              <p class="card-text">Clothing</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <a href="productpage.jsp" class="btn btn-sm btn-outline-secondary">Buy Now<br></a><a href="#" class="btn btn-sm btn-outline-secondary" style="margin-left: 10px;">Add to Cart</a>
                </div> 
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-4 p-3">
          <div class="card box-shadow">
            <img class="card-img-top" src="images/3.jpg">
            <div class="card-body">
              <p class="card-text">Clothing</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <a href="#" class="btn btn-sm btn-outline-secondary">Buy Now<br></a><a href="#" class="btn btn-sm btn-outline-secondary" style="margin-left: 10px;">Add to Cart</a>
                </div> 
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="py-4 bg-light" style="">
    <div class="container">
      <div class="row">
        <div class="col-md-4 p-3">
          <div class="card box-shadow">
            <img class="card-img-top" src="images/7.jpg">
            <div class="card-body">
              <p class="card-text">Clothing</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <a href="#" class="btn btn-sm btn-outline-secondary">Buy Now<br></a><a href="#" class="btn btn-sm btn-outline-secondary" style="margin-left: 10px;">Add to Cart</a>
                </div> 
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-4 p-3">
          <div class="card box-shadow">
            <img class="card-img-top" src="images/8.jpg">
            <div class="card-body">
              <p class="card-text">Clothing</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                 <a href="#" class="btn btn-sm btn-outline-secondary">Buy Now<br></a><a href="#" class="btn btn-sm btn-outline-secondary" style="margin-left: 10px;">Add to Cart</a>
                </div> 
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-4 p-3">
          <div class="card box-shadow">
            <img class="card-img-top" src="images/9.jpg">
            <div class="card-body">
              <p class="card-text">Clothing</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <a href="#" class="btn btn-sm btn-outline-secondary">Buy Now<br></a><a href="#" class="btn btn-sm btn-outline-secondary" style="margin-left: 10px;">Add to Cart</a>
                </div> 
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous" style=""></script>
 

</body>

<footer>
<div class="footer">
<div class="row">
  <div class="col">
    
<a href="https://www.facebook.com/soundsdreamy"><i class="fa-brands fa-facebook"></i></a>
<a href="https://www.instagram.com/soundsdreamy/"><i class="fa-brands fa-instagram"></i></a>
<a href="https://www.tiktok.com/@soundsdreamy"><i class="fa-brands fa-tiktok"></i></a>
<a href = "https://mail.google.com/mail/?view=cm&fs=1&to=soundsdreamy@gmail.com"><i class="fa-solid fa-envelope"></i></a>
</div>
</div>

<div class="row">
   <div class="col">
<ul>
<li><a href="termsofservice.jsp">TERMS OF SERVICE</a></li>
<li><a href="privacypolicy.jsp">PRIVACY POLICY</a></li>
<li><a href="refund.jsp">REFUND POLICY</a></li>
<li><a href="faqs.jsp">FAQS</a></li>
</ul>
</div>
</div>

<div class="row">
   <div class="col">
SoundsDreamy &copy; 2023. ALL RIGHTS RESERVED || SHOP NOW!!
</div>
</div>
</div>
</footer>
</html>