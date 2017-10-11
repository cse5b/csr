package jsp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Incharge {
	
	
	public static ResultSet fetchInchargeData(Connection c,String id) {
		
		ResultSet rs =null;
		
		try {
			
			String q="select * from incharge where id=?";
			PreparedStatement ps=c.prepareStatement(q);
			ps.setString(1, id);
			rs=ps.executeQuery();
			if(rs.next()){
				return rs;
				
			}
			else{
				rs=null;
				
			}
			rs.close();
			c.close();
			
		}catch(Exception e) {
			throw new Error(e);
		}
		
		return rs;
	}
	public static boolean checkIncharge(Connection c, String regdno) {
   	boolean err=true;
   	 try{
	 			String q="select id from incharge where id=?";
				PreparedStatement ps3 = c.prepareStatement(q);
				ps3.setString(1, regdno);
				 ResultSet rss=ps3.executeQuery()	;	
				 if(rss.next()) {
					err=true;
				 }
				 else {
					err=false;
				 }
				 rss.close();
				 ps3.close();
			}catch(Exception e){
				
			}
   	 
		return  err;
	}

public static ResultSet searchStudentData(Connection c,String search,String clubname) {
		clubname="";
		ResultSet rs1 =null;
		
		try {
			
			String q1="select * from studentregister where regdno=?";
			PreparedStatement ps=c.prepareStatement(q1);
			ps.setString(1, search);
			//ps.setString(2, clubname);
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

public static ResultSet fetchStudentData(Connection c,String regist) {
	
	ResultSet rs1 =null;
	
	try {
		
		String q1="select * from studentregister where regdno=?";
		PreparedStatement ps=c.prepareStatement(q1);
		ps.setString(1, regist);
		
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
/*

/*
public static ResultSet selectAll(Connection c,String clubname) {
	
	ResultSet rs200 =null;
	
	try {
		
		String q1="select * from studentregister where clubname=?";
		PreparedStatement ps=c.prepareStatement(q1);
		
		ps.setString(1, clubname);
		rs200=ps.executeQuery();
		while(rs200.next()){
			
			
		}
		
		
	}catch(Exception e) {
		throw new Error(e);
	}
	
	return rs200;
	}*/
}
