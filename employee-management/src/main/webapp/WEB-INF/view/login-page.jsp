<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Login Page</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
	</head>
	<body>
		<div class="container-sm" style="margin-top: 30px; width: 748px;">
			<div class="card">
				<h3 class="card-header" style="text-align: center">Please Login</h3>
				
				<div class="card-body">
					<form:form action="${pageContext.request.contextPath}/authenticateUser" method="POST" > 
						<c:if test="${param.error != null}">
							<div class="alert alert-danger" role="alert">
								You failed to login!
							</div>
						</c:if>
						
						<c:if test="${param.logout != null}">
							<div class="alert alert-success" role="alert">
								You have been logged out!
							</div>
						</c:if>
						
						<div class="mb-3 row">
							<label for="username" class="col-sm-4 col-lg-2 col-form-label">Username</label> 
							<div class="col-12 col-sm-8 col-lg-10">
								<input type="text" id="username" name="username" class="form-control"/>	
							</div>
						</div>
						
						<div class="mb-3 row">
							<label for="password" class="col-12 col-sm-4 col-lg-2 col-form-label">Password</label>
							<div class="col-sm-8 col-lg-10">
								<input type="password" id="password" name="password" class="form-control"/> 
							</div> 
						</div>
						
						<div class="row">
							<div class="col">
								<button type="button" class="btn btn-info btn-lg btn-register">Register</button>
							</div>
							
							<div class="col text-end">
								<button type="submit" class="btn btn-primary btn-lg btn-login">Login</button>
							</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>
		
		<script type="text/javascript">
			const btnLogin = document.querySelector(".btn-login");
			const btnRegister = document.querySelector(".btn-register");
			
			btnRegister.addEventListener("click", (event) => {
				window.location.href = "${pageContext.request.contextPath}/showRegistrationPage"
			});
		</script>
	</body>
</html>