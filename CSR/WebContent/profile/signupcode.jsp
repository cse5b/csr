<%@page import="java.io.FileInputStream"%>
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
	<%@ page import="java.io.File"%>
	<%@ page import="java.io.InputStream"%>
	<%@ page import="java.io.FileInputStream"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<%  

		String regd =request.getParameter("registration_no");  
		String bg =request.getParameter("bg");
		String gender =request.getParameter("gender");
		String fname =request.getParameter("fname");
		String mname =request.getParameter("mname");
		String lname =request.getParameter("lname");
		
		String email =request.getParameter("email");
		String mobile =request.getParameter("mobile");
		String altmobile =request.getParameter("alternate_mobile");
		
		String course =request.getParameter("course");
		String dept =request.getParameter("department");
		String sem =request.getParameter("semester");
		String clubtype =request.getParameter("clubtype");
		String clubname =request.getParameter("clubname");
		//String desc =request.getParameter("description");
		String image =request.getParameter("image");
%>
<%
		
		try{

 			Class.forName("com.mysql.jdbc.Driver").newInstance();//load driver
 			Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3307/csr","root","Sonusilu@123");
 			
			//Connection con = MySQL.connect(); // conmection from MySQl class
			
								
									
									String ins = "insert into studentregister values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,0)";
									PreparedStatement ps = con.prepareStatement(ins);
	
										ps.setString(1, regd);
										ps.setString(2, fname);
										ps.setString(3, mname);
										ps.setString(4, lname);
										ps.setString(5, bg);
										ps.setString(6, gender);
										
										ps.setString(7, email);
										ps.setString(8, mobile);
										ps.setString(9, altmobile);
										
										ps.setString(10, course);
										ps.setString(11, dept);
										ps.setString(12, sem);
										ps.setString(13, clubtype);
										ps.setString(14, clubname);
										//ps.setString(15,desc);
										//InputStream inputStream = new FileInputStream(new File(image));
										 
							          //  ps.setBlob(16, inputStream);
										
										

										int row =ps.executeUpdate();
										if(row > 0){
											response.sendRedirect("incharge_dashboard.jsp");
										}
										else {
											out.println("Not Inserted");
										}
										
									    
					

}catch (SQLException e) {
// TODO: handle exception
e.printStackTrace();


}
%>  





</body>
</html>