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
 * Servlet implementation class Reg
 */
@WebServlet("/Reg")
public class Reg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Reg() {
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
		
	
String regist =request.getParameter("regist");
		
		String msg="";
		Connection c3=MySQL.connect();
		if(c3!=null){

			int count=RegisterJavaCode.checkCount(c3,regist);
			if(count==0){
				
				response.sendRedirect("profile/reg.jsp");
			}
			else if(count < 3) {
				response.sendRedirect("profile/lesscount.jsp");
				//System.out.println(count);
			}
			else{
				
				msg="Maximum Limit Crossed...!! Registration No : "+regist+" is Already Registered In 3 clubs.. Contact To CSR INcharge for Registartion ";
				request.setAttribute("message", msg);
				 request.getRequestDispatcher("profile/incharge_dashboard.jsp").forward(request, response);
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
