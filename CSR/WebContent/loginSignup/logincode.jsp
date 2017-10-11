<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="jsp.*" %>
     <%@ page import="java.sql.*" %>
    <%@ page import="javax.sql.*" %>
    <%@ page import="java.sql.DriverManager" %>
    <%@ page import="java.sql.PreparedStatement" %>
    <%@ page import="java.sql.SQLException" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	    <%
		String error="";
		    
			String id=request.getParameter("uid");
			String pass=request.getParameter("password");
			Connection c=MySQL.connect();
			if(c!=null){
		
			    	try{
						
			    		
			    		//Class.forName("com.mysql.jdbc.Driver");//load driver
			    			//Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3307/csr","root","Sonusilu@123");
			    			
			    		// Put if else condition fromm fetching more tbles
			    		String query = "select * from csrregister where registration_no=? and password=?";
			    		PreparedStatement statement = c.prepareStatement(query);
			    		statement.setString(1, id);
			    		statement.setString(2, pass);
			    		
			    		ResultSet set = statement.executeQuery();
			    		if(set.next()) {
			    			
			    			response.sendRedirect("student_dashboard.jsp");
			    			session.setAttribute("Regd",id);
			    			
			    		}
			    		else {
			    			response.sendRedirect("incorrect.jsp");
			    		}
					set.close();
			    	statement.close();
			    	
			
			    		}catch ( SQLException e) {
			    			throw new Error(e);
			    			
			    		}}
				else{
				out.println("vghvh");
				}
    %>
    
</body>
</html>