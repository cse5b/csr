package jsp;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class TryImage
 */
@WebServlet("/TryImage")
public class TryImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TryImage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		 response.setContentType("text/html");
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
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
