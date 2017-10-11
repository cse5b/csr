<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="jsp.*" %>
     <%@ page import="java.sql.*" %>
    <%@ page import="javax.sql.*" %>
  

<!DOCTYPE html>
<html>
<head>
	<title>CSR-Login Page </title>
	<link rel="icon" href="../img/l.png">
	<meta http-equiv="Content-Type" content="text/html" charset="utf-8"/>
	<link rel="stylesheet" href="in2.css" type="text/css"/>
	<link rel="stylesheet" href="login.css" type="text/css"/>

	<link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
	
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<div class="head">
		
	</div>
	<script>
function validLogin(){
if (document.form.uid.value == ""){
alert ( "Please enter Login Name." );
document.loginform.userName.focus();
return false;
}
if (document.form.password.value == ""){
alert ( "Please enter password." );
document.userform.password.focus();
return false;
}
alert ( "Welcome:"+uid );
return true;
}
</script>
</head>
 
<body>
	
	<div class="container dark">
		<div class="wrapper" id="top_div">
			<div id="top_left">
			
			</div>
			<div id="top_right">
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
				<h1>CULTURAL</br>SPORTS </br>RESPONSIBILTY</h1>
			</div>
			
			<div id="logo_right">
				
					<ul>
						<li><a href="index.jsp">Home</a></li>
						<li><a href="signup.jsp">CSR Account</a></li>
						
						
					</ul>
		
				
			</div>
		</div>
			<div id="clear">
			</div>
			
		</div>
	
	</div>
	
<div class="container">
		<div class="wrapper">
			<h2>Login Form</h2>

			<form action="logincode.jsp" name="form" onsubmit="return validLogin();">
			  <div class="imgcontainer">
				
				<img src="../img/l.png" height="100" width="100" alt="Avatar" class="avatar" onmouseover="this.src='../img/i.jpg'" onmouseout="this.src='../img/l.png'">
			  </div>
			  
				
			  <div class="containerlogin">
			  	<p class=incorrect>Your UserId or Password is Incorrect !</p>
				<label><b>User ID</b></label>
				<input type="text" placeholder="Enter User ID" name="uid" required>

				<label><b>Password</b></label>
				<input type="password" placeholder="Enter Password" name="password" required>
					
				<button type="submit">Login</button>
				<input type="checkbox" checked="checked"> Remember me
			
			  </div>

			  <div class="containerlogin" style="background-color:#f1f1f1">
				<button type="button" class="cancelbtn">Cancel</button>
				<span class="psw">Forgot <a href="#">password?</a></span>
			  </div>
			</form>
		</div>
	</div>
</body>
</html>
    