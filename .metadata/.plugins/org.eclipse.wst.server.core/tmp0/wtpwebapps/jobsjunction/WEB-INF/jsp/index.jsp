<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>Welcome to JobsJunction!</title>
	<link rel="stylesheet" href="resources/css/index.css">	
	<style>
		#thirdHeading{
			font-family : Brush Script MT;
			color : #8b008b;
			text-shadow: 2pt 2pt white;
		}
		@media only screen and (min-width: 768px){
			#thirdHeading{
				font-size: 50pt;
			}
			#welcomeHeading{
				margin-top: 5%;
			}
		}
		#fifthHeading{
			font-size: 30pt;
		}
	</style>
</head>
<body>
<%
	if(session.getAttribute("username")!=null){
			response.sendRedirect("loginSuccess");
		}
%>	
	<div id="navbar">
		<image src = "resources/images/logo512.png" alt = "JobsJunction" style="width:100px;height:auto; padding:1%" id="onlyImage"/>
		<a id="loginLink" href="loginPage">Login/SignUp</a>
	</div>
	<div id="jobDiv">
		<h2 id = "welcomeHeading">Welcome to Jobs Junction!</h2>
		<h3 id = "secondHeading">Finding or providing jobs is now so easy!</h3>
		<h1 id = "thirdHeading"></h3>
		<h2 id = "fourthHeading">Get yourself registered today!</h3>
		<h2 id = "fifthHeading">All the best!</h1>
	</div>
	
	<footer>
		<p>Created By Aayush Chourasiya!</p>
	</footer>
	<script>
	var changeQuote = getRandomNumberBetween(1, 3);
	function getRandomNumberBetween(min,max){
	    return Math.floor(Math.random()*(max-min+1)+min);
	}
	var thirdHeading = document.getElementById("thirdHeading");
	switch(changeQuote){
	case 1 : 
		thirdHeading.innerHTML = "Choose a job you love, and you will never have" +"<br />"+ "to work a day in your life!";
		break;
	case 2 : 
		thirdHeading.innerHTML = "Work to become, not to acquire!";
		break;
	case 3 : 
		thirdHeading.innerHTML = "It's not what you achieve, it's what you overcome." +"<br />"+ "That's what defines your career!";
		break;
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
