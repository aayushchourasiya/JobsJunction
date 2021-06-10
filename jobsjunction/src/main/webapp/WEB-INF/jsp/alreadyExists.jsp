<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Email already Exists!</title>
<style type="text/css">
	p{
		font-family: verdana;
		color: black;
	}
</style>
</head>
<body>
	<input type="hidden" value="${namePassingToJsp}" id="namePassing">
	<input type="hidden" value="${emailPassingToJsp}" id="emailPassing">
	<jsp:include page="registration.jsp"></jsp:include>
	<script type="text/javascript" >
		alert("Email already exists! Please try another!");

		//Getting values from field
		var nameFromJsp = document.getElementById("namePassing").value;
		var emailFromJsp = document.getElementById("emailPassing").value;

		//Getting fields and storing them into variables
		var nameField = document.getElementById("nameid");
		var emailField = document.getElementById("emailid");
		var passwordField = document.getElementById("password");

		//Setting name and email value
		nameField.value = nameFromJsp;
		emailField.value = emailFromJsp;
		
		var heading = document.getElementById("heading");
		heading.innerHTML = "Please fill all details again! And remember to use new Email Id!";
		nameField.addEventListener("focus", emailFunction);
		emailField.addEventListener("focus", emailFunction);
		passwordField.addEventListener("focus", emailFunction);
		function emailFunction(){
			heading.innerHTML = "Please fill this form!" ;
			}
	</script>
</body>
</html>