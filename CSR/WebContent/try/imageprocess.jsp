<%@page import="org.apache.commons.fileupload.FileUploadException"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
 <%@ page import="jsp.*" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert an Image into MySQL Database</title>
    </head>
    <body>
         <%
         Connection conn=null;
			PreparedStatement pstmt = null;
			ResultSet rs=null;
			
			FileInputStream fis=null;
			String fname=request.getParameter("id"); 
			
			String myloc=request.getParameter("myimg"); 
			out.print("First Name :"+fname+"myloc="+myloc);
			/*
			File file;
			int maxSize=5000*80000;
			int maxFactSize=5000*80000;
			String path="D:\\Img\\F";
			
			DiskFileItemFactory disFact=new DiskFileItemFactory();
			disFact.setSizeThreshold(maxFactSize);
			disFact.setRepository(new File("D:\\Img"));
			ServletFileUpload upload=new ServletFileUpload(disFact);
			upload.setSizeMax(maxSize) ;
			List list=upload.parseRequest(request);
			Iterator itr=list.iterator();
			while(itr.hasNext())
			{
				String str;
				FileItem item=(FileItem)itr.next();
				if(!item.isFormField()){
					str=item.getName();
					str="fname" + (str.substring(str.indexOf(".")));
					out.println(str);
					file=new File(path,str);
					if (!file.exists()) {
                        file.mkdirs();
                    }
					item.write(file);
					out.println("Uploaded");
				}

			}
			
			*/
			
			
			
			boolean isMultipart = ServletFileUpload.isMultipartContent(request);
			String id=request.getParameter("id"); 
			
			FileItemFactory factory = new DiskFileItemFactory();
		     ServletFileUpload upload1 = new ServletFileUpload(factory);
		     Iterator<FileItem> iterator = null;
			try {
				iterator = upload1.parseRequest(request).iterator();
			} catch (FileUploadException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		     File uploadedFile;
		     String dirPath="G:\\Img";
		     while (iterator.hasNext()) {

		                    FileItem item = iterator.next();
		                    if (!item.isFormField()) {

		                        String fileNameWithExt = item.getName();
		                        fileNameWithExt=id + (fileNameWithExt.substring(fileNameWithExt.indexOf(".")));
		                        File filePath = new File(dirPath);

		                        if (!filePath.exists()) {
		                            filePath.mkdirs();
		                        }

		                        uploadedFile = new File(dirPath + "/" + fileNameWithExt);
		                        try {
									item.write(uploadedFile);
								} catch (Exception e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								}                  
		                    }
		                    else {
		            String otherFieldName = item.getFieldName();
		            String otherFieldValue = item.getString();
		                    }
		               }
		/*try{
			 conn=MySQL.connect();
			File image= new File(myloc);
			String q="insert into tryimage values(?,?)";
			pstmt = conn.prepareStatement(q);
			pstmt.setString(1, fname);
			
			fis=new FileInputStream(image);
			pstmt.setBinaryStream(2, (InputStream) fis, (int) (image.length()));
			int count = pstmt.executeUpdate();
			if(count>0)
			{
			out.println("insert successfully");
			}
			else
			{
			out.println("not successfully");
			}
			}
			catch(Exception ex)
			{
			ex.printStackTrace();
			}
			finally{
			try{
			if(rs!=null){
			rs.close();
			rs= null;
			}
			if(pstmt !=null)
			{
			pstmt.close();
			pstmt=null;
			}
			
			}
			catch(Exception e)
			{
			e.printStackTrace();
			}
			}*/
%>
    </body>
</html>