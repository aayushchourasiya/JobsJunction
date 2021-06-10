<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Wrong Password!</title>
</head>
<body>
	<!-- Using this hidden field because we cannot use El Expression in <script> tag, so to get the value of email, we use hidden.  -->
	<input type="hidden" value="${emailShowAfterError}" id="takingEmailFromHere">
	<jsp:include page="login.jsp"></jsp:include>
	<script type="text/javascript">
		var heading = document.getElementById("heading");
		heading.innerHTML = "Wrong Password" ;
		var email = document.getElementById("takingEmailFromHere").value;
		document.getElementById("emailid").value = email;
		document.getElementById("emailid").addEventListener("focus", emailFunction);
		document.getElementById("passid").addEventListener("focus", emailFunction);
		function emailFunction(){
			heading.innerHTML = "Enter Your Details!" ;
			}
	</script>
</body>
</html>