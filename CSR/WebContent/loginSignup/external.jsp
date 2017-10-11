
<%@page import="java.io.InputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
     <%@ page import="jsp.*" %>
     <% 
     String id = (String)request.getSession().getAttribute("Regd");
	
		
		String roww="";
		FileInputStream fis = null;
		String msg2="",bg2="",gender2="",fname2="",mname2="",lname2="";
		int row;
			
		    String regd2 =request.getParameter("registration_no");
			bg2 =request.getParameter("bg");
			gender2 =request.getParameter("gender");
			fname2 =request.getParameter("fname");
			mname2 =request.getParameter("mname");
			lname2 =request.getParameter("lname");
			
			String email2 =request.getParameter("email");
			String mobile2 =request.getParameter("mobile");
			String altmobile =request.getParameter("alternate_mobile");
			
			String course =request.getParameter("course");
			String dept2 =request.getParameter("department");
			String sem =request.getParameter("semester");
			String clubtype2 =request.getParameter("clubtype");
			String clubname2 =request.getParameter("clubname");
			
			 File image = new File("C:\\Users\\SONUSILU\\Desktop\\PROJECT\\CSR\\img\\c.jpg");
			 fis = new FileInputStream(image);
             
			//String image =request.getParameter("image");
			
			String regd_er="",email_er="",mobile_er="",altermobile_er="",fname_er="",lname_er="";
			if(regd2==null || fname2==null){
				//response.sendRedirect("");
				
				fname2="";
				mname2="";
				lname2="";
				
			}
			else{
				 String clubname = (String)request.getSession().getAttribute("inchargeclubname");
				 String clubtype = (String)request.getSession().getAttribute("inchargeclubtype");
					
			    regd_er=Validate.validateRegd(regd2);
				fname_er=Validate.validateFname(fname2);
				lname_er=Validate.validateLname(lname2);
				email_er=Validate.validateEmail(email2);
				mobile_er=Validate.validateMobile(mobile2);
				altermobile_er=Validate.validateAlterMobile(altmobile,mobile2);
			// validation ends here
			
			
	       // request.getRequestDispatcher("profile/incharge_dashboard.jsp").forward(request, response);
			
			if(regd_er.isEmpty() && email_er.isEmpty() && fname_er.isEmpty() && lname_er.isEmpty() && mobile_er.isEmpty() && altermobile_er.isEmpty())// After Validation Inputs are RIght way i.e is No Error ... Error is Empty
    		{
    	
    		Connection c= MySQL.connect();
    		if(c !=null){
    			//roww=RegisterJavaCode.registerStudentTable(c,regd2,fname2,mname2,lname2,bg2,gender2,email2,mobile2,altmobile,course,dept2,sem,clubtype2,clubname);
    			
    			}
    		else{
    			roww="Null";
    		}
    		}
			}
		%>
					
		
<!DOCTYPE html>
<html>
<head>
	<title>CSR-Student Profile </title>
	<link rel="icon" href="../img/l.png">
	<meta http-equiv="Content-Type" content="text/html" charset="utf-8"/>
	
	<link rel="stylesheet" href="in2.css" type="text/css"/>

	
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
				<h1>External Account Register</h1>
			</div>
			
			<div id="logo_right">
				
					<ul>
						<li><a href="index.jsp">Home</a></li>
						<li><a href="signup.jsp">CSR Account</a></li>
						<li><a href="login.jsp">Login</a></li>
						
					</ul>
		
				
			</div>
		</div>
			<div id="clear">
			</div>
			
		</div>
	
	</div>
	
	
<div id ="container">
	
	<!-- Start Registration -->
	
	
		<div id="Register" class="tabcontentt">
	
		<div class="signupBox">
		
		
		<h2 class="error"><%=roww %></h2>
		<form action="" method="post" ">
		
		<table width="100%" cellpadding="5px" cellspacing="12px">
			
			<tr>
				<td>
					<p>Registration No<p>
					<input type="text" name="registration_no" />
				</td>
				<td>
					<p>BlooD GrouP<p>
						<select name="bg" required autocomplete="off" >
							  <option value="A+">A+ </option>
							  <option value="A-">A- </option>
							  <option value="B+"> B+</option>
							  <option value="B-">B- </option>
							  <option value="O+"> O+</option>
							  <option value="O-">O- </option>
							  <option value="AB+"> AB+</option>
							  <option value="AB-"> AB-</option>
							  
							 
							 
						</select>
				</td>
				<td>
					 <p>Gender<p>
					<select name="gender" required autocomplete="off" >
							  <option value="male">Male</option>
							  <option value="female">Female</option>
							  
					</select>
				</td>
			</tr>
			
			<tr>
				<td></td><!-- Error will Display if Id is not Proper format ---from Register.java  --> 
				
			
			</tr>
			<tr>
				<td>
					<p>First Name</p>
					<input type="text" name="fname"  required autocomplete="off"  value="<%=fname2%>"/>
				</td>
				
				
				<td>
					<p>Middle Name</p>
					<input type="text" name="mname"    value="<%=mname2%>"/>
				</td>
				
				
				<td>
					<p>Last Name</p>
					<input type="text" name="lname"  required autocomplete="off"  value="<%=lname2%>">
					
				</td>
				
			</tr>
			<tr class="error">
				<td><%=fname_er %></td>
				<td></td>
				<td><%=lname_er %></td>
			</tr>
			<tr>
				<td>
					<p>Email</p>
					<input type="text" name="email"  required autocomplete="off">
					
				</td>
			
				<td>
					<p>Mobile No</p>
					<input type="text" name="mobile"  required autocomplete="off">
					
				</td>
				<td>
					<p>Alternate Mobile No</p>
					<input type="text" name="alternate_mobile"  required autocomplete="off">
					
				</td>
				
			</tr>
			
			
			<tr class="error">
				<td><%=email_er %></td>
				<td><%=mobile_er%></td>
				<td><%=altermobile_er %></td>
			</tr>
			
			<tr>
				<td>
					<p>Course</p>
						<select name="course" required autocomplete="off">
							  <option value="BTech"> BTech</option>
							  
							  <option value="MTech">MTech</option>
							  <option value="Diploma">Diploma</option>
							  <option value="BSc">BSc</option>
							  <option value="Gram_Tarang"> Gram Tarang</option>
							  
							 
						</select>
				</td>
				
				
				<td>
					<p>Department</p>
						<select name="department" required autocomplete="off">
							  <option value="cse">CSE</option>
							 <option value="mech">MECH</option>
							 <option value="civil">CIVIL</option>
							 <option value="ee">EE</option>
							 <option value="">EEE</option>
							 <option value="">ECE</option>
							
							 
						</select>
					
				</td>
		
				
				<td>
					<p>Semester</p>
					<select name="semester" required autocomplete="off">
						<option value="1st">1<sup>st</sup> Semseter</option>
						<option value="2nd">2<sup>nd</sup> Semseter</option>
						<option value="3rd">3<sup>rd</sup> Semseter</option>
						<option value="4th">4<sup>th</sup> Semseter</option>
						<option value="5th">5<sup>th</sup> Semseter</option>
						<option value="6th">6<sup>th</sup> Semseter</option>
						<option value="7th">7<sup>th</sup> Semseter</option>
						<option value="8th">8<sup>th</sup> Semseter</option>	  
					</select>
				</td>
				<td></td>
				
			</tr>
			
				
			<tr>
				<td>
					<p>Activity Type</p>
						<select name="activitytype" required autocomplete="off">
							<option  value="Blood Donation">Blood Donation</option>
							  <option value="other">Others</option>
							 
						</select>
				</td>
				</tr>
				
			<tr>
				<td>
					<p>Pic Image<p>
					 <input type="file" name="image">
				</td>
				<td></td>
			</tr>
			
			
				
		</table></br>
		<div class="submit">
				<input type="submit" name="submit" onsubmit="submitFunction()"value="Submit">
		</div>		
		
		</form>
		
	</div>
			
	<!-- End Of Registration -->		
		</div>
</div>
</body>
</html>
    