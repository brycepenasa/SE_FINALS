<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Blob" %>
<%@page import="java.awt.image.BufferedImage" %>
<%@page import="java.io.File" %>
<%@ page import="javax.imageio.ImageIO" %>
<%@page import="java.io.ByteArrayInputStream" %>
<%@page import="java.util.Base64" %>
<%
String id = request.getParameter("userId");
String driverName = "com.mysql.cj.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/sefinals?allowPublicKeyRetrieval=true";
String userId = "root";
String password = "admin";
int stock = 0;
try {
	Class.forName(driverName);
} catch (ClassNotFoundException e) {
	e.printStackTrace();
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">


<!-- Font awesome -->
<link href="css/font-awesome.css" rel="stylesheet">
<!-- Bootstrap -->
<link href="css/bootstrap.css" rel="stylesheet">
<!-- SmartMenus jQuery Bootstrap Addon CSS -->
<link href="css/jquery.smartmenus.bootstrap.css" rel="stylesheet">
<!-- Product view slider -->
<link rel="stylesheet" type="text/css" href="css/jquery.simpleLens.css">
<!-- slick slider -->
<link rel="stylesheet" type="text/css" href="css/slick.css">
<!-- price picker slider -->
<link rel="stylesheet" type="text/css" href="css/nouislider.css">
<!-- Theme color -->
<link id="switcher" href="css/theme-color/default-theme.css"
	rel="stylesheet">
<!-- Top Slider CSS -->
<link href="css/sequence-theme.modern-slide-in.css" rel="stylesheet"
	media="all">

<!-- Main style sheet -->
<link href="css/style.css" rel="stylesheet">

<!-- Google Font -->
<link href='https://fonts.googleapis.com/css?family=Lato'
	rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Raleway'
	rel='stylesheet' type='text/css'>

<!-- EYE ICON -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
<!--  para sa eye icon sa password -->

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

<title>PRODUCTS</title>
<link rel="website icon" type="jpg" href="images/logo.jpg">
</head>

<body>

<header>
	<img class="logo" src="images/logopaynal.png"> <input type="checkbox"
		id="menu-bar"> <label for="menu-bar"><i
		class="fa-solid fa-bars"></i></label>
	<nav class="navbar">
		<ul>
			<li><a href="home2.jsp">HOME</a></li>
			<li style="background:#FAB4BF;"><a href="loungewear2.jsp">PRODUCTS</a></li>
			<li><a href="orders2.jsp">ORDERS</a></li>
			<li><a href="cart2.jsp"><i class="fa-solid fa-cart-shopping"></i></a></li>
			<li><a href="./Logout"><i class="fa-solid fa-right-from-bracket"></i></a></li>
		</ul>
	</nav>

</header>
<input type ="hidden" id="status" value="<%= request.getAttribute("status")%>">
	<!-- product category -->
	<!-- product category -->
	<section id="aa-product-details">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="aa-product-details-area">
						<div class="aa-product-details-content">
							<div class="row">
								<!-- Modal view slider -->
								<div class="col-md-5 col-sm-5 col-xs-12">
									<div class="aa-product-view-slider">
										<div id="demo-1" class="simpleLens-gallery-container">
											<div class="simpleLens-container">
												<%
												try {
													Connection connection = DriverManager.getConnection(connectionUrl, userId, password);
													String id2 = request.getParameter("id");
													String sql = "SELECT * FROM products WHERE id = ?";
													PreparedStatement statement = connection.prepareStatement(sql);
													statement.setInt(1, Integer.parseInt(id2));
													ResultSet resultSet = statement.executeQuery();
													
													while (resultSet.next()) {
														stock = resultSet.getInt("qty");
														Blob blob = resultSet.getBlob("image");
														  byte[] data = blob.getBytes(1, (int) blob.length());
														  
														  // Convert the blob data to an image or other data type
														  ByteArrayInputStream inputStream = new ByteArrayInputStream(data);
														  BufferedImage image = ImageIO.read(inputStream);
												%>
												<div class="simpleLens-big-image-container">
													<a data-lens-image="img/view-slider/large/polo-shirt-1.png"
														class="simpleLens-lens-image"><img
														src="data:image/jpg;base64,<%= Base64.getEncoder().encodeToString(data) %>"
														class="simpleLens-big-image"></a>
												</div>
											</div>
										</div>
									</div>
								</div>

								<!-- Modal view content -->
								<div class="col-md-7 col-sm-7 col-xs-12">
									<div class="aa-product-view-content">
									<br>
										<h2><%=resultSet.getString("name")%></h2>
										<div class="aa-price-block">
											<span class="aa-product-view-price" style="font-size: 25px; font-weight: bold; color:#f66f83;">₱<%=resultSet.getString("price")%></span>
											<p class="aa-product-avilability"><br><br>
												Availability: <span><%=resultSet.getString("qty")%>
													In stock</span>
											</p>
											<form method="post" action="productpage2.jsp">
												<input type="hidden" name="id"
													value="<%=resultSet.getString("id")%>"> <input
													type="hidden" name="name"
													value="<%=resultSet.getString("name")%>"> <input
													type="hidden" name="price"
													value="<%=resultSet.getString("price")%>">
											
												<div class="aa-prod-quantity">
													<label for="quantity">Quantity:</label> <input
														type="number" id="quantity" name="quantity" value="1"
														min="1" max="<%=resultSet.getString("qty")%>">
																
												</div>
												<div class="aa-prod-view-bottom">
													<input type="submit" class="aa-add-to-cart-btn"
														value="Add To Cart" onclick="return confirm('Clicking Okay will add this to cart. Continue? Click \'Okay\' to proceed or \'Cancel\' to cancel command.')">
														
														<% if(resultSet.getInt("qty") == 0) { %>
	<h4 class="aa-product-unavailability" style="color:red;" >Item out of stock</h4>
<% } %>
														
												</div>
											</form>
											
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="aa-product-details-bottom">
							<ul class="nav nav-tabs" id="myTab2">
								<li><a href="#description" data-toggle="tab">Description</a></li>
							</ul>

							<!-- Tab panes -->
							<div class="tab-content">
								<div class="tab-pane fade in active" id="description">
									<p><%=resultSet.getString("description")%></p>
									<p>Fabric: <%=resultSet.getString("fabric")%></p>
									<p>Fitting: <%=resultSet.getString("fitting")%></p><br>
									<h3>Dimensions</h3><br>
									<h4>Top</h4>
									<p>Length: <%=resultSet.getString("length")%> inches</p>
									<p>Width: <%=resultSet.getString("width")%> inches</p><br>
									<h4>Bottom</h4>
									<p>Length: <%=resultSet.getString("length2")%> inches</p>
									<p>Waistline: <%=resultSet.getString("waistline")%> inches</p>
								</div>
								<%
							
								}
							connection.close();
							} catch (Exception e) {
							e.printStackTrace();
							}
							%>
							
							<%
						
							try {
							    ResultSet rs = null;
							    String id2 = request.getParameter("id");
							    String name = request.getParameter("name");
							    String price = request.getParameter("price");
							    PreparedStatement statement = null;
							    // Cast session attribute "uname" to String
							    String uname = (String) session.getAttribute("uname");

							    // Parse quantity as an integer
							    int quantity = Integer.parseInt(request.getParameter("quantity"));

							    RequestDispatcher dpi = null;

							    // Establish connection to database
							    Connection connection = DriverManager.getConnection(connectionUrl, userId, password);

							    // Check if a record already exists with the same uname and id
							    String selectSql = "SELECT * FROM cart WHERE uname = ? AND id = ?";
							    statement = connection.prepareStatement(selectSql);
							    statement.setString(1, uname);
							    statement.setInt(2, Integer.parseInt(id2));
							    rs = statement.executeQuery();

							    if (rs.next()) {
							        // If a record already exists, update the quantity
							        int existingQty = rs.getInt("qty");
							        int newQty = existingQty + quantity;
							      
							        if (newQty <= stock){
							        	
							        String updateSql = "UPDATE cart SET qty = ? WHERE uname = ? AND id = ?";
							        statement = connection.prepareStatement(updateSql);
							        statement.setInt(1, newQty);
							        statement.setString(2, uname);
							        statement.setInt(3, Integer.parseInt(id2));
							        statement.executeUpdate();
							      	
							        }
							    } else {
							        // If a record does not already exist, insert a new record
							        String insertSql = "INSERT INTO cart (id, name, price, qty, uname) VALUES (?, ?, ?, ?, ?)";
							        statement = connection.prepareStatement(insertSql);
							        statement.setInt(1, Integer.parseInt(id2));
							        statement.setString(2, name);
							        statement.setString(3, price);
							        statement.setInt(4, quantity);
							        statement.setString(5, uname);
							        statement.executeUpdate();
							    	     
							    }
							
							    request.setAttribute("status", "addToCartSuccess");
								dpi = request.getRequestDispatcher("loungewear2.jsp");
								dpi.forward(request,response);
							
							   
							} catch (Exception e) {
							    e.printStackTrace();
							}

							%>
								
								<div class="aa-product-details-bottom">
									<ul class="nav nav-tabs" id="myTab2">
										<li><a href="#review" data-toggle="tab">Reviews</a></li>
									</ul>
									<div class="aa-product-review-area">
										<ul class="aa-review-nav">
											<li>
												<div class="media">
													
													<div class="media-body">
														<%@ page import="java.sql.*" %>
														
														
<%
    int productId = Integer.parseInt(request.getParameter("id"));
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sefinals?useSSL=false", "root", "admin");
        String query = "SELECT * FROM feedbacks WHERE productid = ?";
        pstmt = conn.prepareStatement(query);
        pstmt.setInt(1, productId);
        rs = pstmt.executeQuery();
        
        while (rs.next()){
            String uname = rs.getString("uname");
            String date = rs.getString("created_at");
            String review = rs.getString("review");
            String adminreply = rs.getString("admin_reply");
            %>
            <div>
            <hr>
                <p><b></b> <%= uname %></p>
               
               <%
    String rating = rs.getString("rating");
    int numStars = Integer.parseInt(rating);
    
    for (int i = 0; i < numStars; i++) {
        %>
        <i class="fa fa-star" style="color: #FAB4BF;"></i>
        <%            
    }
%>
 				<p><b></b> <%= date %></p>
                <p><b></b> <%= review %></p>
                
              <%    if(adminreply != null) {   %>
                <p><b>          Seller's Response:</b> <%= adminreply %></p>
                
            </div>
            <%   
              }
        
        } 
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) {
                rs.close();
            }
            if (pstmt != null) {
                pstmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
													
														
													</div>
												</div>
											</li>
											
										</ul>
							<%
												try {
													Connection connection = DriverManager.getConnection(connectionUrl, userId, password);
													String id2 = request.getParameter("id");
													String sql = "SELECT * FROM products WHERE id = ?";
													PreparedStatement statement = connection.prepareStatement(sql);
													statement.setInt(1, Integer.parseInt(id2));
													ResultSet resultSet = statement.executeQuery();

													while (resultSet.next()) {
												%>		
	<form method="post" action="productpage2" class="aa-review-form" >
										<br><hr>
										<h3>Add a review</h3>
										<div class="aa-your-rating">
											<p>Your Rating</p>
											 <label for="rating">Rating:</label>
  												<div class="katawan">
	<div class="rcontainer">
		<div class="rating">
			<input type="radio" id="star5" value="5" name="rating" style="--c: #FAB4BF;" required>
			<input type="radio" id="star4" value="4" name="rating" style="--c: #FAB4BF;">
			<input type="radio" id="star3" value="3" name="rating" style="--c: #FAB4BF;">
			<input type="radio" id="star2" value="2" name="rating" style="--c: #FAB4BF;">
			<input type="radio" id="star1" value="1" name="rating" style="--c: #FAB4BF;">
		</div>
	</div>
	</div>
	<input type="hidden" name="id" value="<%=resultSet.getString("id")%>">


<br>
										</div>
											<div class="form-group">
												<label for="message">Your Review:</label>
												<textarea class="form-control" rows="3" id="message" name="review" ></textarea>
											</div>
										<!-- 	<input type="file" id="picture" name="picture" accept="image/*"> -->
<input type="submit"
												class="btn btn-default aa-review-submit" value="Submit feedback">
										</form>
											<%
										}
										connection.close();
										} catch (Exception e) {
										e.printStackTrace();
										}
										%>
										<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
    
    <script type ="text/javascript">
    
    var status =document.getElementById("status").value;
    if (status == "feedbackSuccess"){
    	swal("Success!!", "Thank you for your feedback","success");
    }
    else if (status == "feedbackFailed"){
    	swal("Failed", "You already have a feedback for this item", "error");
    }
    else if (status == "updateSuccess"){
    	swal("Sucess!!", "Your feedback to this item is updated","success");
    }
    else if (status == "updateFailed"){
    	swal("Failed", "Review update unsuccessful", "error");
    }
    else if (status == "cartSuccess"){
    	swal("Sucess!!", "Your Item is added into cart","success");
    }
    else if (status == "cartFailed"){
    	swal("Failed", "Item out of stock", "error");
    }
    else if (status == "feedbackOrderFailed"){
    	swal("Failed", "Feedbacks are allowed for those who have the item ", "error");
    }
 
    </script>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>




		<footer id="aa-footer">
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
					<li><a href="termsofservice2.jsp">TERMS AND CONDITION</a></li>
					<li><a href="privacypolicy2.jsp">PRIVACY POLICY</a></li>
					<li><a href="faqs2.jsp">FAQS</a></li>
				</ul>
				</div>

				<div class="row">SoundsDreamy &copy; 2023. ALL RIGHTS RESERVED
					|| SHOP NOW!!</div>
			</div>
		</footer>



		<!-- jQuery library -->
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<!-- Include all compiled plugins (below), or include individual files as needed -->
		<script src="js/bootstrap.js"></script>
		<!-- SmartMenus jQuery plugin -->
		<script type="text/javascript" src="js/jquery.smartmenus.js"></script>
		<!-- SmartMenus jQuery Bootstrap Addon -->
		<script type="text/javascript" src="js/jquery.smartmenus.bootstrap.js"></script>
		<!-- To Slider JS -->
		<script src="js/sequence.js"></script>
		<script src="js/sequence-theme.modern-slide-in.js"></script>
		<!-- Product view slider -->
		<script type="text/javascript" src="js/jquery.simpleGallery.js"></script>
		<script type="text/javascript" src="js/jquery.simpleLens.js"></script>
		<!-- slick slider -->
		<script type="text/javascript" src="js/slick.js"></script>
		<!-- Price picker slider -->
		<script type="text/javascript" src="js/nouislider.js"></script>
		<!-- Custom js -->
		<script src="js/custom.js"></script>
</body>

</html>