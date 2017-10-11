package jsp;
import java.util.*;

public class Validate {
	 public static String validateRegd(String regdno) {
	    	String error="";
	    	if(regdno.isEmpty()){
	    		error="Registration No can not be Blank";
	    	}
	    	else if(regdno.length()!=12 && regdno.length()!=5){
	    		error="Please Enter a Valid Registration No...";
	    	}
	    	return error;
	 
	    }
	 public static String validateRegd2(String regdno) {
	    	String error="";
	    	if(regdno.isEmpty()){
	    		error="Registration No can not be Blank";
	    	}
	    	else if(regdno.length()!=12){
	    		error="Please Enter a Valid Registration No...";
	    	}
	    	return error;
	 
	    }
	 public static String validateFname(String fname) {
	    	String error="";
	    	if(fname.isEmpty()){
	    		error="Field can not be Blank";
	    	}
	    	
	    	return error;
	 
	    }
			
	 public static String validateLname(String lname) {
	    	String error="";
	    	if(lname.isEmpty()){
	    		error="Registration No can not be Blank";
	    	}
	    	
	    	return error;
	 
	    }
	 public static String validateMobile(String mobile) {
	    	String error="";
	    	if(mobile.isEmpty()){
	    		error="Mobile No can not be Blank";
	    	}
	    	else if(mobile.length()!=10){
	    		error="Please Enter a Valid Mobile No...";
	    	}
	    	return error;
	 
	    }
	 public static String validateAlterMobile(String altmobile,String mobile) {
	    	String error="";
	    	if(altmobile.isEmpty()){
	    		error="Altermobile No can not be Blank";
	    	}
	    	else if(altmobile.length()!=10){
	    		error="Please Enter a Valid Mobile No...";
	    	}
	    	else if(altmobile==mobile){
	    		error="Alternate Mobile No Cant b Same.";
	    	}
	    	return error;
	 
	    }
	 
	 
	 
	 	public static String validateEmail(String email) {
				String error="";
				
				if(email.isEmpty()){
		    		error="Email Id can not be Blank";
		    	}

				else if(!email.matches("^(\\w+(\\.\\w+)*@\\w+\\.\\w{2,4})$")) {
					error="Invalid Email";
					}
				
		    	return error;
			    }
			public static String validatePassword(String password) {
				String error="";
				if(password.isEmpty()){
		    		error="Password can not be Blank";
		    	}
				
				else if(!password.matches("(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%]).{6,20}")){
					error="Password Must Contains a Upper and Lower case letter and a Special character with Digit.";
				}
				
		    	return error;
			}
			public static String validateType(String type) {
				String error="";
				if(type.isEmpty()){
		    		error="Type can not be Blank";
		    	}
		    	return error;
			}
			public static String validateAns(String ans) {
				String error="";
				if(ans.isEmpty()){
		    		error="What is Your Answer ???";
		    	}
		    	return error;
			}
			//  Validation Login Starts NOw
			
			public static String validateRegdLogin(String regd) {
				String error="";
				if(regd.isEmpty()){
		    		error="Registration No can not be Blank";
		    	}
		    	return error;
			}
			
			public static String validatePasswordLogin(String password) {
				String error="";
				if(password.isEmpty()){
		    		error="Password can not be Blank";
		    	}
		    	return error;
			}
			

}
