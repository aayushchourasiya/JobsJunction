<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>We Are Working!</title>
</head>
<body>
<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setHeader("Pragma","no-cache");    
	response.setHeader("Expires", "0");
	
	if(session.getAttribute("username")==null){
		response.sendRedirect("login");
	}
	
%>
	<jsp:include page="loginSuccess.jsp"></jsp:include>
<script>
	//This coding part is for changing the main body after logging in
	var thirdHeading = document.getElementById("thirdHeading");
	thirdHeading.innerHTML = "We are sorry!";

	var fourthHeading = document.getElementById("fourthHeading");
	fourthHeading.innerHTML = "We are currently working to upgrade our site! <br /> Some of the functionalities are shut down due to this upgrade!";
	fourthHeading.style.fontSize = "4vh";
	
	var fifthHeading = document.getElementById("fifthHeading");
	fifthHeading.remove();
</script>
</body>
</html>