<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ page import="java.sql.*" %>
     <%@ page import="jsp.*" %>
     <%@ page import="admin.*" %>
  <%
  
    String id = (String)request.getSession().getAttribute("Regd");
    String regd_varify="";
 	String fregd="",fname="",lname="",email="",dept="",clubname="",clubtype="",mobile="";
 	String message="";
 	ResultSet rs1=null,rs2=null;
 	String studentId="", studentFname="",studentMname="",studentLname="",studentBg="",studentGender="",studentClubName="",studentCourse="";
	String studentEmail="",studentMobile="",studentDept="",studentAlternate="",studentSemester="",studentClubType="",error="",fetchClubtype="",fetchClubname="";
	Blob studentImage;
	Connection c=null;
	
    %>
    
    <%
    String regd=null;
    	regd=request.getParameter("uid");
	
	    
    	if(regd==null){
    		regd="";
    	}
    	else{
    		c=MySQL.connect();
    	
    			regd_varify=Validate.validateRegd(regd);
    		//	name_varify=Validate.validateFname(name);
    			if(regd_varify.isEmpty()){
   
    					//student Profile
    					boolean check=MySQL.checkStudentt(c,regd);
    					
    					if(check==true){
    					
    						 rs1=Incharge.searchStudentData(c,regd,regd);
    						 
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
    								message="No Data Found Registration No "+regd;
    							}

    					}
    					
    					else{
    						message="Not Exist Registration no : "+regd;
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
	
	<link rel="stylesheet" href="csrincharge.css" type="text/css"/>
	
	<link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
	<!-- Side Bar Css-->
	<link rel="stylesheet" href="../profile/sidebar.css" type="text/css"/>
	 <meta name="viewport" content="width=device-width, initial-scale=1.0">
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

    <div class="SearchBy">
    	<div class="SearchBar">
			<h3> Search By Registration no </h3>
		</div>
			<form action="" method ="post">
				Registration No :<input type="text" name="uid" placeholder="Enter ID">
				<input type="submit" name="submit" Value="Search ">
			</form>
			<p><%=regd_varify %></p>
			<p><%=message %></p>
			
		</div>
		<div class="searchResult">
						<div class="SearchBar">
							<h3><%= studentId%> <b> : </b>Profiles</h3>
						</div>
					<table class="table" cellspacing="20px">
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
							
						</tr>
						
					</table>
					
				</div>
			<div class="searchResult">
						<div class="SearchBar">
							<h3><%= studentId%> <b> : </b>Registered Clubs And Attendance : for <%= studentId%></h3>
						</div>
					<div class="attendance">
					
					<% 
						
						if(c!=null){
							rs2=Adminoperation.fetchStudentClubDetails(c,regd);
							if(rs2==null){
								//msg
							}
							else{
	    							out.println("<div class='studentclubregisterd'>");
	    							out.println("<table><tr><th>Registration No</th><th>Name</th><th>ClubType</th><th>Registered Club</th><th>Attendance</th></tr>");
	    						while(rs2.next()){
	    									
	    									out.println("<tr class='tr'><td>");
	    									out.println(rs2.getString(2));
	    									out.println("</td><td>");
	    									out.println(studentFname+" "+studentMname+" "+studentLname);
	    									out.println("</td><td>");
	    									out.println(rs2.getString(3));
	    									out.println("</td><td>");
	    									out.println(rs2.getString(4));
	    									out.println("</td></tr>");
	    									
	    							}
	    									out.println("</table></div>");
	    									
	    								
	    							}
						}
						%>
					</div>
				</div>
	</body>	
	</html>	