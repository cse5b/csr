/**
 * 
 */
package jsp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * @author SONUSILU
 *
 */
public class FetchInfo {
	public static ResultSet StudentData(Connection c,String search) {
		
		ResultSet rs1 =null;
		
		try {
			
			String q1="select * from studentregister where regdno=?";
			PreparedStatement ps=c.prepareStatement(q1);
			ps.setString(1, search);
			
			rs1=ps.executeQuery();
			if(rs1.next()){
				return rs1;
				
			}
			else{
				rs1=null;
				
			}
			
			
		}catch(Exception e) {
			throw new Error(e);
		}
		
		return rs1;
	}

}
