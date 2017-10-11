
<%@page import="java.io.InputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
     <%@ page import="jsp.*" %>
     <% 
  // Initialization of variables-- Fetch data from incharge table and will store into
	
				String regd="";
				String fname="";
				String lname="";
				String email="";
				String dept="";
				String clubname="";
				String mobile="";
   	  String id = (String)request.getSession().getAttribute("Regd");//Registration no will be fetched from session while login
     	if(id==null)
     	{
     		id="";
     	}
     	else{
							Connection c=MySQL.connect();
							if(c!=null){
								ResultSet rs=Incharge.fetchInchargeData(c,id);
								if(rs!=null){
									regd=rs.getString(1);
									fname=rs.getString(2);
									lname=rs.getString(3);
									email=rs.getString(4);
									dept=rs.getString(5);
									clubname=rs.getString(6);
									mobile=rs.getString(7);
								}
								else{
									String error="No Data Found";
								}
					
							}
							else{
								String error="No Connection";
							}
     	}
						
						%>
		
		<% 
		// validation ends here
		String regd_error=(String) request.getAttribute("regdno_error");
		String fname_error=(String) request.getAttribute("fname_error");
		String lname_error=(String) request.getAttribute("lname_error");
		String email_error=(String) request.getAttribute("email_error");
		String mobile_error=(String) request.getAttribute("mobile_error");
		String altermobile_error=(String) request.getAttribute("altermobile_error");
		
		
		%>
			 			
		
<!DOCTYPE html>
<html>
<head>
	<title>CSR-Student Profile </title>
	<link rel="icon" href="../img/l.png">
	<meta http-equiv="Content-Type" content="text/html" charset="utf-8"/>
	
	<link rel="stylesheet" href="profile/incharge_dasboard.css" type="text/css"/>

	
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<div class="head">
		
	</div>
</head>
<style>
	.signupBox h3{
		color:red;
		
	}
</style>
<body>
 
	<div class="container">
		<div class="header" >
			<div id="topleft">
				
					<h2>Culture Sports Responsibility</h2>
			 </div>
	
		
			
							
			<div id="topright">
					<button class="displayname">
					<img src="../img/myprofile.png" class="user-image" alt="User Image">
					<p><%=fname %><b> </b><%=lname %></p>
					</button>
					
					
			</div>
			<div id="clear">
			</div>
		</div>
	
	</div>
	

	
	
		<div id="Register" class="tabcontent_error">
	
		<div class="signupBox">
		
		
		<h2>Registration For Club..</h2>
		<form action="../Register" method="post" ">
		
		<table width="100%" cellpadding="5px" cellspacing="12px">
			
			<tr>
				<td>
					<p>Registration No<p>
					<input type="text" name="registration_no" value="<%=session.getAttribute("regist")%>" readonly="readonly"/>
				</td>
				<td></td>
				
				<td>
					<p>BlooD GrouP<p>
						<select name="bg" required autocomplete="off">
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
					<select name="gender" required autocomplete="off">
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
					<p>First Name<p>
					<input type="text" name="fname"  required autocomplete="off" />
				</td>
				<td></td>
				
				<td>
					<p>Middle Name<p>
					<input type="text" name="mname"   />
				</td>
				
				
				<td>
					<p>Last Name<p>
					<input type="text" name="lname"  required autocomplete="off">
					
				</td>
				
			</tr>
			<tr>
				<td><h3><%=fname_error %></h3></td>
				<td></td>
				<td><h3><%=lname_error%></h3></td>
			</tr>
		</table>
	
				
				
		<table width="100%" cellpadding="5px" cellspacing="12px">
			<tr>
				<td>
					<p>Email<p>
					<input type="text" name="email"  required autocomplete="off">
					
				</td>
				
				<td>
					<p>Mobile No<p>
					<input type="text" name="mobile"  required autocomplete="off">
					
				</td>
				<td>
					<p>Alternate Mobile No<p>
					<input type="text" name="alternate_mobile"  required autocomplete="off">
					
				</td>
				<td></td>
			</tr>
			
			<tr>
				<td><h3><%=email_error %></h3></td>
				<td><h3><%=mobile_error %></h3></td>
				<td><h3><%=altermobile_error %></h3></td>
			</tr>
			
			
			
			</table >
			
			
			<table width="100%" cellpadding="5px" cellspacing="12px">
			
			<tr>
				<td>
					<p>Course<p>
						<select name="course" required autocomplete="off">
							  <option value="BTech"> BTech</option>
							  
							  <option value="MTech">MTech</option>
							  <option value="Diploma">Diploma</option>
							  <option value="BSc">BSc</option>
							  <option value="Gram_Tarang"> Gram Tarang</option>
							  
							 
						</select>
				</td>
				<td></td>
				
				<td>
					<p>Department<p>
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
					<p>Semester<p>
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
			</table>
			
			
				<div class="headbar"><h4> Club Details</h4></div>
			<table width="100%" cellpadding="5px" cellspacing="12px">
			
			<tr>
				<td>
					<p>Club Type</p>
						<select name="clubtype" required autocomplete="off">
							  <option value="cultural">Cultural</option>
							  <option  value="sports">Sports</option>
							  <option value="responsiblity">Responsiblity</option>
							 
						</select>
				</td>
				<td>
					<p>Club Name</p>
						<select name="clubname" required autocomplete="off">
							 <optgroup label="CULTURAL DEPT">
							
							  <option value="MUSIC CLUB RHYTHM">MUSIC CLUB "RHYTHM"</option>
							  <option value="DANCE CLUB STEPUP">DANCE CLUB STEP UP</option>
							  <option value="DRAMATIC CLUB ACTION PLAY">DRAMATIC CLUB ACTION PLAY</option>
							  <option value="PAINTING CLUB KRETON">PAINTING CLUB KRETON</option>
							  <option value="MOVIE CLUB ">MOVIE CLUB </option>
							  <option value="LAUGHTER CLUB">LAUGHTER CLUB</option>
							  <option value="LITERARY CLUB SRUJANEE">LITERARY CLUB "SRUJANEE"</option>
							  <option value="ROBOTICS CLUB">ROBOTICS CLUB</option>
							  <option value="LANGUAGE CLUB SCINTILLA">LANGUAGE CLUB "SCINTILLA"</option>
							  <option value="INNOVATEUR CLUB">INNOVATEUR CLUB</option>
							  <option value="DESIGNER CLUB PHOTOCHRONICLES">DESIGNER CLUB PHOTOCHRONICLES</option>
							  <option value="HANDICRAFT CLUB ARTISAN">HANDICRAFT CLUB ARTISAN</option>
							  <option value="Science Club ILLUMINATI">Science Club "ILLUMINATI"</option>
							</optgroup>
							 	<option value=""></option>
							<optgroup label="SPORTS DEPT">
							  <option value="SPORTS, SEDA & HEALTH CLUB ">SPORTS, SEDA & HEALTH CLUB </option>
							  <option value="PC GAME CLUB XENA">PC GAME CLUB XENA</option>
							  <option value="HEALTH CLUB">HEALTH CLU</option>
							  <option value="ADVENTURE CLUB VOYAGE">ADVENTURE CLUB VOYAGE</option>
							  <option value="YOGA & MEDITATION CLUB">YOGA & MEDITATION CLUB</option>
							</optgroup>
							<option value=""></option>
							<optgroup label="RESPONSIBILTY">
							  <option value="YOUTH RED CROSS, NSS, NCC CLU">YOUTH RED CROSS, NSS, NCC CLU</option>
							  <option value="NATURE CLUB">NATURE CLUB</option>
							  <option value="GO GREEN CLUB">GO GREEN CLUB</option>
							  <option value="P & P CLUB">P & P CLUB</option>
							  <option value="APTI CLUB">APTI CLUB</option>
							</optgroup> 
							 
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
    