/**
 * 
 */
package admin;
import java.sql.*;

/**
 * @author SONUSILU
 *
 */
public class Adminoperation {
	public static ResultSet fetchStudentClubDetails(Connection c,String regist) {
		
		ResultSet rs1 =null;
		
		try {
			
			String q1="select * from clubregister where registration_no=?";
			PreparedStatement ps=c.prepareStatement(q1);
			ps.setString(1, regist);
			
			rs1=ps.executeQuery();
			
			
			
		}catch(Exception e) {
			throw new Error(e);
		}
		
		return rs1;
	}
	public static ResultSet searchByBg(Connection c,String bg) {
		
		ResultSet rs1 =null;
		
		try {
			
			String q1="select * from studentregister where bg=?";
			PreparedStatement ps=c.prepareStatement(q1);
			ps.setString(1, bg);
			
			rs1=ps.executeQuery();
			
			
			
		}catch(Exception e) {
			throw new Error(e);
		}
		
		return rs1;
	}
}
