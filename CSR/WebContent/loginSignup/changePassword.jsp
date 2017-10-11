<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="jsp.*" %>
     <%@ page import="java.sql.*" %>
    <%@ page import="javax.sql.*" %>
    <%
    String pass =request.getParameter("password");  
	String pass2 =request.getParameter("confirmpassword");
	
	String msg="";
	String pass_error=null,pass2_error=null,msgtrue="";
	 String id = (String)request.getSession().getAttribute("ID");
    if(id==null ){
    	response.sendRedirect("forgot.jsp");
    }
    else{
    	if(pass==null || pass2==null){
    		pass="";
    		pass2="";
    	}
    	pass_error=Validate.validatePassword(pass);
    	pass2_error=Validate.validatePassword(pass2);
    	if(pass_error.isEmpty() && pass2_error.isEmpty()){
    		if(pass.equals(pass2)){
        	
	        	Connection c=MySQL.connect();
	        	if(c!=null){
	    			
    				boolean b=MySQL.updatePassword(c,id,pass);
    				if(b==true){
    					out.println("<html><script>alert('Password Changed Successfully ..');</script></html>");
    				
    					response.sendRedirect("login.jsp");
    					//msgtrue="Password Changed Successfully ..";
    				}
    				else{
    					msg="Miss Match Occured !";
    				}
       		 }
    		}
    	else{
        	msg="Entered Passwords Not Matched !";
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
						<li><a href="signup.jsp">CSR Account</a></li>
						<li><a href="external.jsp">External Acount</a></li>
						
					</ul>
		
				
			</div>
		</div>
			<div id="clear">
			</div>
			
		</div>
	

	
<div class="container">
		<div class="wrapper">
			
			<form action="" name="form">
			 <div class="containerlogin">
				  <div class="imgcontainer">
					
					<img src="../img/myimage.png" height="100" width="100" alt="Avatar" class="avatar" onmouseover="this.src='../img/i.jpg'" onmouseout="this.src='../img/myimage.png'">
				  </div>
				<div class=errorr><%=msg %></div>
			 
			  
			  
				<label><b>Password</b></label>
				<input type="password" placeholder="Enter Password" name="password">
				<p class=incorrect><%=pass_error %></p>
				
				<label><b>Confirm Password</b></label>
				<input type="password" placeholder="Enter Confirm Password" name="confirmpassword" >
					<p class=incorrect><%=pass2_error %></p>
					
				<button type="submit">Submit</button>
				
			  </div>

			 
			</form>
		</div>
	</div>
</body>
</html>
    