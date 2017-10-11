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
 * Servlet implementation class RegServlet
 */
@WebServlet("/RegServlet")
public class RegServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegServlet() {
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
		String m="";
		String studentFname = (String)request.getSession().getAttribute("studentFname");
		String data=request.getParameter("studentId");
		String clubtype=request.getParameter("clubtype");
		String clubname=request.getParameter("clubname");
		Connection c=MySQL.connect();
		if(c!=null) {
			try {
				
				int check=RegisterJavaCode.checkclubregisterTable(c,data,clubtype,clubname);
				if(check!=1) { // check returns user exist or not with same attributes
					// Updating Data Into Value
						//String update=RegisterJavaCode.updateIntoStudentRegister(c,data,clubname);
					
					// Inserting Data
					int insert=RegisterJavaCode.insertclubregisterTable(c,data,clubtype,clubname);
					
					
						if(insert > 0 ) {
							response.getWriter().append("Registered Succesfully Done...");
							int check2=RegisterJavaCode.insertAttendanceregisterTable(c,data,studentFname,clubname);
							
							if(check2==1){
								response.getWriter().append("Registered Succesfully Done in Attendance...");
							}
							else{
								response.getWriter().append("Registered Not Done in Attendance...");
							}
						}
						else {
							response.getWriter().append("Registered Not Done...");
						}
						
				}
				else {
					response.getWriter().append("Already Registerd In the club...");
					
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else {
			//If Null
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