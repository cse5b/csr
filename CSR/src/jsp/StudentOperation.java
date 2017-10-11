/**
 * 
 */
package jsp;
import java.sql.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * @author SONUSILU
 *
 */
public class StudentOperation {
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
			
			ps.close();
		}catch(Exception e) {
			throw new Error(e);
		}
		
		return rs1;
	}
	//Fetch REgd No Registered For Clubs
public static ResultSet fetchRegisteredClub(Connection c,String id) {
		
		ResultSet rs2 =null;
		
		try {
			
			String q1="select clubtype,clubname from clubregister where registration_no=?";
			PreparedStatement ps=c.prepareStatement(q1);
			ps.setString(1, id);
			
			rs2=ps.executeQuery();
			/*
			while(rs2.next()) {
				
				FetchData fd= new FetchData();
				fd.setClubtype(rs2.getString("clubtype"));
				fd.setClubname(rs2.getString("clubname"));
				
			}
			if(rs2.next()){
				return rs2;
				
				
			}
			else{
				rs2=null;
				
			}*/
			
			
		}catch(Exception e) {
			throw new Error(e);
		}
		
		return rs2;
	}
		
		//Check Password Password---------------------------------------
	public static boolean currentPassword(Connection c,String id,String current) {
		boolean msg=false ;
		ResultSet rss;
		try {
			
			String q1="select * from logintable where registration_no=? and password=?";
			PreparedStatement ps=c.prepareStatement(q1);
			ps.setString(1, id);
			ps.setString(2, current);
			rss=ps.executeQuery();
			if(rss.next()){
				msg=true;
				
			}
			else{
				msg=false;
				
			}
			rss.close();
			ps.close();
			
		}catch(Exception e) {
			throw new Error(e);
		}
		
		return msg;
	}

	// If Exist Then Update/Change Password
	
	public static boolean updatePassword(Connection c,String id,String Newpass) {
		boolean msg=false;
		
		try {
			
			String q1="update logintable set password=? where registration_no=?";
			PreparedStatement ps=c.prepareStatement(q1);
			ps.setString(1, Newpass);
			ps.setString(2, id);
			int rss = ps.executeUpdate();
			if(rss > 0){
				msg=true;
				
			}
			else{
				msg=false;
				
			}
			
			ps.close();
			
		}catch(Exception e) {
			throw new Error(e);
		}
		
		return msg;
	}

}
