<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Home Page</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
	</head>
	<body>
		<div class="container text-center" style="margin-top: 30px">
  			<div class="row">
    			<div class="col">
     				<h1>Welcome to the Home Page!</h1>
    			</div>
    			<div class="col text-end">
      				<button type="button" class="btn btn-primary btn-lg btn-login">Login</button>
    			</div>
  			</div>
  			
  			 <img src="/employee-management/src/main/resources/images/employee-management.png"/>
		</div>
		
		<script type="text/javascript">
			const btnLogin = document.querySelector(".btn-login");
			
			btnLogin.addEventListener("click", (event) => {
				window.location.href = "${pageContext.request.contextPath}/showLoginPage"
			});
		</script>
	</body>
</html>