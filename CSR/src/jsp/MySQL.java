package jsp;

import java.sql.*;

public class MySQL {
	 public static Connection connect() {
		 try{
		 			
		 			
		 			Class.forName("com.mysql.jdbc.Driver").newInstance();//load driver
		 			return DriverManager.getConnection("jdbc:mysql://localhost:3307/csr","root","Sonusilu@123");
		 			}catch(Exception e){
		     		return null;
		     	}
		     }
		     
		     public static boolean close(Connection c){
		     	try{
		     		c.close();
		     		return true;
		     	}catch(Exception e){
		     		return false;
		     	}
		     	
		     }
		     
		     public static 	boolean testUser(Connection c,String regdno){
			 		boolean error;
			 		try{
			 			String query1="select registration_no from logintable where registration_no=?";
			 			PreparedStatement ps1 = c.prepareStatement(query1);
			 			ps1.setString(1, regdno);
			 			ResultSet rs1=ps1.executeQuery();
			 			if(rs1.next()) {
			 				error=false;
			 				
			 			}
			 			else {
			 				error=true;
			 			}
			 			rs1.close();
		 				ps1.close();
			 		}catch(Exception e){
			 			throw new Error(e);
			 		}
			 		return error; 
		     }
		     
		     //Check registartion no is exist or not in STudent table
		     public static boolean checkStudent(Connection c, String regdno,String clubname) {
		    	   	boolean err=true;
		    	   	 try{
		    		 			String q="select registration_no from clubregister where registration_no=? and clubname=?";
		    					PreparedStatement ps3 = c.prepareStatement(q);
		    					ps3.setString(1, regdno);
		    					ps3.setString(2, clubname);
		    					 ResultSet rss=ps3.executeQuery()	;	
		    					 if(rss.next()) {
		    						err=true;//if regd no exist in student register table then u can Signup CSR Accocunt
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
		     public static boolean checkStudentt(Connection c, String regdno) {
		    	   	boolean err=true;
		    	   	 try{
		    		 			String q="select regdno from studentregister where regdno=?";
		    					PreparedStatement ps3 = c.prepareStatement(q);
		    					ps3.setString(1, regdno);
		    					
		    					 ResultSet rss=ps3.executeQuery()	;	
		    					 if(rss.next()) {
		    						err=true;//if regd no exist in student register table then u can Signup CSR Accocunt
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

			 		
			
		     public static 	boolean insertUser2(Connection c,String regdno,String email,String password,String type,String quest,String ans){
		 		boolean error;
		 		
		 		
		 		try{
		 			String query2="insert into logintable values(?,?,?,?,?,?)";
					PreparedStatement ps2 = c.prepareStatement(query2);
					 			
					 			ps2.setString(1, regdno);
					 			ps2.setString(2, email);
					 			ps2.setString(3, password);
					 			ps2.setString(4, type);
					 			ps2.setString(5, quest);
					 			ps2.setString(6, ans);
					 			
					 			
					 			ps2.execute();
					 			error= true;
		 				
					 			
					 		}catch(Exception e){
					 			error=false;
					 			throw new Error(e);
					 		}
					 		
					return error; 	
		     }
		     
			// Login INformation Checking
		     public static boolean loginUser(Connection c,String regd,String pass) {
		    	boolean error;
		    	try {
		    		
				    	String query = "select * from logintable where registration_no=? and password=?";
			    		PreparedStatement statement = c.prepareStatement(query);
			    		statement.setString(1, regd);
			    		statement.setString(2, pass);
			    		
			    		ResultSet set = statement.executeQuery();
			    		if(set.next()) {
			    			error=true;
			    			
			    		}
			    		else {
			    			error=false;
			    			}
						set.close();
				    	statement.close();
				    	
	
	    		}catch( SQLException e) {
	    			throw new Error(e);
	    			
	    		}
		    	 
		    return error;
		     }
		    // Check Register no is exidst or not while registering a club
		     public static 	boolean testRegistered(Connection c,String regdno){
			 		boolean error;
			 		try{
			 			String query1="select regdno from studentregister where regdno=?";
			 			PreparedStatement ps1 = c.prepareStatement(query1);
			 			ps1.setString(1, regdno);
			 			ResultSet rs1=ps1.executeQuery();
			 			if(rs1.next()) {
			 				error=false;
			 				
			 			}
			 			else {
			 				error=true;
			 			}
			 			rs1.close();
		 				ps1.close();
			 		}catch(Exception e){
			 			throw new Error(e);
			 		}
			 		return error; 
		     }
		     
		  // Forgot Password  
		     public static boolean forgotPassword(Connection c,String id,String security,String paanswer) {
			    	boolean error;
			    	try {
			    		
					    	String query = "select * from logintable where registration_no=? and security=? and answer=?";
				    		PreparedStatement statement = c.prepareStatement(query);
				    		statement.setString(1, id);
				    		statement.setString(2, security);
				    		statement.setString(3, paanswer);
				    		ResultSet set = statement.executeQuery();
				    		if(set.next()) {
				    			error=true;
				    			
				    		}
				    		else {
				    			error=false;
				    			}
							set.close();
					    	statement.close();
					    	
		
		    		}catch( SQLException e) {
		    			throw new Error(e);
		    			
		    		}
			    	 
			    return error;
			     }
		     // Change Password
		     public static boolean updatePassword(Connection c,String id,String pass) {
			    	boolean error;
			    	try {
			    		
					    	String query = "update logintable set password=? where registration_no=? ";
				    		PreparedStatement statement = c.prepareStatement(query);
				    		statement.setString(1, pass);
				    		statement.setString(2, id);
				    		
				    		int set = statement.executeUpdate();
				    		if(set > 0) {
				    			error=true;
				    			
				    		}
				    		else {
				    			error=false;
				    			}
							
					    	statement.close();
					    	
		
		    		}catch( SQLException e) {
		    			throw new Error(e);
		    			
		    		}
			    	 
			    return error;
			     }
}
