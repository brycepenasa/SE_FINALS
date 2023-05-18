<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.io.*, java.sql.*"%>
<%@page import= "jakarta.servlet.RequestDispatcher" %>
<style>
  @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap');
  * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
  }
  .formbold-main-wrapper {
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 48px;
  }


  .formbold-form-wrapper {
    margin: 0 auto;
    max-width: 550px;
    width: 100%;
    background: white;
  }

  .formbold-input-flex {
    display: flex;
    gap: 20px;
    margin-bottom: 22px;
  }
  .formbold-input-flex > div {
    width: 50%;
    display: flex;
    flex-direction: column-reverse;
  }
  .formbold-textarea {
    display: flex;
    flex-direction: column-reverse;
  }

  .formbold-form-input {
    width: 100%;
    padding-top: 5px;
    padding-bottom: 5px;
    border: 1px solid #000000;
    border-bottom: 1px solid #000000;
    background: #FFFFFF;
    font-weight: 500;
    font-size: 16px;
     color: black;
    outline: none;
    resize: none;
 text-align: center;
  }
  .formbold-form-input::placeholder {
     color: grey;
  }
  .formbold-form-input:focus {
    border-color: black;
  }
  .formbold-form-label {
    color: black;
    font-weight: 500;
    font-size: 18px;
    line-height: 24px;
    display: block;
    margin-bottom: 18px;
  }
  .formbold-form-input:focus + .formbold-form-label {
     color: black;
  }

  .formbold-input-file {
    margin-top: 30px;
  }
  .formbold-input-file input[type="file"] {
    position: absolute;
    top: 6px;
    left: 0;
    z-index: -1;
  }
  .formbold-input-file .formbold-input-label {
    display: flex;
    align-items: center;
    gap: 10px;
    position: relative;
  }

  .formbold-filename-wrapper {
    display: flex;
    flex-direction: column;
    gap: 6px;
    margin-bottom: 22px;
  }
  .formbold-filename {
    display: flex;
    align-items: center;
    justify-content: space-between;
    font-size: 14px;
    line-height: 24px;
    color: #536387;
  }
  .formbold-filename svg {
    cursor: pointer;
  }

  .formbold-btn {
    font-size: 16px;
    border-radius: 5px;
    padding: 12px 25px;
    border: none;
    font-weight: 500;
    background-color: #6A64F1;
    color: white;
    cursor: pointer;
    margin-top: 25px;
  }
  .formbold-btn:hover {
    box-shadow: 0px 3px 8px rgba(0, 0, 0, 0.05);
  }

</style>

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
		<li><a href="orders3.jsp">MANAGE ORDERS</a></li>
		<li style="background:#FAB4BF;"><a href="inventory.jsp">MANAGE INVENTORY</a></li>
		<li><a href="manageFeedbackDashboard.jsp">MANAGE FEEDBACK</a></li>
		<li><a href="./Logout"><i class="fa-solid fa-right-from-bracket"></i></a></li>
		</ul>
	</nav>

</header>
<title>Add New Product</title>
<head>
<meta charset="ISO-8859-1">
</head>
<body>
<input type ="hidden" id="status" value="<%= request.getAttribute("status")%>">
<%System.out.println(request.getAttribute("status"));%>
<div class="formbold-main-wrapper" style="margin-bottom:151px; ">
  <!-- Author: FormBold Team -->
  <!-- Learn More: https://formbold.com -->
  <div class="formbold-form-wrapper">
        <h1>Add New Product</h1><br><br><br>
        

    <form method="POST" action ="addnewform" enctype="multipart/form-data">
        <div class="formbold-input-flex">
          <div>
              <input
              type="text"
              name="name"
              class="formbold-form-input" required
              placeholder="Chloe Loungewear"
              />
              <label class="formbold-form-label">Name:</label>
          </div>
          <div>
              <input
              type="text"
              name="desc"
              class="formbold-form-input" required
              placeholder="A very presko wear"
              />
              <label class="formbold-form-label">Description:</label>
          </div>
        </div>
<div class="formbold-input-flex">
          <div>
              <input  
              type="text"
              name="fabric"
              class="formbold-form-input" required
              placeholder="Cotton"
              />
              <label class="formbold-form-label">Fabric:</label>
          </div>
          <div>
              <input 
              type="text"
              name="fitting"
              class="formbold-form-input" required
              placeholder="Fits small to extra large"
              />
              <label class="formbold-form-label">Fitting:</label>
          </div>
        </div>
        <div class="formbold-input-flex">
          <div>
              <input 
              type="text"
              name="length"
              class="formbold-form-input" required
              placeholder="20"
              />
              <label class="formbold-form-label">Length (Top) in inches:</label>
          </div>
          <div>
              <input 
              type="text"
              name="width"
              class="formbold-form-input" required
              placeholder="40"
              />
              <label class="formbold-form-label">Width (Top) in inches:</label>
          </div>
        </div>
         <div class="formbold-input-flex">
          <div>
              <input 
              type="text"
              name="length2"
              class="formbold-form-input" required
              placeholder="33"
              />
              <label class="formbold-form-label">Length (Bottom) in inches:</label>
          </div>
          <div>
              <input
              type="text"
              name="waistline"
              class="formbold-form-input" required
              placeholder="24-34"
              />
              <label class="formbold-form-label">Waistline in inches:</label>
          </div> 
        </div>
        <div class="formbold-input-flex">
          <div>
              <input 
              type="number"
              name="price"
              class="formbold-form-input" required
              placeholder="200"
              />
              <label class="formbold-form-label">Price:</label>
          </div>
          <div>
              <input 
              type="number"
              name="quantity"
              class="formbold-form-input" required
              placeholder="50"
              />
              <label class="formbold-form-label">Quantity:</label>
          </div>
        </div>
        
        <div class="formbold-input-flex">
           
          <div>
             <input type="file" name="image" class="formbold-form-input" value="Upload Image (JPG)" required>
          </div>
          
          </div>
           <input
					type="submit" style=" padding: 5px 15px;
        background: #FFBCC6; color:black;
        border: 0 none; border-radius: 5px; width:100px; height:30px;" value="Add" >
    </form>
  </div>
</div>
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
    
    <script type="text/javascript">
    var status = document.getElementById("status").value;
    if (status != null && status.trim() !== "") {
        if (status === "newProductSuccess") {
            swal("Success","Item added to inventory", "success");
        } else if (status === "newProductFailed") {
            swal("Failed","Item failed to add", "error");
        } else if (status === "duplicateProduct") {
            swal("Failed","Item already exists", "error");
        }
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