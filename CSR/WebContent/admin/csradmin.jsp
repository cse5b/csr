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
  %>	
    <%
    String regd_varify="",name_varify="";
 	String message="";
 	ResultSet rs1=null,rs2=null;
    %>
    
   
		
<!DOCTYPE html>
<html>
<head>
	<title>CSR-In-charge Profile </title>
	<link rel="icon" href="../img/l.png">
	<meta http-equiv="Content-Type" content="text/html" charset="utf-8"/>
	
	<link rel="stylesheet" href="csrincharge.css" type="text/css"/>
	
	<link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
	<!-- Side Bar Css-->
	<link rel="stylesheet" href="../profile/sidebar.css" type="text/css"/>
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
		 
		<button type="button" class="tablinks" data-toggle="collapse" data-target="#demo"> Registration</button>
		  <div id="demo" class="collapse">
		    <button class="tablinks" onclick="openCity(event, 'addclub')">Add Club</button>
		    <button class="tablinks" onclick="openCity(event, 'addincharge')">Add In-Charge</button>
		</div>
		<button type="button" class="tablinks" data-toggle="collapse" data-target="#demo1"> Updation</button>
		  <div id="demo1" class="collapse">
		    <button class="tablinks" onclick="openCity(event, 'updateclub')">Update Club</button>
		    <button class="tablinks" onclick="openCity(event, 'updateincharge')">Update In-Charge</button>
		</div>
			
		<button type="button" class="tablinks" data-toggle="collapse" data-target="#demo3"> Search</button>
		  <div id="demo3" class="collapse">
		    <a href="adminregsearch.jsp"><button class="tablinks">Search By ID</button></a>
		   <a href="searchByBg.jsp"> <button class="tablinks" >Search By Blood Group</button></a>
		</div>
		
		 
		<button class="tablinks" onclick="openCity(event, 'Event')">Events</button>
		<button class="tablinks" onclick="openCity(event, 'Notices')">Update Notice</button>
		<button class="tablinks" onclick="openCity(event, 'Equipments')">Equipments Details</button>
		<button class="tablinks" onclick="openCity(event, 'Change_Password')">Change Password</button>
		
		
	
	</div>
		
		<div id="Dashboard" class="tabcontent">
			<div class="content">
				<h2>Dashboard</h2>
			</div>
		</div>
		
		<div id="Profile" class="tabcontent">
					
			<div class="profilebar">
				<h3>Profile</h3>
			</div>
		</div>
		
		<div id="addclub" class="tabcontent">
			<div class="signupBox">
				<h2>Registration For Club..</h2>
			</div>
		</div>
	
	<div id="addincharge" class="tabcontent">
			<h3>Registered Student</h3>
				<p>Registered Student Page</p>
		</div>
		
		<div id=updateclub class="tabcontent">
			<div class="updateclub">
				<h2>update club</h2>
				
				
			</div>	
		</div>
		<div id="updateincharge" class="tabcontent">
			<h3>Update in-charge Activity</h3>
				
		</div>
		<div id="searchById" class="tabcontent">
			<div class="profilebar">
				<h3>Search Student Records By ID</h3>
			</div>
			
			
		</div>
		<div id="searchByBg" class="tabcontent">
			<div class="profilebar">
				<h3>Search Student Records By Blood Groups</h3>
			</div>
			
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
    