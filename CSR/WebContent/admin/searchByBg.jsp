<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*" %>
     <%@ page import="jsp.*" %>
     <%@ page import="admin.*" %>
     <%
 	Connection c=null;
 	String bg_varify="",message="";
 	ResultSet rs2=null;
 %>
 	 <%
   
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
					
					</div>
						<a href="../loginSignup/logout.jsp" class="logout">Logout</a>
			</div>
			<div id="clear">
			</div>
		</div>
	</div>
	<div class="SearchBy">
			<h3> Search By Blood Group </h3>
			<form action="" method ="post">
				Blood Group :<select name="bg" >
							  <option>Select Blood GrouP </option>
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
			<p><%=message %></p>
		</div>
		<%	
		 String bg=null;
    	bg=request.getParameter("bg");
	
	    
    	if(bg==null){
    		bg="";
    	}
    	else{
    		c=MySQL.connect();
    	
    			bg_varify=Validate.validateFname(bg);
    		//	name_varify=Validate.validateFname(name);
    			if(bg_varify.isEmpty()){
 
    						 rs2=Adminoperation.searchByBg(c,bg);
    						 
    							  if(rs2==null){
    								message="No "+bg+" Blood Group Record Found !! ";
    							}
    							 
    								else{
    										int count=1;
    		    							out.println("<div class='studentclubregisterd'>");
    		    							out.println("<table><tr><th>Sl No</th><th>Registration No</th><th>Name</th><th>Blood Group</th><th>Gender</th><th>E-Mail</th><th>Mobile NO</th></tr>");
    		    						while(rs2.next()){
    		    							
	    									out.println("<tr class='tr'><td>");
	    									out.println(count);
	    									out.println("</td><td>");
	    									out.println(rs2.getString(1));
	    									out.println("</td><td>");
	    									out.println(rs2.getString(2)+" "+rs2.getString(3)+" "+rs2.getString(4));
	    									out.println("</td><td>");
	    									out.println(rs2.getString(5));
	    									out.println("</td><td>");
	    									out.println(rs2.getString(6));
	    									out.println("</td><td>");
	    									out.println(rs2.getString(7));
	    									out.println("</td><td>");
	    									out.println(rs2.getString(8));
	    									out.println("</td><td>");
	    									out.println("</td></tr>");
	    									count=count+1;
	    									
    		    							}
    		    									out.println("</table></div>");
    		    								rs2.close();
    		    								
    								}
    				
    			}
    				}
    			
    
    %>
    		  

	
</body>
</html>