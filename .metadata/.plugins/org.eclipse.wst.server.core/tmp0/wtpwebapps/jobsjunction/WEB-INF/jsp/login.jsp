<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="resources/css/index.css">
<link rel="stylesheet" href="resources/css/login.css">
<title>Login</title>
<style type="text/css">
	
</style>
<script type="text/javascript">

	
</script>
</head>
<body>
<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setHeader("Pragma","no-cache");    
	response.setHeader("Expires", "0");
	if(session.getAttribute("username")!=null){
		response.sendRedirect("loginSuccess");
	}
%>
	<div id="navbar">
		<image src = "resources/images/logo512.png" alt = "JobsJunction" style="width:100px;height:auto; padding:1%" id="onlyImage"/>
		<a id="register" href="registrationPage">New User?</a>
	</div>
	<div id="loginDiv">
	<center>
		<form action="login" method="post" id="formId">
		<h2 id="heading">Enter Your Details!</h2>
			<table>
				<tr><td colspan=2>Email</td></tr>
				<tr><td colspan=2><input type="email" id="emailid" name="emailTag" placeholder="Enter your email here!" required="required"></td></tr>
				<tr><td colspan=2>Password</td></tr>
				<tr><td colspan=2><input type="password" id="passid" name="passTag" placeholder="Enter your password here!" required="required"></td></tr>
				<tr><td colspan=2><input type="submit" value="Login" id="button"></td></tr>
			</table>
		</form>
	</center>
	</div>
	<footer>
		<p>Created By Aayush Chourasiya!</p>
	</footer>
	<script type="text/javascript">
	var image = document.getElementById("onlyImage");
	image.style.cursor = "pointer";
	image.addEventListener('click', event);
	function event(){
			document.location.href = "/jobsjunction/";
		}
	</script>
</body>
</html>