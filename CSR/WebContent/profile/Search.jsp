<%@page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
     <%@ page import="jsp.*" %>
     <% String id = (String)request.getSession().getAttribute("Regd");
    	 
    
		
	
		String search=request.getParameter("search");
		String studentId="", studentFname="",studentMname="",studentLname="",studentBg="",studentGender="",studentClubName="",studentCourse="";
		String studentEmail="",studentMobile="",studentDept="",studentAlternate="",studentSemester="",studentClubType="";
		Blob studentImage;
		String error="";
		
		if(search==null){
			search="";
		}else{
			String clubname = (String)request.getSession().getAttribute("inchargeclubname");
	    	 String clubtype = (String)request.getSession().getAttribute("inchargeclubtype");
	    	 
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
						error="No Data Found for this Registration no : "+search+" for - "+clubname;
					}
					session.removeAttribute(clubname);
					session.removeAttribute(clubtype);
								
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
		
	
<!DOCTYPE html>
<html>
<head>
	<title>CSR-Student Profile </title>
	<link rel="icon" href="../img/l.png">
	<meta http-equiv="Content-Type" content="text/html" charset="utf-8"/>
	
	<link rel="stylesheet" href="incharge_dasboard.css" type="text/css"/>

	<link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
	<!-- Side Bar Css-->
	<link rel="stylesheet" href="sidebar.css" type="text/css"/>
	<!-- 
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
	
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<div class="head">
		
	</div>
</head>

<body>
 
	<div class="container">
		<div class="header" >
			<div id="topleft">
				
					<h2>Culture Sports Responsibility</h2>
			 </div>
	
		
			
							
			<div id="topright">
					<button class="displayname">
					<img src="../img/myprofile.png" class="user-image" alt="User Image">
					<p><%= session.getAttribute("inchargefname") %><b> </b><%=session.getAttribute("inchargelname") %></p>
					
					
					</button>
					
					
			</div>
			<div id="clear">
			</div>
		</div>
	
	</div>
	

		<div id="Search" class="tabcontentt">
			<div class="SearchBar">
				<h3>Search Student Records</h3>
			</div>
			<div class="searchBox">
				<form action="" method="post">
					<input type="text" name="search" placeholder="Search Stuff" value="<%=search%>">
					<input type="submit" name="submit" value="Search">
					<p><%=error %></p>
				</form>
				<div class="searchResult">
						<div class="SearchBar">
						<h3><%= studentId%> <b> : </b>Profiles</h3>
					</div>
					<table class="table" cellspacing="20px">
						<!-- <tr>
						<th>Registration No</th>
						<th>First Name</th>
						<th>Middle Name</th>
						<th>Last Name</th>
						<th>Blood Group</th>
						<th>Gender</th>
						<th>Email</th>
						<th>Mobile no</th>
						<th>Alternate Mobile No</th>
						<th>Course</th>
						<th>Department</th>
						<th>Semester</th>
						<th>Club Type</th>
						
						<th> Club Name</th>
						
						</tr> -->
					
						<tr><% session.setAttribute("id",studentId);%>
							<td><b>User ID : </b><%= studentId%></td>
							<td><b>Name : </b><%= studentFname%><b> </b><%= studentMname%> <b> </b><%= studentLname%></td>
							<td><b>Blood Group : </b><%= studentBg%></td>
							
						</tr>
						<tr>
							
							<td><b>Gender : </b><%= studentGender%><b> </b></td>
							<td><b>Email : </b><%=studentEmail %></td>
							<td><b>Mobile No : </b><%= studentMobile%></td>
							<td><b> Alternate Mob : </b><%= studentAlternate%></td>
						</tr>
						<tr>
							<td><b> Course : </b><%= studentCourse%></td>
							<td><b> Department : </b><%= studentDept%></td>
							<td><b>Semester : </b><%= studentSemester%></td>
							<td><b>Club Type : </b><%= session.getAttribute("inchargeclubtype")%></td>
							<td><b> Club Name : </b><%= session.getAttribute("inchargeclubname")%></td>
							
							
						</tr>
						
					</table>
					
				</div>
				<!--  <div class="operation">
					<form action="getFullDetails.jsp">
							<table class="table2" >
								<tr>
								<td><input type="submit" name="getDetails"value="Get Details"></td>
								<td><input type="submit" name="update"value="Update"></td>
								<td><input type="submit" name="delete"value="Delete"></td>
								
								</tr>
							</table>	
						</form>
					</div>-->
					</br>
				<div class="searchResult">
						<div class="SearchBar">
							<h3><%= studentId%> <b> : </b>Attendance : for <%=session.getAttribute("inchargeclubname") %></h3>
						</div>
					<div class="attendance">
					<p>Attendance</p>
					
					</div>
				</div>
			</div>
			
		</div>
	
	
	<!-- End Student iNformation -->
	
</body>
</html>
    