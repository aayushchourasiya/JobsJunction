<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome ${username}!</title>
<link rel="stylesheet" href="resources/css/loginSuccess.css">
<style type="text/css">
	#fourthHeading{
		font-size: 30pt; 
	}
</style>
</head>
<body>
<%
	if(session.getAttribute("username")==null){
		response.sendRedirect("login");
	}
%>
	<input type="hidden" id="hidden" value="${username}">
	<jsp:include page="index.jsp"></jsp:include>
	<script type="text/javascript">

		//This coding part is for getting previous values and working with it!	
		var hidden = document.getElementById("hidden").value;
		var userName = document.getElementById("loginLink");
		userName.innerHTML = hidden;
		userName.removeAttribute("href");
		userName.style.cursor = "pointer";
		userName.addEventListener("mouseover" , mouseOver);
		function mouseOver(){
				userName.innerHTML = "Log Out!";
			}
		userName.addEventListener("mouseout" , mouseOut);
		function mouseOut(){
				userName.innerHTML = hidden;
			}
		userName.addEventListener("click" , logOut);
		function logOut(){
				document.location.href = "logoutPage";
			}

		//This coding part is for changing the main body after logging in
		var thirdHeading = document.getElementById("thirdHeading");
		thirdHeading.innerHTML = "How can we help you?";

		var fourthHeading = document.getElementById("fourthHeading");
		fourthHeading.innerHTML = "Post A Job?";
		fourthHeading.style.cursor = "pointer";
		fourthHeading.addEventListener("click" , postClick);
		function postClick(){
				document.location.href = "notAvailable";
			}

		var fifthHeading = document.getElementById("fifthHeading");
		fifthHeading.innerHTML = "Find A Job?";
		fifthHeading.style.cursor = "pointer";
		fifthHeading.addEventListener("click" , findClick);
		function findClick(){
				document.location.href = "notAvailable";
			}
		 
		//This method is forwarding to the next page! As there is no next page 
		//when this page is loaded first time, it is not forwarding!
		function preventBack() { window.history.forward(); }
		setTimeout("preventBack()", 0);


		var image = document.getElementById("onlyImage");
		image.style.cursor = "pointer";
		image.addEventListener('click', event);
		function event(){
				document.location.href = "/jobsjunction/";
			}
		
	</script>
</body>
</html>

	
	