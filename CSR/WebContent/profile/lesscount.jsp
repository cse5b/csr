<%@page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
     <%@ page import="jsp.*" %>
<% 
String regist = (String)request.getSession().getAttribute("regist");

		String studentId="", studentFname="",studentMname="",studentLname="",studentBg="",studentGender="",studentClubName="",studentCourse="";
		String studentEmail="",studentMobile="",studentDept="",studentAlternate="",studentSemester="",studentClubType="";
		Blob studentImage;
		String error="";
		
		if(regist==null){
			regist="";
		}else{
			String clubname = (String)request.getSession().getAttribute("inchargeclubname");

			error=Validate.validateRegd(regist);
			if(error.isEmpty()){
				Connection c2=MySQL.connect();
				if(c2!=null){
						
					boolean check=MySQL.checkStudent(c2,regist,clubname);// not neccessary
					if(check==true){
					
						ResultSet rs1=Incharge.fetchStudentData(c2,regist);
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
								session.setAttribute("studentFname", studentFname);
								
							}
							else{
								error="Registration No "+regist+" is not Registered" ;
							}

					}
					else{
						error="No Data Found for this Registration no : "+regist;
					}
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

	<link rel="stylesheet" href="login.css" type="text/css"/>
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
					<p><%=session.getAttribute("inchargefname")%><b> </b><%=session.getAttribute("inchargelname")%></p>
					</button>
					
					
			</div>
			<div id="clear">
			</div>
		</div>
	
	</div>
	
	<div id="Register" class="tabcontent">
	
	<div class="signupBox">
		
		<h2>Registration For Club..</h2>
		
		<div class="sectionFetch">
				<table width="100%" cellpadding="5px" cellspacing="8px">
					
					
					<tr>
						<td>
							<p>First Name<p>
							<input type="text" name="fname"  value="<%=studentFname%>" readonly="readonly"/>
						</td>
						<td></td>
						
						<td>
							<p>Middle Name<p>
							<input type="text" name="mname"  value="<%=studentMname%>" readonly="readonly"/>
						</td>
						
						
						<td>
							<p>Last Name<p>
							<input type="text" name="lname" value="<%=studentLname%>" readonly="readonly">
							
						</td>
						<td></td>
					</tr>
					<tr>
						<td>
							<p>Registration No<p>
							<input type="text" name="registration_no" value="<%=studentId%>" readonly="readonly"/>
						</td>
						<td></td>
						
						<td>
							<p>BlooD GrouP<p>
								<input type="text" name="bg" value="<%=studentBg%>" readonly="readonly"/>
						</td>
						<td>
							 <p>Gender<p>
							<input type="text" name="gender" value="<%=studentGender%>"readonly="readonly"/>
						</td>
					</tr>
									</table>
			
						
						
				<table width="100%" cellpadding="5px" cellspacing="8px">
					<tr>
						<td>
							<p>Email<p>
							<input type="text" name="email" value="<%=studentEmail%>" readonly="readonly">
							
						</td>
						<td></td>
						<td>
							<p>Mobile No<p>
							<input type="text" name="mobile" value="<%=studentMobile%>" readonly="readonly">
							
						</td>
						<td>
							<p>Alternate Mobile No<p>
							<input type="text" name="alternate_mobile"  value="<%=studentAlternate%>" readonly="readonly">
							
						</td>
						<td></td>
					</tr>
					
					
					
					</table >
			
					<table width="100%" cellpadding="5px" cellspacing="8px">
					
					<tr>
						<td>
							<p>Course<p>
							<input type="text" name="alternate_mobile"  value="<%=studentCourse%>" readonly="readonly">	
						</td>
						<td></td>
						
						<td>
							<p>Department<p>
								<input type="text" name="alternate_mobile"  value="<%=studentDept%>" readonly="readonly">
						</td>
				
						
						<td>
							<p>Semester<p>
							<input type="text" name="alternate_mobile"  value="<%=studentSemester%>" readonly="readonly">
						</td>
						<td></td>
						
					</tr>
					</table>
					
				</div>	
				<div class="sectionInput">
				<form action="../RegServlet" method="post" ">	
						
					<table width="100%" cellpadding="5px" cellspacing="8px">
					
					<tr>
						<td>
							<p>Registration No<p>
							<input type="text" name="studentId" value="<%=studentId%>"/>
						</td>
						<td>
							<p>Club Type</p>
								<select name="clubtype" >
								  <option value="<%=session.getAttribute("inchargeclubtype")%>"><%=session.getAttribute("inchargeclubtype")%></option>
								 
								 
								</select>
								
						</td>
						<td>
							<p>Club Name<p>
								<select name="clubname" >
								  <option value="<%=session.getAttribute("inchargeclubname")%>"><%=session.getAttribute("inchargeclubname")%></option>
								 
								 
								</select>
								
							
						</td>
						
						<td></td>
					</tr>
					
					
						
				</table></br>
			
				<div class="submit">
						<input type="submit" name="submit" onsubmit="submitFunction()"value="Submit">
				</div>		
		</form>
		<h5>The Above Section fetches Data from Existing Student Record if Respective Id is Already Registered to any Club.</h5>
		<h5>The Down section describes REspective Club_name and Club Type for In-charged</h5>
		</div>
		
	</div>
			
	<!-- End Of Registration -->		
</div>

		
</body>
</html>