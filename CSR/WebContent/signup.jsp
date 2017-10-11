<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" href="login.png">
	<meta charset="utf-8"/>
<title>Sign UP</title>
		<link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
		<script type="text/javascript" src ="jquery.js"></script>
		<script type="text/javascript" src ="jquery-ui.js"></script>
		<link rel="stylesheet" href="jquery-ui.css" type="text/css"/>
		<link rel="stylesheet" href="signupcss.css" type="text/css"/>
		
		<script type="text/javascript">
			$(function() {
				$("#addmission").datepicker();
				$("#signup").button();
			});
		
		</script>
	<div class="head">
		<h1>MY WEB PRO</h1>
	</div>
</head>
<script>
function submitFunction(){
	var x = document.forms["formValidate"]["registration_no"].value;
	var y = document.forms["formValidate"]["fname"].value;
	if(x==null||x==""||y==null||y==""){
		alert("Can not be Empty");
	}
	else{
		alert("succesfull");
	}


</script>
<body>
<div class="container">
	<div class="signupBox">
		
		<h2>Sign Up here</h2>
		<form action="" method="post" name="formValidate" onsubmit="submitFunction()">
		<div class="headbar"><h3> Student Information</h3></div>
		<table width="100%" cellpadding="5px" cellspacing="12px">
			
			<tr>
				<td>
					<p>Registration No<p>
					<input type="text" name="registration_no" />
				</td>
				<td></td>
				
				<td>
					<p>Admission Date<p>
					<input type="text" name="admission_date" id="addmission" required autocomplete="off"/>
				
				</td>
				<td>
					 <p>Gender<p>
					<select name="gender" required autocomplete="off">
							  <option value="male">Male</option>
							  <option value="female">Female</option>
							  
					</select>
				</td>
			</tr>
			<tr>
				<td>
					<p>First Name<p>
					<input type="text" name="fname"  required autocomplete="off" />
				</td>
				<td></td>
				
				<td>
					<p>Middle Name<p>
					<input type="text" name="mname"  required autocomplete="off" />
				</td>
				
				
				<td>
					<p>Last Name<p>
					<input type="text" name="lname"  required autocomplete="off">
					
				</td>
				<td></td>
			</tr>
		</table>
	
				
				<div class="headbar"><h3> Contact Information</h3></div>
		<table width="100%" cellpadding="5px" cellspacing="1px">
			<tr>
				<td>
					<p>Email<p>
					<input type="text" name="email"  required autocomplete="off">
					
				</td>
				<td></td>
				<td>
					<p>Mobile No<p>
					<input type="text" name="mobile"  required autocomplete="off">
					
				</td>
				<td>
					<p>Alternate Mobile No<p>
					<input type="text" name="alternate_mobile"  required autocomplete="off">
					
				</td>
				<td></td>
			</tr>
			<tr>
				<td>
					<p>User name<p>
					<input type="text" name="username"  required autocomplete="off">
					
				</td>
				<td></td>
				<td>
					<p>Password<p>
					<input type="password" name="password" required autocomplete="off">
				</td>
				
				<td>
					<p>Confirm Password<p>
					<input type="password" name="confirmpassword" required autocomplete="off">
					
				</td>
				<td></td>
			</tr>
			
			</table >
			
			<div class="headbar"><h3> Academic Details</h3></div>
			<table width="100%" cellpadding="5px" cellspacing="1px">
			
			<tr>
				<td>
					<p>Course<p>
						<select name="course" required autocomplete="off">
							  <option value="BTech"> BTech</option>
							  
							  <option value="MTech">MTech</option>
							  <option value="Diploma">Diploma</option>
							  <option value="BSc">BSc</option>
							  <option value="Gram_Tarang"> Gram Tarang</option>
							  
							 
						</select>
				</td>
				<td></td>
				
				<td>
					<p>Department<p>
						<select name="department" required autocomplete="off">
							  <option value="cse">CSE</option>
							 <option value="mech">MECH</option>
							 <option value="civil">CIVIL</option>
							 <option value="ee">EE</option>
							 <option value="">EEE</option>
							 <option value="">ECE</option>
							
							 
						</select>
					
				</td>
		
				
				<td>
					<p>Semester<p>
					<select name="semester" required autocomplete="off">
						<option value="1st">1<sup>st</sup> Semseter</option>
						<option value="2nd">2<sup>nd</sup> Semseter</option>
						<option value="3rd">3<sup>rd</sup> Semseter</option>
						<option value="4th">4<sup>th</sup> Semseter</option>
						<option value="5th">5<sup>th</sup> Semseter</option>
						<option value="6th">6<sup>th</sup> Semseter</option>
						<option value="7th">7<sup>th</sup> Semseter</option>
						<option value="8th">8<sup>th</sup> Semseter</option>	  
					</select>
				</td>
				<td></td>
				
			</tr>
			</table>
			
			
				<div class="headbar"><h3> Club Details</h3></div>
			<table width="100%" cellpadding="5px" cellspacing="12px">
			
			<tr>
				<td>
					<p>Club Type<p>
						<select name="clubtype" required autocomplete="off">
							  <option value="cultural">Cultural</option>
							  <option  value="sports">Sports</option>
							  <option value="responsiblity">Responsiblity</option>
							 
						</select>
				</td>
				<td>
					<p>Club Name<p>
						<select name="clubname" required autocomplete="off">
							 <optgroup label="CULTURAL DEPT">
							
							  <option value="MUSIC CLUB RHYTHM">MUSIC CLUB "RHYTHM"</option>
							  <option value="DANCE CLUB STEPUP">DANCE CLUB STEP UP</option>
							  <option value="DRAMATIC CLUB ACTION PLAY">DRAMATIC CLUB ACTION PLAY</option>
							  <option value="PAINTING CLUB KRETON">PAINTING CLUB KRETON</option>
							  <option value="MOVIE CLUB ">MOVIE CLUB </option>
							  <option value="LAUGHTER CLUB">LAUGHTER CLUB</option>
							  <option value="LITERARY CLUB SRUJANEE">LITERARY CLUB "SRUJANEE"</option>
							  <option value="ROBOTICS CLUB">ROBOTICS CLUB</option>
							  <option value="LANGUAGE CLUB SCINTILLA">LANGUAGE CLUB "SCINTILLA"</option>
							  <option value="INNOVATEUR CLUB">INNOVATEUR CLUB</option>
							  <option value="DESIGNER CLUB PHOTOCHRONICLES">DESIGNER CLUB PHOTOCHRONICLES</option>
							  <option value="HANDICRAFT CLUB ARTISAN">HANDICRAFT CLUB ARTISAN</option>
							  <option value="Science Club ILLUMINATI">Science Club "ILLUMINATI"</option>
							</optgroup>
							 	<option value=""></option>
							<optgroup label="SPORTS DEPT">
							  <option value="SPORTS, SEDA & HEALTH CLUB ">SPORTS, SEDA & HEALTH CLUB </option>
							  <option value="PC GAME CLUB XENA">PC GAME CLUB XENA</option>
							  <option value="HEALTH CLUB">HEALTH CLU</option>
							  <option value="ADVENTURE CLUB VOYAGE">ADVENTURE CLUB VOYAGE</option>
							  <option value="YOGA & MEDITATION CLUB">YOGA & MEDITATION CLUB</option>
							</optgroup>
							<option value=""></option>
							<optgroup label="RESPONSIBILTY">
							  <option value="YOUTH RED CROSS, NSS, NCC CLU">YOUTH RED CROSS, NSS, NCC CLU</option>
							  <option value="NATURE CLUB">NATURE CLUB</option>
							  <option value="GO GREEN CLUB">GO GREEN CLUB</option>
							  <option value="P & P CLUB">P & P CLUB</option>
							  <option value="APTI CLUB">APTI CLUB</option>
							</optgroup> 
							 
						</select>
					
				</td>
				</tr>
				
			<tr>
				<td>
					<p>Interested For<p>
					<textarea type="text" rows="3" cols="60" name="description" required autocomplete="off"></textarea>
					
				</td>
				<td>
					<p>Experience<p>
					<select name="experience" required autocomplete="off">
							  <option value="first_time">First Time</option>
							  <option value="less_than_6_months">Less Than 6 Months</option>
							  <option value="less_than_6_months">One Year</option>
							  <option value="less_than_6_months">One Year(Plus)</option>
							 
							 
					</select>
				</td>
				<td></td>
			</tr>
			
			
				
		</table></br>
		<div class="submit">
				<input type="submit" name="submit" onsubmit="submitFunction()"value="Submit">
		</div>		
		<div class="forgot">
			<table cellspacing="18px">
			<tr>
				<td><a href="#"> Forgot Password </a></td>
				<td><p>Already a Account : <a href="login.html"><strong>Login<strong></p></td>
			</tr>
			</table>
		</div>
		</form>
		
	</div>
</div>
</body>
</html>