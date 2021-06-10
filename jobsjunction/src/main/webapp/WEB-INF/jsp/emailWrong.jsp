<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Please Try Again!</title>
</head>
<body>
	<jsp:include page="login.jsp"></jsp:include>
	<script type="text/javascript">
		var heading = document.getElementById("heading");
		heading.innerHTML = "Email doesn't exists! Please register first!" ;
		document.getElementById("emailid").addEventListener("focus", emailFunction);
		document.getElementById("passid").addEventListener("focus", emailFunction);
		function emailFunction(){
			heading.innerHTML = "Enter Your Details!" ;
			}
	</script>
</body>
</html>