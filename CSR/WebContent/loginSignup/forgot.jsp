<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="jsp.*" %>
     <%@ page import="java.sql.*" %>
    <%@ page import="javax.sql.*" %>
  
  <%
  	String msg="",err="",ans="";
  	String regd =request.getParameter("id");
    String security =request.getParameter("security");  
	String answer =request.getParameter("answer");
	if(regd==null){
		regd="";
	}
	else{
		session.setAttribute("ID", regd);
		Connection c=MySQL.connect();
		err=Validate.validateRegd(regd);
		ans=Validate.validateAns(answer);
		if(c!=null){
			if(err.isEmpty() && ans.isEmpty()){
				boolean b=MySQL.forgotPassword(c,regd,security,answer);
				if(b==true){
					response.sendRedirect("changePassword.jsp");
				}
				else{
					msg="Miss Match Occured !";
				}
			}
		}
		
	}
	
     
    %>
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
<!--  <script>
	function validLogin(){
		if (document.form.id.value == ""){
			alert ( "ID Can not be Blank" );
			document.loginform.id.focus();
			return false;
			}
	if (document.form.answer.value == ""){
	alert ( "Answer Can not be Blank" );
	document.loginform.answer.focus();
	return false;
	}
	return true;
	}
</script>-->
</head>
 
<body>
	
	<div class="container dark">
		
	
	</div>
	<div class="container light">
		<div class="wrapper">
			
			<div id="logo_left">
			
				<img src="../img/cit.jpg" width="120" height="100">
				<h1>CULTURE</br>SPORTS </br>RESPONSIBILTY</h1>
			</div>
			
			<div id="logo_right">
				
					<ul>
						<li><a href="index.jsp">Home</a></li>
						<li><a href="login.jsp">CSR Login</a></li>
						
					</ul>
		
				
			</div>
		</div>
			<div id="clear">
			</div>
			
		</div>
	
	</div>
	
<div class="container">
		<div class="wrapper">
			
			
			 <div class="containerlogin">
			 
			 	<h2>Forgotten Password</h2>
			  <div class="imgcontainer">
				
				<img src="../img/l.png" height="100" width="100" alt="Avatar" class="avatar" onmouseover="this.src='../img/i.jpg'" onmouseout="this.src='../img/l.png'">
			  </div>
				<div class=errorr><%=msg %></div>
				<form action="" method="post" name="form" onclick="validLogin();">
				<table>
					<tr>
						<td>
						<label><b>Registration No :</b></label>
						<input type="text" placeholder="Enter ID" name="id" ></td>
					</tr>
					<tr><td><p class=errorr><%=err %></p></td></tr>
					<tr>
						<td><label><b>Security Question</b></label>
						<select name="security">
											
												<option value="What is Your Question ?">What is Your Question ? </option>
												<option value="What is my Number ?">What is my Number ?</option>
												<option value="DO You Know ?">DO You Know ?</option>
												<option value="About Ur Love .">About Ur Love .</option>
												<option value="Current Status">Current Status</option>
									
											</select></td>
					</tr>
					<tr>
						<td><label><b>Answer</b></label>
							<input type="password" placeholder="Enter Answer" name="answer" ></td>
					</tr>
					<tr><p class=errorr><%=ans %></p></tr>
					
					</table>
							
				<button type="submit">Submit</button>
				</form>
			  </div>

			
		</div>
	</div>
</body>
</html>
    