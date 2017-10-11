package jsp;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FinalInsert
 */
@WebServlet("/FinalInsert")
public class FinalInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FinalInsert() {
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
String roww="";
		
		String msg2="",bg2="",gender2="",fname2="",mname2="",lname2="";
		int row;
			
		    String regd2 =request.getParameter("registration_no");
			bg2 =request.getParameter("bg");
			gender2 =request.getParameter("gender");
			fname2 =request.getParameter("fname");
			mname2 =request.getParameter("mname");
			lname2 =request.getParameter("lname");
			
			String email2 =request.getParameter("email");
			String mobile2 =request.getParameter("mobile");
			String altmobile =request.getParameter("alternate_mobile");
			
			String course =request.getParameter("course");
			String dept2 =request.getParameter("department");
			String sem =request.getParameter("semester");
			String clubtype2 =request.getParameter("clubtype");
			String clubname2 =request.getParameter("clubname");
			
		
			// File image = new File("C:\\Users\\SONUSILU\\Desktop\\PROJECT\\CSR\\img\\c.jpg");
			// fis = new FileInputStream(image);
             
			//String image =request.getParameter("image");
			
			String regd_er="",email_er="",mobile_er="",altermobile_er="",fname_er="",lname_er="";
			if(regd2==null || fname2==null){
				//response.sendRedirect("");
				
				fname2="";
				mname2="";
				lname2="";
				
			}
			else{
				 String clubname = (String)request.getSession().getAttribute("inchargeclubname");
				 String clubtype = (String)request.getSession().getAttribute("inchargeclubtype");
					
			    regd_er=Validate.validateRegd(regd2);
				fname_er=Validate.validateFname(fname2);
				lname_er=Validate.validateLname(lname2);
				email_er=Validate.validateEmail(email2);
				mobile_er=Validate.validateMobile(mobile2);
				altermobile_er=Validate.validateAlterMobile(altmobile,mobile2);
			// validation ends here
			
			
	       // request.getRequestDispatcher("profile/incharge_dashboard.jsp").forward(request, response);
			
			if(regd_er.isEmpty() && email_er.isEmpty() && fname_er.isEmpty() && lname_er.isEmpty() && mobile_er.isEmpty() && altermobile_er.isEmpty())// After Validation Inputs are RIght way i.e is No Error ... Error is Empty
    		{
    	
    		Connection c= MySQL.connect();
    		if(c !=null){
    			//roww=RegisterJavaCode.registerStudentTable(c,regd2,fname2,mname2,lname2,bg2,gender2,email2,mobile2,altmobile,course,dept2,sem,clubtype2,clubname);
    		
    			}
    		else{
    			roww="Null";
    		}
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
