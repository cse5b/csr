<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*" %>
     <%@ page import="jsp.*" %>
    <%			
    
    
    String clubname = (String)request.getSession().getAttribute("inchargeclubname");
    String str=null,regdno="",name="";
				String p="";
    			String date=request.getParameter("date");
    			String classhour=request.getParameter("classhour");
				Connection c2=MySQL.connect();
				if(c2!=null){
					ResultSet rs200=RegisterJavaCode.fetchFromClubRegister(c2,clubname);
						
							if(rs200==null){
								p="No records found";
								}
							else{
								str="<form><table border='1px solid grey' cellpadding='15px'><tr><th>Date</th><th>Regd No</th> <th>Name</th><th>CLass Timing</th><th>Status</th></tr>";
								
								while(rs200.next()){
								
							
									str+="<tr><td>"+date+"</td><td>"+rs200.getString(1)+"</td><td>"+clubname+"</td><td>"+classhour+"</td><td><input type='checkbox' name= 'attendance' value='1'> </td></tr>";
									
								/*	String checkbox=request.getParameter("attendance");
									if(checkbox==null){
										checkbox="";
									}
									else{
										
										int ckck=Integer.parseInt(checkbox);
										if(ckck !=1){
											ckck=0;
											int insert=RegisterJavaCode.updateAttendance(c2,rs200.getString(1),clubname,ckck);
											if(insert!=1){
												p="Updates Unsuccesfull";
											}
											else{
												p="SuccceessFulllyy Updated into Attendance";
											}
										}
										else{
											int insert=RegisterJavaCode.updateAttendance(c2,rs200.getString(1),clubname,ckck);
											if(insert!=1){
												p="Updates Unsuccesfull";
											}
											else{
												p="SuccceessFulllyy Updated into Attendance";
											}
										}
										
										
										}*/
								}
								str+="</table><div class='Btn'><input type='submit' value='Save'></div></form>";
								
								
							}
							
							c2.close();	
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
	
</head>
<style>
	body{
		background:lightgrey;
	}
	table{
		width:100%;
		text-align:center;
	}
	table th{
		background:#819bc4;
		color:;
	}
	input[type="submit"]{
		background:#119b84;
		width:80px;
		padding:8px;
		color:white;
		border:none;
		cursor:pointer;
		border-radius:7px;
		
	}
	input[type="submit"]:hover{
		background:#0a8772;
		font-weight:bold;
	}
	.Btn{
		text-align:right;
		padding:10px;
	}
</style>
<body>
 
	<div class="container">
		<div class="header" >
			<div id="topleft">
				
					 <h2>Culture Sports Responsibility</h2> 
			 </div>
	
		
			
							
			<div id="topright">
					<div class="displayname">
					<img src="../img/myprofile.png" class="user-image" alt="User Image">
					<p><%=session.getAttribute("inchargefname")%><b> </b><%=session.getAttribute("inchargelname")%></p>
					</div>
					
						<a href="../loginSignup/logout.jsp" class="logout">Logout</a>
					
			</div>
			<div id="clear">
			</div>
		</div>
	
	</div>
	
	<!-- 
	<div class="dataAccess">
		<form action="">
			<table cellpadding='15px'>
				<tr>
					<th>DATE</th>
					<th>REGISTRATION NO</th>
					<th>NAME</th>
					<th>CLASS TIMING</th>
					<th>ATTENDANCE</th>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</table>
		
		</form>
	
	
	</div>
	 -->
	<div class="attendanceData">
		<div class="Attendance-Bar">
			<h2>Attendance Sheet For : <%=clubname %></h2>
		</div>
		<p><%=p %></p>
		<div class="output">
			<%=str %>
		</div>
	</div>
	
	
	
	
	
	
</body>
</html>