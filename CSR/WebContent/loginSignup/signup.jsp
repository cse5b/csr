<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*" %>
    <%@ page import="javax.sql.*" %>
    <%@ page import="java.sql.DriverManager" %>
    <%@ page import="java.sql.PreparedStatement" %>
    <%@ page import="java.sql.SQLException" %>
    <%@ page import="java.sql.Statement" %>
    <%@ page import="java.util.regex.Matcher"%>
	<%@ page import="java.util.regex.Pattern"%>
	<%@ page import="jsp.*,java.util.*"%>
    <%!
   
		
	
		    
    %>
    <%
    String regd =request.getParameter("regdno");  
	String email =request.getParameter("email");
	String pass =request.getParameter("password");
	String type =request.getParameter("type");
	String quest =request.getParameter("security");
	String ans =request.getParameter("answer");
	String regd_error="",email_error="",pass_error="",type_error="",norecord="",ans_error="";
	
    
    if(regd == null){
    	regd="";
    	email="";
    }
    else{
    	regd_error=Validate.validateRegd(regd);
    	email_error=Validate.validateEmail(email);
    	pass_error=Validate.validatePassword(pass);
    	type_error=Validate.validateType(type);
    	ans_error=Validate.validateAns(ans);
    	if(regd_error.isEmpty() && email_error.isEmpty() && pass_error.isEmpty() && type_error.isEmpty() && ans_error.isEmpty())// After Validation Inputs are RIght way i.e is No Error ... Error is Empty
    		{
    		
    		Connection c= MySQL.connect();
    		if(c !=null){
    			
    			boolean test=MySQL.testUser(c,regd);// returns User Exist or not CSR_Register table
    			if(test==true){
    				if(regd.length()!=12){
    					//go check for incharge table
    					boolean check=Incharge.checkIncharge(c, regd);
    					if(check==true){
    						out.println(type);
    						if(type.equals("incharge")){
    							boolean b=MySQL.insertUser2(c,regd,email,pass,type,quest,ans);
        	    				response.sendRedirect("success.jsp");
    						}
    						else{
    							norecord="Please Select Correct Type : 'Incharge'";
    						}
    						
    					}
    					else{
    						norecord="Seems , Id "+regd+" is not Registerd For Any CSR Faculty.\n Please Contact to Head of Incharge.";
    					}
    				}
    				else{
    					//check for sudent table tht user exist in
    					boolean check=MySQL.checkStudentt(c,regd);
    				
    					if(check==true){
    						if(type.equals("student")){
    							boolean b=MySQL.insertUser2(c,regd,email,pass,type,quest,ans);
        	    				//response.sendRedirect("success.jsp");
        	    				if(b==true){
        	    					norecord="Registerd Successfull Done";
        	    				}
        	    				else{
        	    					norecord="Internal Error";
        	    				}
    						}
    						else{
    							norecord="Please Select Correct Type : 'Student'";
    						}
    					}
    					else{
    						norecord="Seems , The registration no "+regd+" is not Registerd In CSR Activity yet..\n Please Contact to Asigned CSR Faculty.";
    					}
						
    				}
						
    				}
    			else{
            			regd_error="Registartion No is already Exists";
            		}
    				
        			
        			
        	}
    			
    			
    		}	
    	
    
    
    }  
    %>
<!DOCTYPE html>
<html>
<head>
	<title>CSR-Sign Up Page </title>
	<link rel="icon" href="img/l.png">
	<meta http-equiv="Content-Type" content="text/html" charset="utf-8"/>
	<link rel="stylesheet" href="in2.css" type="text/css"/>
	<link rel="stylesheet" href="signup.css" type="text/css"/>

	<link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
	
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<div class="head">
		
	</div>
	
</head>
<body>
	
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
	
<div class="container2">
		<div class="wrapper">


				<form action="" style="border:1px solid #ccc" name="form">
				 <div class="containersignup">
					<div class="imgcontainer">
						<img src="../img/register-now-button.jpg" height="100" width="100" alt="Avatar" class="avatar" onmouseover="this.src='../img/i.jpg'" onmouseout="this.src='../img/register-now-button.jpg'">
				 	 </div>
			  		<div class=norecord_error>
			  			<p><%=norecord %></p>
			 		 </div>
				 
				  <table>
				  	<tr>
				  			  	<td><label><b>Registration No</b></label>
									<input type="text" placeholder="Enter Registration no" name="regdno" value="<%=regd%>"></td>
									<td><div class=error_msg><%= regd_error %></div></td>
					</tr>	
					<tr>  	
									<td><label><b>Email</b></label>
									<input type="text" placeholder="Enter Email" name="email" value="<%=email%>"></td>
									<td><div class=error_msg><%=email_error %></div></td>
					</tr>
					<tr>
									<td><label><b>Password</b></label>
									<input type="password" placeholder="Enter Password" name="password" value=""></td>
									<td><div class=error_msg><%=pass_error %></div></td>
					</tr>
					<tr>
									<td><label><b>Type</b></label>
									<select name="type">
									
										<option value="student">Student</option>
										<option value="incharge">Incharge</option>
										
										
									
									</select>
									</td>
									<td><div class=error_msg><%=type_error %></div></td>
					</tr>
					<tr>
									<td><label><b>Security</b></label>
									<select name="security">
									
										<option value="What is Your Question ?">What is Your Question ? </option>
										<option value="What is my Number ?">What is my Number ?</option>
										<option value="DO You Know ?">DO You Know ?</option>
										<option value="About Ur Love .">About Ur Love .</option>
										<option value="Current Status">Current Status</option>
							
									</select>
									</td>
									
					</tr>
					<tr>
				  			  	<td><label><b>Answer</b></label>
									<input type="password" placeholder="Give your Security Ans" name="answer" ></td>
									<td><div class=error_msg><%= ans_error %></div></td>
					</tr>
					
					</table>
					<table>				
					<tr>
						
							<td>  <button type="button" class="cancelbtn">Cancel</button></td>
							 <td> <button type="submit" class="signupbtn">Sign Up</button></td>
							</tr>
					</table>
				  </div>
				</form>
		</div>
	</div>

</body>
</html>
