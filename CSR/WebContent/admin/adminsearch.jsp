<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*" %>
     <%@ page import="jsp.*" %>
     <%@ page import="admin.*" %>
    <%
  
    String id = (String)request.getSession().getAttribute("Regd");
    String regd_varify="",name_varify="";
 	String fregd="",fname="",lname="",email="",dept="",clubname="",clubtype="",mobile="";
 	String message="";
 	ResultSet rs1=null,rs2=null;
 	
	
    %>
    
    <%
    String regd=null,name=null;
    	regd=request.getParameter("uid");
	    name=request.getParameter("name");
	    String bg=request.getParameter("bg");
	    String club=request.getParameter("club");
	    
    	if(regd==null &&  name==null && bg==null && club==null){
    		regd="";
    		name="";
    		bg="";
    		club=""; 
    	}
    	else{
    		Connection c=MySQL.connect();
    	
    			regd_varify=Validate.validateRegd(regd);
    		//	name_varify=Validate.validateFname(name);
    			if(regd_varify.isEmpty()){
    				if(regd.length()!=5){
						if(c!=null){
							 rs1=Incharge.fetchInchargeData(c,regd);
							if(rs1!=null){
								
							}
							
							else{
								String error="No Data Found";
							}
    					
    				}
    			}
    				else{
    					//student
    					boolean check=MySQL.checkStudentt(c,regd);
    					
    					if(check==true){
    					
    						 rs2=Incharge.searchStudentData(c,regd,regd);
    							if(rs2!=null){
    								
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
    	}
    %>
    
    
    
    
<!DOCTYPE html>
<html>
<head>
	<title>CSR-Admin Search </title>
	<link rel="icon" href="../img/l.png">
	<meta http-equiv="Content-Type" content="text/html" charset="utf-8"/>
	
	<link rel="stylesheet" href="../profile/student_dasboard.css" type="text/css"/>
	<link rel="stylesheet" href="csrincharge.css" type="text/css"/>

	<link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
	<!-- Side Bar Css-->
	<link rel="stylesheet" href="../profile/sidebar.css" type="text/css"/>
	
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
					  <span class="logo-lg"><b>Adminstration </b>Search</span>
			 </div>
			 <div id="topright">
					<div class="displayname">
					<img src="../img/myprofile.png" class="user-image" alt="User Image">
					<p><b> </b></p>
					</div>
					
						<a href="../loginSignup/logout.jsp" class="logout">Logout</a>
					
			</div>
			<div id="clear">
			</div>
		</div>
	
	</div>
	<div class=SearchSection>
		<div class="SearchBy">
			<h3> Search By Registration no </h3>
			<form action="adminregsearch.jsp" method ="post">
				Registration No :<input type="text" name="uid" placeholder="Enter ID">
				<input type="submit" name="submit" Value="Search ">
			</form>
			<p><%=regd_varify %></p>
			
		</div>
		<div class="SearchBy">
			<h3> Search By Name </h3>
			<form action="" method ="post">
				Name :<input type="text" name="name" placeholder="Enter Name">
				<input type="submit" name="submit" Value="Search ">
			</form>
			<p><%=name_varify %></p>
			
		</div>
		<div class="SearchBy">
			<h3> Search By Blood Group </h3>
			<form action="" method ="post">
				Blood Group :<select name="bg" >
							  <option value="A+">A+ </option>
							  <option value="A-">A- </option>
							  <option value="B+"> B+</option>
							  <option value="B-">B- </option>
							  <option value="O+"> O+</option>
							  <option value="O-">O- </option>
							  <option value="AB+"> AB+</option>
							  <option value="AB-"> AB-</option>
							 </select>
				<input type="submit" name="submit" Value="Search ">
			</form>
		</div>
		<div class="SearchBy">
			<h3> Search By Club </h3>
			<form action="" method ="post">
				Club  :<input type="text" name="name" placeholder="Enter Name">
				<input type="submit" name="submit" Value="Search ">
			</form>
		</div>
		
		
		
	</div>
	
	<div class="result">
		
	</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>