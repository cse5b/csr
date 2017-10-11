<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>CSR-Index Page </title>
	<link rel="icon" href="img/myimage.png">
	<meta http-equiv="Content-Type" content="text/html" charset="utf-8"/>
	<link rel="stylesheet" href="in2.css" type="text/css"/>

	<link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
	
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<div class="head">
		
	</div>
</head>
<body>
	<div class="container dark">
		<div class="wrapper" id="top_div">
			<div id="top_left">
			
			</div>
			<div id="top_right">
				<a href="login.jsp">
						<input type="button" value="Login" id="login" >
					</a>
		
					<a href="signup.jsp">
						<input type="button" value="Sign Up" id="signup" >
					</a>
			</div>
			<div id="clear">
			</div>
		</div>
	
	</div>
	<div class="container light">
		<div class="wrapper">
			
			<div id="logo_left">
			
				<img src="../img/cit.jpg" width="120" height="100">
				<h1>CULTURE</br>SPORTS </br>RESPONSIBILTY</h1>
			</div>
			
			<div id="logo_right">
				
					<ul>
						<li><a href="#">Home</a></li>
						<li><a href="#">Cultural</a></li>
						<li><a href="#">Sports</a></li>
						<li><a href="#">Responsibilty</a></li>
						<li><a href="#">Events</a></li>
						
					</ul>
		
				
			</div>
		</div>
			<div id="clear">
			</div>
			
		</div>
	
	</div>
	
	<div class="container">
		<div class="wrapper">
			<div id="image">
				
						  <div class="sliding" style="max-width:100%">
						  <img class="mySlides" src="../img/banner.jpg">
						 
						  <!--  <img class="mySlides" src="../img/1.JPG">
						  <img class="mySlides" src="../img/2.JPG" >
						  <img class="mySlides" src="../img/img (3).JPG"  >
						  <img class="mySlides" src="../img/img (4).JPG">
						  <img class="mySlides" src="../img/img (5).JPG" >
						  <img class="mySlides" src="../img/img (6).JPG" >
						  <img class="mySlides" src="../img/img (7).JPG" >
						 <img class="mySlides" src="../img/img (8).JPG" >
					
						 <img class="mySlides" src="../img/img (9).JPG" >
						 <img class="mySlides" src="../img/img (10).JPG" >
						 <img class="mySlides" src="../img/img (11).JPG">
						 <img class="mySlides" src="../img/img (12).JPG">
						 <img class="mySlides" src="../img/myimage.png"  >
						 <img class="mySlides" src="../img/img (13).JPG" >
						 <img class="mySlides" src="../img/img (14).JPG" >
						 -->
						 
						  
					</div>
					<script>
						
								var myIndex = 0;
								carousel();

								function carousel() {
									var i;
									var x = document.getElementsByClassName("mySlides");
									for (i = 0; i < x.length; i++) {
									   x[i].style.display = "none";  
									}
									myIndex++;
									if (myIndex > x.length) {myIndex = 1}    
									x[myIndex-1].style.display = "block";  
									setTimeout(carousel, 3000); // Change image every 3 seconds
								}
					</script>
				
				
			
			</div>
			
		
		</div>
	</div>
	
</body>
</html>