package jsp;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.Blob;

public class RegisterJavaCode {

	public static int checkCount(Connection c, String regd) {
		int count=0;
		if(c!=null) {
			try {
				PreparedStatement ps=c.prepareStatement("select registration_no from clubregister where registration_no=?");
				ps.setString(1, regd);
				ResultSet rs=ps.executeQuery();
				while(rs.next()) {
					count=count+1;
				}
				rs.close();
				ps.close();
				
			}catch(Exception w) {
				w.printStackTrace();
			}
			
		}
		return count;
	}
	public static int checkStudentRegister(Connection c, String regd) {
		int count2=0;
		if(c!=null) {
			try {
				PreparedStatement ps1=c.prepareStatement("select regdno from studentregister where regdno=?");
				ps1.setString(1, regd);
				ResultSet rs1=ps1.executeQuery();
				if(rs1.next()) {
					count2=1;
				}
				else {
					count2=0;
				}
				rs1.close();
				ps1.close();
				
			}catch(Exception w) {
				w.printStackTrace();
			}
			
		}
		return count2;
	}

	public static int insertclubregisterTable(Connection c, String regd, String clubtype, String clubname) {
		int msg=0;
		if(c!=null) {
			try {
				String q2="insert into clubregister values(0,?,?,?)";
				PreparedStatement ps2=c.prepareStatement(q2);
				
				ps2.setString(1, regd);
				ps2.setString(2, clubtype);
				ps2.setString(3, clubname);
				int rs=ps2.executeUpdate();
				if(rs > 0) {
					msg=1;
				}
				else {
					msg=0;
				}
			}catch(Exception w) {
				w.printStackTrace();
			}
		}
		return msg;
	}

	public static String registerStudentTable(Connection c, String regd, String fname, String mname, String lname,
			String bg, String gender, String email, String mobile, String altmobile, String course, String dept,
			String sem,String clubtype,String clubname,Blob inputStream ) {
		int row;
		String msg2="";
		PreparedStatement ps=null,ps2=null,ps3=null;
		
		
		try {
			String ins = "insert into studentregister values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			ps = c.prepareStatement(ins);
			
			ps.setString(1, regd);
			ps.setString(2, fname);
			ps.setString(3, mname);
			ps.setString(4, lname);
			ps.setString(5, bg);
			ps.setString(6, gender);
			ps.setString(7, email);
			ps.setString(8, mobile);
			ps.setString(9, altmobile);
			ps.setString(10, course);
			ps.setString(11, dept);
			ps.setString(12, sem);
			ps.setString(13, clubtype);
			ps.setString(14, clubname);
			 if (inputStream != null) {
		            // fetches input stream of the upload file for the blob column
		            ps.setBlob(15, inputStream);
		        }

			//ps.setBinaryStream(13, (InputStream) fis, (int) (image.length()));
			row =ps.executeUpdate();
			// For CLUB REGISTRATION
			int check=RegisterJavaCode.checkclubregisterTable(c,regd,clubtype,clubname);
			if(check!=1) {
				row=RegisterJavaCode.insertclubregisterTable(c,regd,clubtype,clubname);
				int check2=RegisterJavaCode.insertAttendanceregisterTable(c,regd,fname,clubname);
				if(check2==1){
					msg2="Update Succesfully To Att";
				}
				else{
					msg2="UnSuccesfull To Att";
				}
			}
			else {
				msg2="Data Not Registered into "+clubname;
				
			}
			// For ATTENDANCE TABLE
			
			
			
			if(row > 0){
				msg2="Registerd Succesfully done...";
				
			}
			else {
				msg2="Data Not Inserted";
			}
			ps.close();
			
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
            try {
               
                if (ps != null) {
                    ps.close();
                    ps = null;
                }
                if (c != null) {
                    c.close();
                    c = null;
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
		
		return msg2;
	}

	public static int checkclubregisterTable(Connection c, String data, String clubtype, String clubname) {
		int check=0;
    	try {
    		
		    	String query = "select * from clubregister where registration_no=? and clubtype=? and clubname=?";
	    		PreparedStatement statement = c.prepareStatement(query);
	    		statement.setString(1, data);
	    		statement.setString(2, clubtype);
	    		statement.setString(3, clubname);
	    		
	    		ResultSet set = statement.executeQuery();
	    		if(set.next()) {
	    			check=1;
	    			
	    		}
	    		else {
	    			check=0;
	    			}
				set.close();
		    	statement.close();
		    	

		}catch( SQLException e) {
			throw new Error(e);
			
		}
    	 
    
		return check;
	}
	public static int insertAttendanceregisterTable(Connection c, String regdno, String name, String clubname) {
		int check=0;
    	try {
    		
		    	String query = "insert into attendance values(0,?,?,?,0)";
	    		PreparedStatement statement = c.prepareStatement(query);
	    		statement.setString(1, regdno);
	    		statement.setString(2, name);
	    		statement.setString(3, clubname);
	    		
	    		int row= statement.executeUpdate();
	    		if(row > 0) {
	    			check=1;
	    			
	    		}
	    		else {
	    			check=0;
	    			}
				
		    	statement.close();
		    	

		}catch( SQLException e) {
			throw new Error(e);
			
		}
    	 
    
		return check;
	}
	public static ResultSet fetchFromClubRegister(Connection c,String clubname) {
		ResultSet rs = null;
		try {
			
			String q1="select registration_no from clubregister where clubname=?";
			PreparedStatement ps=c.prepareStatement(q1);
			
			ps.setString(1, clubname);
			ResultSet rs200=ps.executeQuery();
			
			if(rs200.next()) {
				rs=rs200;
			}
			else {
				rs=null;
			}
			
			
		}catch(Exception e) {
			throw new Error(e);
		}
		return rs;
	}
	public static String updateIntoStudentRegister(Connection c, String data, String clubname) {
		String update="";
		try {
			String query="update studentregister set clubname2=? where regdno=?";
			PreparedStatement psupdate=c.prepareStatement(query);
			
			psupdate.setString(1, clubname);
			psupdate.setString(2, data);
			int row=psupdate.executeUpdate();
			if(row > 0) {
				update="Update Succesfull Done";
			}
			else
			{
				update="Update UnSuccesfull";

			}
		}catch( Exception e) {
			throw new Error(e);
			
		}
		return update;
	}
	public static int updateAttendance(Connection c, String regd, String clubname,int ckck) {
		int update;
		try {
			String query="update attendance set attendance=? where regdno=? and clubname=?";
			PreparedStatement psupdate=c.prepareStatement(query);
			
			psupdate.setString(1, clubname);
			psupdate.setString(2, regd);
			psupdate.setInt(3, ckck);
			int row=psupdate.executeUpdate();
			if(row > 0) {
				update=1;
			}
			else
			{
				update=0;

			}
		}catch( Exception e) {
			throw new Error(e);
			
		}
		return update;
	}
	

}
