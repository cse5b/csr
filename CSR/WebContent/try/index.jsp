<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<body> 
<form name="form1" method="post" action="imageprocess.jsp" enctype="multipart/form-data"> 
<h1>Insert an Image into MySQL Database!</h1>
<input type="text" name="id"><br><br>

<input type="file" name="myimg"><br><br>
<input type="submit" name="submit" value="Submit">
</form>

</body> 
</html>