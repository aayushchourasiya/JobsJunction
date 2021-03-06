<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Here!</title>
<link rel="stylesheet" href="resources/css/index.css">
<link rel="stylesheet" href="resources/css/registration.css">
</head>
<body>
	<div id="navbar">
		<image src = "resources/images/logo512.png" alt = "JobsJunction" style="width:100px;height:auto; padding:1%" id="onlyImage"/>
		<a id="login" href="loginPage">Login?</a>
	</div>
	<div id="registrationDiv">
	<center>
		<form action="registerUser" method="post">
		<h2 id="heading">Please fill this form!</h2>
			<table>
				<tr><td colspan=2>Name</td></tr>
				<tr><td colspan=2><input type="text" id="nameid" name="name" placeholder="Enter your name here!" required="true"></td></tr>
				<tr><td colspan=2>Email Id</td></tr>
				<tr><td colspan=2><input type="email" id="emailid" name="email" placeholder="Enter your email here!" required="true"></td></tr>
				<tr><td colspan=2>Password</td></tr>
				<tr><td colspan=2><input type="password" id="password" name="password" placeholder="Use letters and numbers both!" required="true" onkeypress="checkPassword()"></td></tr>
				<tr><td colspan=2>Gender</td></tr>
				<tr><td class="mobileCSS"><input type="radio" name="gender" required="required" value="Male">Male</td>
				<td class="mobileCSS"><input type="radio" name="gender" value="Female">Female</td>
				<td class="mobileCSS"><input type="radio" name="gender" value="Others">Others</td></tr>
				<tr><td colspan=2>Qualification</td></tr>
				<tr><td class="mobileCSS"><input type="radio" name="qualification" required="required" value="High School">High School</td>
				<td class="mobileCSS"><input type="radio" name="qualification" value="Graduate">Graduate</td>
				<td class="mobileCSS"><input type="radio" name="qualification" value="Post Graduate">Post Graduate</td></tr>
				<td class="mobileCSS"><input type="radio" name="qualification" value="PhD">PhD</td></tr>
				<tr><td colspan=4 style="font-size: 10px;"><input type="checkbox" required="required">I agree to all the terms and conditions of JobsJunction!</td></tr>
				<tr><td colspan=2><input type="submit" value="Register"></td></tr>
			</table>
		</form>
	</center>
	</div>
	<footer>
		<p>Created By Aayush Chourasiya!</p>
	</footer>
	<script>
		var passwordField = document.getElementById("password");
		passwordField.addEventListener("keyup", checkPassword);
		function checkPassword(){
			var pass = passwordField.value;
			if(pass.length>=6){
				if(pass.match(/[a-z]/) && pass.match(/[0-9]/)){
						document.getElementById("heading").innerHTML = "Strong Password!";
					}
				else{
						document.getElementById("heading").innerHTML = "Use letters and numbers both in password!";
					}
			}
			else{
				document.getElementById("heading").innerHTML = "Please use atleast 6 characters!";
				}
		}
		passwordField.addEventListener("blur", blurEvent);
		function blurEvent(){
			document.getElementById("heading").innerHTML = "Please fill this form!";
		}

		var image = document.getElementById("onlyImage");
		image.style.cursor = "pointer";
		image.addEventListener('click', event);
		function event(){
				document.location.href = "/jobsjunction/";
			}
	</script>
</body>
</html>