<%@page import="jobsjunction.controller.PageController"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Logout Success!</title>
</head>

<body>
	<% 	
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		response.setHeader("Pragma","no-cache");    
		response.setHeader("Expires","0");
		
		if(session.getAttribute("username")!=null){
			session.removeAttribute("username");
			session.invalidate();
			response.sendRedirect("loginPage");
		}
	%>
</body>
</html>