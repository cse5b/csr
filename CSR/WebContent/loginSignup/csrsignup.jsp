<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="javax.sql.*" %>
    <%@ page import="java.sql.DriverManager" %>
    <%@ page import="java.sql.PreparedStatement" %>
    <%@ page import="java.sql.SQLException" %>
    <%@ page import="java.sql.Statement" %>
    <%@ page import="java.util.regex.Matcher"%>
	<%@ page import="java.util.regex.Pattern"%>
	<%@ page import="jsp.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

		String regd =request.getParameter("regdno");  
		String email =request.getParameter("email");
		String pass =request.getParameter("password");
		
			
		try{
			
			Class.forName("com.mysql.jdbc.Driver").newInstance();//load driver
 			Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3307/csr","root","Sonusilu@123");
 			
								
									String msg="Successfull";
									String ins = "insert into csrregister values(?,?,?)";
									PreparedStatement ps = con.prepareStatement(ins);
	
										ps.setString(1, regd);
										ps.setString(2, email);
										ps.setString(3, pass);
										ps.execute();
									
									    response.sendRedirect("success.jsp");
					

			}catch (SQLException e) {
			
			e.printStackTrace();
			
			
			}
		
%>  
</body>
</html>