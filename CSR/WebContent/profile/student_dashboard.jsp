<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*" %>
     <%@ page import="jsp.*" %>
    
    <%
    String studentId="", studentFname="",studentMname="",studentLname="",studentBg="",studentGender="",studentClubName="",studentCourse="";
	String studentEmail="",studentMobile="",studentDept="",studentAlternate="",studentSemester="",studentClubType="",error="",fetchClubtype="",fetchClubname="";
	Blob studentImage;
    String id = (String)request.getSession().getAttribute("Regd");
    %>
    <%
 	if(id==null)
 	{
 		response.sendRedirect("../loginSignup/login.jsp");
 	}
 	else{
						Connection  c=MySQL.connect();
						if(c!=null){
							ResultSet rs1=StudentOperation.StudentData(c,id);
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
								session.setAttribute("StudentFname", studentFname);
								session.setAttribute("StudentMname", studentMname);
								session.setAttribute("StudentLname", studentLname);
							}
							else{
								error="No Data Found";
							}
						}
 	}
					
    
    %>

    
<!DOCTYPE html>
<html>
<head>
	<title>CSR-Student Profile </title>
	<link rel="icon" href="img/l.png">
	<meta http-equiv="Content-Type" content="text/html" charset="utf-8"/>
	
	<link rel="stylesheet" href="student_dasboard.css" type="text/css"/>

	<link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
	<!-- Side Bar Css-->
	<link rel="stylesheet" href="sidebar.css" type="text/css"/>
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<div class="head">
		
	</div>
	
</head>
<body>
	<div class="container color">
		<div class="wrapper" id="top_div">
			<div id="topleft">
				
					 <span class="logo-mini"><b>CSR</b> </span>
					  <!-- logo for regular state and mobile devices -->
					  <span class="logo-lg"><b>Student </b>Profile</span>
			 </div>
			 <div id="topright">
					<div class="displayname">
					<img src="../img/myprofile.png" class="user-image" alt="User Image">
					<p><%=studentFname %><b> </b><%=studentLname %></p>
					</div>
					
						<a href="../loginSignup/logout.jsp" class="logout">Logout</a>
					
			</div>
			<div id="clear">
			</div>
		</div>
	
	</div>
	<!--
			<div id ="container">
				<div class="sidebar">
					<ul id="nav">
						<li><a href="adminpage.html" class="selected">Dashboard</a></li>
						<li><a href="studentpanel.html" >Student Panel</a></li>
						<li><a href="examination.html">Examination</a></li>
						<li><a href="marks.html">Marks</a></li>
						<li><a href="manages.html">Manages</a></li>
						<li><a href="changepasswod.html">Password</a></li>
						<li><a href="feedback.html">Feedback</a></li>
					</ul>
				</div>

			</div>  -->
<div id ="container">
	<!--  <div class="menu-greeting">
		<div class="profilehead">
			<h3>MENU</h3>
		 </div>
		 <div class="side-menu">
			<h4>Greeting SILU</h4>
		</div>
	</div>-->
	<div class="tab">
		 
		 <button class="tablinks" onclick="openCity(event, 'Dashboard')" id="defaultOpen">Dashboard</button>
		
		<button class="tablinks" onclick="openCity(event, 'RegisteredClub')">Registered Club Details</button>
		<button class="tablinks" onclick="openCity(event, 'Profile')">My Profile Details</button>
		<button class="tablinks" onclick="openCity(event, 'CSR_Booklet')">CSR BookleT</button>
		<button class="tablinks" onclick="openCity(event, 'Attendance')">My Attendance</button>
		<button class="tablinks" onclick="openCity(event, 'Event')">Events</button>
		<button class="tablinks" onclick="openCity(event, 'Feedback')">Feedback</button>
			<a href="../loginSignup/updatePassword.jsp"><button class="tablinks">Change Password</button>
	
	</div>
		
		<div id="Dashboard" class="tabcontent">
			<div class="content">
				<h1>Dashboard</h1>
				<p>Student.. You can View Ur Profile</p>
				<div id="box">
					<div class="box-top">
						Student
					</div>
					<div class="box-panel">
						Student Information
					</div>
					<div class=Sessionmsg>
						<h1><%=session.getAttribute("Regd") %></h1>
					</div>
					
				</div>
				
				
			</div>
		</div>
	
		
		<div id="Profile" class="tabcontent">
			
			
			<div class="searchBox">
				<div class="SearchBar">
							<h3><%= studentId%> <b> : </b>Profiles</h3>
				</div>
				
				<div class="searchResult">
				<div class="image">
				<img src="../img/myprofile.png" width="200px" height="210px">
			</div>
						
					<table class="table" cellspacing="20px">
						
						<tr><% session.setAttribute("id",studentId);%>
							<td><b>User ID : </b><%= studentId%></td>
							<td><b>Name : </b><%= studentFname%><b> </b><%= studentMname%> <b> </b><%= studentLname%></td>
							<td><b>Blood Group : </b><%= studentBg%></td>
							<td><b>Gender : </b><%= studentGender%><b> </b></td>
						</tr>
						
						<tr>
							<td><b>Email : </b><%=studentEmail %></td>
							<td><b>Mobile No : </b><%= studentMobile%></td>
							<td><b> Alternate Mob : </b><%= studentAlternate%></td>
						</tr>
						<tr>
							
							<td><b> Course : </b><%= studentCourse%></td>
							<td><b> Department : </b><%= studentDept%></td>
							<td><b>Semester : </b><%= studentSemester%></td>
						</tr>
						
					</table>
					
				</div>
				
		</div>
	</div>
		<div id="RegisteredClub" class="tabcontent">
			<div class="headBarRegisteredClub">
				<h3>Registered Clubs for ID :<%= studentId%> </h3>
			</div>
			<div class="fetchClubs">
				 <%
					Connection c=MySQL.connect();
					if(c!=null){
						ResultSet rs2=StudentOperation.fetchRegisteredClub(c,id);
						
						if(rs2==null){
							error="Seems Id : "+id+" not Registered For Any Club";
						}
						else{
							out.println("<div class='studentclubregisterd'>");
							out.println("<table><tr><th>Registration No</th><th>Name</th><th>ClubType</th><th>Registered Club</th></tr>");
							
							while(rs2.next()){
							fetchClubtype=rs2.getString(1);
							fetchClubname=rs2.getString(2);
							out.println("<tr class='tr'><td>");
							out.println(id);
							out.println("</td><td>");
							out.println(studentFname+" "+studentMname+" "+studentLname);
							out.println("</td><td>");
							out.println(fetchClubtype);
							out.println("</td><td>");
							out.println(fetchClubname);
							out.println("</td></tr>");
							
							}
							out.println("</table></div>");
							/*
							FetchData fd=new FetchData();
							fetchClubtype=fd.getClubtype(); 
							System.out.println(fetchClubtype);*/
						}
					}else{
						error="No Connection";
					}
				
				
				%>	
			
			</div>
		</div>
		<div id="CSR_Booklet" class="tabcontent">
			<h3>Tokyo</h3>
				<p>Tokyo is the capital of Japan.</p>
		</div>
		<div id="Attendance" class="tabcontent">
			<h3>Tokyo</h3>
				<p>Tokyo is the capital of Japan.</p>
		</div>
		<div id="Event" class="tabcontent">
			<h3>Tokyo</h3>
				<p>Tokyo is the capital of Japan.</p>
		</div>
		<div id="Feedback" class="tabcontent">
			<h3>Tokyo</h3>
				<p>Tokyo is the capital of Japan.</p>
		</div>
		<div id="Change_Password" class="tabcontent">
	
			<div class="changepassword">
				
				<!-- ../loginSignup/updatePassword.jsp -->
				<form action="" method="post" name="myform" onsubmit="return validForm()">
					<table class="tablepass">
					<tr><td>Current Password</td><td><input type="password" name="current" ></td></tr>
					<tr><td>New Password</td><td><input type="password" name="newPass"></td></tr>
					<tr><td>Confirm Password</td><td><input type="password" name="confirm"></td></tr></br>
					<tr><td> </td><td><input type="submit" value="Change Password" ></td></tr>
					</table>
					</form>
			</div>
			
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
    