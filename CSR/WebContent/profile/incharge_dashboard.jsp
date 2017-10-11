<%@page import="org.apache.catalina.ha.session.SessionMessage"%>
<%@page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
     <%@ page import="jsp.*" %>
     <% 
  // Initialization of variables-- Fetch data from incharge table and will store into
	
   	String regd="",fname="",lname="",email="",dept="",clubname="",clubtype="",mobile="";
				
   	  String id = (String)request.getSession().getAttribute("Regd");
     	if(id==null)
     	{
     		response.sendRedirect("../loginSignup/login.jsp");
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
									clubtype=rs.getString(7);
									mobile=rs.getString(8);
									
									session.setAttribute("inchargefname", fname);
									session.setAttribute("inchargelname", lname);
									session.setAttribute("inchargeclubname", clubname);
									session.setAttribute("inchargeclubtype", clubtype);
								}
								
								else{
									String error="No Data Found";
								}
					session.removeValue(fname);
					session.removeValue(lname);
					session.removeValue(clubname);
					session.removeValue(clubtype);
							}
							else{
								String error="No Connection";
							}
     	}
						
						%>
		<%
		
		String search=request.getParameter("search");
		String studentId="", studentFname="",studentMname="",studentLname="",studentBg="",studentGender="",studentClubName="",studentCourse="";
		String studentEmail="",studentMobile="",studentDept="",studentAlternate="",studentSemester="",studentClubType="";
		Blob studentImage;
		String error="";
		
		if(search==null){
			search="";
		}else{
			
			error=Validate.validateRegd(search);
			if(error.isEmpty()){
				Connection c2=MySQL.connect();
				if(c2!=null){
						
					boolean check=MySQL.checkStudent(c2,search,clubname);
					if(check==true){
					
						ResultSet rs1=Incharge.searchStudentData(c2,search,clubname);
							if(rs1!=null){
								
								studentId=rs1.getString(1);
								studentFname=rs1.getString(2);
								studentMname=rs1.getString(3);
								studentLname=rs1.getString(4);
								studentBg=rs1.getString(5);
								studentGender=rs1.getString(6);
								studentEmail=rs1.getString(7);
								studentMobile=rs1.getString(8);
								studentAlternate=rs1.getString(9);
								studentCourse=rs1.getString(10);
								studentDept=rs1.getString(11);
								
								studentSemester=rs1.getString(12);
								studentClubType=rs1.getString(13);
								studentClubName=rs1.getString(14);
								studentImage=rs1.getBlob(15);
								
								rs1.close();
								
							}
							else{
								error="Registration No "+search+" is not Registered for "+clubname;
							}

					}
					else{
						error="No Data Found for this Registration no : "+search;
					}
					c2.close();
				}
				else{
					error="No Connection Exist  !";
				}
			}
			else{
				error="Please Enter a Valid Registration no.";
			}
		}
		%>
		<%
			String regist =request.getParameter("regist");
			
		String msg="",regist_error="";
		if(regist==null){
			regist="";
		}
		else{
			regist_error=Validate.validateRegd2(regist);
				if(regist_error.isEmpty()){
					session.setAttribute("regist", regist);
					Connection c3=MySQL.connect();
					if(c3!=null){
						session.setAttribute("regist", regist);
						int countStudent=RegisterJavaCode.checkStudentRegister(c3,regist);
						int count=RegisterJavaCode.checkCount(c3,regist);
						System.out.println(countStudent);
						System.out.println(count);
						if(countStudent == 0 && count==0)
						{
							response.sendRedirect("reg.jsp");
									//remove session value
								}
								else if(count < 3) {
									response.sendRedirect("lesscount.jsp");
								//System.out.println(count);
								}
								else{
								
									msg="Maximum Limit Crossed......!! Registration No : "+regist+" is Already Registered In 3 clubs.. Contact To CSR INcharge for Registartion ";
									
									}
					}
					else{
						msg="No Connection Exist !";
					}
			
		}
		}
		
		%>
		 			
		
<!DOCTYPE html>
<html>
<head>
	<title>CSR-In-charge Profile </title>
	<link rel="icon" href="../img/l.png">
	<meta http-equiv="Content-Type" content="text/html" charset="utf-8"/>
	
	<link rel="stylesheet" href="incharge_dasboard.css" type="text/css"/>
	<link rel="stylesheet" href="profile/incharge_dasboard.css" type="text/css"/>

	<link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
	<!-- Side Bar Css-->
	<link rel="stylesheet" href="sidebar.css" type="text/css"/>
	<link rel="stylesheet" href="profile/sidebar.css" type="text/css"/>
	
	<!-- 
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
	
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
 
	<div class="container2">
		<div class="header" >
			<div id="topleft">
				
					 <h1>Culture Sports Responsibility</h1>
			 </div>
	
		
			
							
			<div id="topright">
					<div class="displayname">
					<img src="../img/myprofile.png" class="user-image" alt="User Image">
					<p><%=fname %><b> </b><%=lname %></p>
					</div>
					
						<a href="../loginSignup/logout.jsp" class="logout">Logout</a>
					
			</div>
			<div id="clear">
			</div>
		</div>
	
	</div>
	
<div id ="container">
	
	<div class="tab">
		
		 <button class="tablinks" onclick="openCity(event, 'Dashboard')" id="defaultOpen">Dashboard</button>
		 <button class="tablinks" onclick="openCity(event, 'Profile')">Profile</button>
		 
		<button type="button" class="tablinks" data-toggle="collapse" data-target="#demo"> Student Info</button>
		  <div id="demo" class="collapse">
		    <button class="tablinks" onclick="openCity(event, 'Register')">Registration</button>
		    <button class="tablinks" onclick="openCity(event, 'getAll')">Registered Student</button>
				<button class="tablinks" onclick="openCity(event, 'Attendance')">Attendance</button>
				<a href="Search.jsp"><button href="Search.jsp"class="tablinks" >Search</button></a>
			</div>
			
			
		
		
		<button class="tablinks" onclick="openCity(event, 'CSR_Booklet')">CSR BookleT Update</button>
		<button class="tablinks" onclick="openCity(event, 'Event')">Events</button>
		<button class="tablinks" onclick="openCity(event, 'Club_Activity')">Club Activity & Lists</button>
		<button class="tablinks" onclick="openCity(event, 'Notices')">Notice Board</button>
		<button class="tablinks" onclick="openCity(event, 'Equipments')">Equipments</button>
		<button class="tablinks" onclick="openCity(event, 'Change_Password')">Change Password</button>
		
		
	
	</div>
		
		<div id="Dashboard" class="tabcontent">
			<div class="content">
				<h2>Dashboard</h2>
				
					<div class=welcomemsg>
						
						<p><h3>Welcome : </h3><b><%=fname %><b> </b><%=lname %></b></p>
						<h4><%=msg %></h4>
						
						<h4><%=regist_error %></h4>
					</div>
					<!-- <div id="box">
						<div class="box-top">
							Event
						</div>
						<div class="box-panel">
							Event Information
						</div>
					<div class=Sessionmsg>
						
					</div>
					
				</div>
				 -->
				
			</div>
		</div>
		<div id="Profile" class="tabcontent">
					
			<div class="profilebar">
				<h3>Profile</h3>
			</div>
			<div class="tabularData">
					<table border="1px solid #175089"  cellspacing="pixels">
						<tr>
						<th>Registered Id</th>
						<th>First Name</th>
						<th>Last Name</th>
						<th>Email</th>
						<th>Department</th>
						<th>Responsible Club</th>
						<th>Mobile No</th>
						</tr>
					
						<tr>
							<td><%=regd %></td>
							<td><%=fname %></td>
							<td><%=lname %></td>
							<td><%= email%></td>
							<td><%=dept %></td>
							<td><%= clubname%></td>
							<td><%= mobile%></td>
							
						</tr>
						
					</table>	
			</div>
		</div>
		
	
		<!-- Student Information -->
		
		
		
		
	<!-- Start Registration -->
	
	
		<div id="Register" class="tabcontent">
	
			<div class="signupBox">
			
				<h2>Registration For Club..</h2>
				<form action="" method="post" > <!-- ../Reg -->
							<p>Registration No<p>
							<input type="text" name="regist" placeholder="Enter Registration No"/>
							<input type=submit Value="Register">
				</form>
				<p><%=msg %></p>
				<p><%=regist_error %></p>
			</div>

		</div>
	<!-- End Of Registration -->	
	<div id="getAll" class="tabcontent">
			<h3>Registered Student</h3>
				<p>Registered Student Page</p>
		</div>
		<div id="Attendance" class="tabcontent">
			<div class="attendance">
				<h2>Attendance</h2>
				<div class="AttendanceBox">
					<div class="attBAr">
						<p>Attendance Form</p>
					</div>
				<form action="attendance.jsp">
					<table cellpadding="15px" cellspacing="20px">
						<tr>
						<td>
						<p>Date :</p>
						<input type="date" name="date" required autocomplete="off">	</td>
						<td><b> </b></td>
						
						<td>
							<p>Class Hour :</p>
							<select name="classhour" required autocomplete="off">
							  <option value="2:05 - 3:25">2:05 - 3:25</option>
							  <option value="3:25 - 4:55">3:25 - 4:55</option>
							</select>
						</td>
						</tr>
						
					</table>
					<div class="submitBtn">
						<input type="submit" name="submit" value="Submit">
					</div>
					</form>	
				</div>	
				
				
				
				
				
				
				
				
				
				
				
				
				
				
			</div>	
		</div>
		<div id="Student_Activity" class="tabcontent">
			<h3>Student Activity</h3>
				<p>Student Activity Page</p>
		</div>
		<div id="Search" class="tabcontent">
			<div class="SearchBar">
				<h3>Search Student Records</h3>
			</div>
			<div class="searchBox" id="searchPage">
				<form action="Search.jsp">
					<input type="text" name="search" placeholder="Search Registration No">
					<input type="submit" name="submitt" value="Search">
					
				
				</form>
				<p></p>
			</div>
			<div class="getAll">
				<div class="SearchBar">
					<h3>Student Records Registered For :<b> <%=clubname %></b></h3>
				</div>
	
				<%
				String p="";
				Connection c2=MySQL.connect();
				if(c2!=null){
					
						try {
							
							String q1="select * from studentregister where clubname=?";
							PreparedStatement ps=c2.prepareStatement(q1);
							
							ps.setString(1, clubname);
							ResultSet rs200=ps.executeQuery();
							if(rs200.equals(null)){
								p="No records found";
								}
							else{
								String str="<table border='1px solid grey'class='tableClass' cellpadding='15px'><tr><th>User Id</th> <th>Name</th><th>Registerd Club Name</th></tr>";
								String mn="";
								while(rs200.next()){
									
									if(rs200.getString(3)==""){
										mn=" ";
									}
									else{
										mn=rs200.getString(3);
										
										}
									str+="<tr><td>"+rs200.getString(1)+"</td><td>"+rs200.getString(2)+" "+mn+" "+rs200.getString(4)+"</td><td>"+rs200.getString(14)+"</td></tr>";
									
									}
								str+="</table>";
								out.println(str);
								c2.close();
							}
							
						}catch(Exception e) {
							throw new Error(e);
						}
				}
				%>
			</div>
			
		</div>
	
	
	<!-- End Student iNformation -->
	
	
		
		<div id="CSR_Booklet" class="tabcontent">
			<h3>CSR BookLet</h3>
				<p>CSR BookLet Updates page</p>
		</div>
		
		
		<div id="Club_Activity" class="tabcontent">
			<h3>Club Activity</h3>
				<p>Club Activity and Lists..</p>
		</div>
		<div id="Event" class="tabcontent">
			<h3>Event</h3>
				<p>Events and Upcoming Events</p>
		</div>
		
		<div id="Notices" class="tabcontent">
			<h3>Notices</h3>
				<p>Notices Page</p>
		</div>
		<div id="Equipmens" class="tabcontent">
			<h3>Equipments</h3>
				<p>Different Types of Equipments here.</p>
		</div>
		<div id="Change_Password" class="tabcontent">
			<h3>Change Password</h3>
				<p>Update Your Password..</p>
		</div>

		<script>
					function openCity(evt, cityName) {
						var i, tabcontent, tablinks;
						tabcontent = document.getElementsByClassName("tabcontent");
						for (i = 0; i < tabcontent.length; i++) {
							tabcontent[i].style.display = "none";
						}
						tablinks = document.getElementsByClassName("tablinks");
						for (i = 0; i < tablinks.length; i++) {
							tablinks[i].className = tablinks[i].className.replace(" active", "");
						}
						document.getElementById(cityName).style.display = "block";
						evt.currentTarget.className += " active";
					}

				// Get the element with id="defaultOpen" and click on it
				document.getElementById("defaultOpen").click();
		</script>
</div>
</body>
</html>
    