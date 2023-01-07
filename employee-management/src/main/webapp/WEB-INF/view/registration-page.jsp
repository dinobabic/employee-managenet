<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Registration Page</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
	</head>
	<body>
		<div class="container" style="margin-top: 30px; width: 748px">
		
			<div class="card">
				<h3 class="card-header" style="text-align: center;">Please Register</h3>
			
				<div class="card-body">
					<form:form action="${pageContext.request.contextPath}/registerUser" method="POST" modelAttribute="crmUser"> 
						
						
						
						<c:if test="${registrationError != null}">
							<div class="alert alert-danger" role="alert">
								You failed to register!
							</div>
						</c:if>
						
						<div class="mb-3 row">
							<label for="username" class="col-sm-4 col-lg-2 col-form-label">Username</label>
							<div class="col-md-10">
								<div class="col-md-10">
									<form:input path="username" class="form-control"/>
									<form:errors path="username" class="text-danger"/>
								</div>
							</div>
						</div>
						
						<div class="mb-3 row">
							<label for="password" class="col-sm-4 col-lg-2 col-form-label">Password</label>
							<div class="col-md-10">
								<div class="col-md-10">
									<form:password path="password" class="form-control"/>
									<form:errors path="password" class="text-danger"/>
								</div>
							</div>
						</div>
						
						<div class="mb-3 row">
							<label for="matchingPassword" class="col-sm-4 col-lg-2 col-form-label">Confirm Password</label>
							<div class="col-md-10">
								<div class="col-md-10">
									<form:password path="matchingPassword" class="form-control"/>
									<form:errors path="matchingPassword" class="text-danger"/>
								</div>
							</div>
						</div>
						
						<div class="mb-3 row">
							<label for="firstName" class="col-sm-4 col-lg-2 col-form-label">First Name</label>
							<div class="col-md-10">
								<div class="col-md-10">
									<form:input path="firstName" class="form-control"/>
									<form:errors path="firstName" class="text-danger"/>
								</div>
							</div>
						</div>
						
						<div class="mb-3 row">
							<label for="lastName" class="col-sm-4 col-lg-2 col-form-label">Last Name</label>
							<div class="col-md-10">
								<div class="col-md-10">
									<form:input path="lastName" class="form-control"/>
									<form:errors path="lastName" class="text-danger"/>
								</div>
							</div>
						</div>
						
						<div class="mb-3 row">
							<label for="email" class="col-sm-4 col-lg-2 col-form-label">Email</label>
							<div class="col-md-10">
								<div class="col-md-10">
									<form:input path="email" class="form-control"/>
									<form:errors path="email" class="text-danger"/>
								</div>
							</div>
						</div>
						
						<div class="row">
							<div class="col">
								<button type="button" class="btn btn-info btn-lg btn-back">Back</button>
							</div>
							
							<div class="text-end col">
								<button type="submit" class="btn btn-primary btn-lg">Register</button>
							</div>
							
						</div>
						
					</form:form>
				</div>
			</div>
		</div>
		
		<script type="text/javascript">
			const btnBack = document.querySelector(".btn-back");
			
			btnBack.addEventListener("click", (event) => {
				window.location.href = "${pageContext.request.contextPath}/showLoginPage";
			});
		</script>
	</body>
</html>










