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
    String p2="",p3="",msg="";
				String currentPassword=request.getParameter("current");
				String Newpass=request.getParameter("new");
				String conpass=request.getParameter("confirm");
				//System.out.println(currentPassword); 
					if(currentPassword==null){
						currentPassword="";
					}
					else{
						p2=Validate.validatePassword(Newpass);
						if(p2.isEmpty()){
							
						//	System.out.println(Newpass); 
							//System.out.println(conpass); 
							
							if(p2.equals(conpass)){
								Connection c=MySQL.connect();
								System.out.println("Newpass : "+Newpass);
								boolean b=StudentOperation.currentPassword(c,id,currentPassword);
								System.out.println("Current : "+b);
								if(b==true){
									boolean op=StudentOperation.updatePassword(c,id,Newpass);
									System.out.println("Update : "+op);
									if(op==true){
										p3="Password Changed Successfully";
									}
									else{
										msg="Password Not Changed ";
									}
								}else{
									msg="Wrong Current Password ..!";
								}
								
							}
							else{
								msg="Password Matching Error";
							}
						}
					}
	%>
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../profile/student_dasboard.css" type="text/css"/>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CSR-ChangePassword Page </title>
	<link rel="icon" href="../img/l.png">
<script>  
	function validForm(){  
		var current=document.myform.current.value;  
		var newPass=document.myform.newPass.value;  
		var confirm=document.myform.confirm.value;  
		  
		if (current==null || current==""){  
		  alert("Current Password can't be blank");  
		  return false;  
		}
		if (newPass==null || newPass=="" && confirm==null || confirm==""){  
			  alert(" Password can't be blank");  
			  return false;  
			}
		p=/(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%]).{6,20}/
		if(!newPass.matches(p)) {
			alert("Password Must Contains a Upper and Lower case letter and a Special character with Digit.");
			}
		if(newPass===confirm){
			alert("Entered Password Not Matched !");
			
		}
		
	}  

</script>

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
					<p><%=session.getAttribute("StudentFname") %><b> </b><%=session.getAttribute("StudentMname") %><b> </b><%=session.getAttribute("StudentLname") %></p>
					</div>
					
						<a href="logout.jsp" class="logout">Logout</a>
					
			</div>
			<div id="clear">
			</div>
		</div>
	
	</div>
	
	<div id="Change_Password" class="tabcontent">
			
			<div class="changepassword">
				<h2>Change Your Password</h2>
				<p><%=msg %></p>
				<h3><%=p2 %></h3>
				<form action="" method="post">
					<table class="tablepass">
					<tr><td>Current Password</td><td><input type="password" name="current" ></td></tr>
					<tr><td>New Password</td><td><input type="password" name="new"></td></tr>
					<tr><td>Confirm Password</td><td><input type="password" name="confirm"></td></tr></br>
					<tr><td> </td><td><input type="submit" value="Change Password"></td></tr>
					</table>
					</form>
			</div>
			
		</div>
	
</body>
</html>