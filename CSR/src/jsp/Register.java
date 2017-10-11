package jsp;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
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
		FileInputStream fis = null;
		String msg="";
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
			
			 File image = new File("C:\\Users\\SONUSILU\\Desktop\\PROJECT\\CSR\\img\\c.jpg");
			 fis = new FileInputStream(image);
             
			//String image =request.getParameter("image");
			
			String regd_error="",email_error="",mobile_error="",altermobile_error="",fname_error="",lname_error="";
			// validation starts now	
			regd_error=Validate.validateRegd(regd);
			fname_error=Validate.validateFname(fname);
			
			lname_error=Validate.validateLname(lname);
			
			email_error=Validate.validateEmail(email);
			mobile_error=Validate.validateMobile(mobile);
			altermobile_error=Validate.validateAlterMobile(altmobile,mobile);
			
			if(regd_error.isEmpty() && email_error.isEmpty() && fname_error.isEmpty() && lname_error.isEmpty() && mobile_error.isEmpty() && altermobile_error.isEmpty())// After Validation Inputs are RIght way i.e is No Error ... Error is Empty
    		{
    		
    		Connection c= MySQL.connect();
    		if(c !=null){
    			
    			boolean test=MySQL.testRegistered(c,regd);// returns User Exist or not CSR_Register table
    			if(test==true){
	    				//String register=RegisterJavaCode.registerStudentTable(c,regd,fname,mname,lname,bg,gender,email,mobile,altmobile,course,dept,sem,clubtype,clubname);
	    				int insert=RegisterJavaCode.insertclubregisterTable(c,regd,clubtype,clubname);
	    					//request.setAttribute("regdno_error", register);
					
    				}
	    			
    			else{
            			
            			int count=RegisterJavaCode.checkCount(c,regd);
            			if(count < 4) {
            				int insert=RegisterJavaCode.insertclubregisterTable(c,regd,clubtype,clubname);
            				if(insert==1) {
            					msg="Register Successfull Done";
            				}
            				else {
            					msg="Register Not Done..";
            				}
            			}
            			else {
            				msg="Maximum Limit Crossed...!! Registration No : "+regd+" is Already Registered In 3 clubs.. Contact To CSR INcharge for Registartion ";
            			}
            			
            			
            		}
    			
		       
        			
        		try {
					c.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
        		try {
					c.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
        	}
    		else {
    			msg="No Connection";
    		}
    			
    			
    		}
			else {
				request.setAttribute("regdno_error", regd_error);
				request.setAttribute("messager", msg);
				request.setAttribute("regdno_error", regd_error);
				request.setAttribute("fname_error", fname_error);
				request.setAttribute("lname_error", lname_error);
				request.setAttribute("email_error", email_error);
				request.setAttribute("mobile_error", mobile_error);
				request.setAttribute("altermobile_error", altermobile_error);
				 request.getRequestDispatcher("profile/regerror.jsp").forward(request, response);
				
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
