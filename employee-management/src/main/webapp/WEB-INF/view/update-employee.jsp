<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Update Employee</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
	</head>
	<body>
		<div class="container" style="margin-top: 40px;">
			<div class="card" style="margin-bottom: 25px">
				<h1 class="card-header text-center text-primary">Update Employee</h1>
			</div>
			<div class="card-body">
				<form:form action="${pageContext.request.contextPath}/employee/saveEmployee" method="POST" modelAttribute="user"> 
						<form:hidden path="id"/>
					
					<div class="mb-3 row">
						<label for="username" class="col-sm-4 col-lg-2 col-form-label">Username</label> 
						<div class="col-12 col-sm-8 col-lg-10">
							<form:input path="username" type="text" id="username" name="username" class="form-control"/>	
						</div>
					</div>
					
					<div class="mb-3 row">
						<label for="password" class="col-sm-4 col-lg-2 col-form-label">Password</label> 
						<div class="col-12 col-sm-8 col-lg-10">
							<form:input path="password" type="password" id="password" name="password" class="form-control"/>	
						</div>
					</div>
					
					<div class="mb-3 row">
						<label for="firstName" class="col-sm-4 col-lg-2 col-form-label">First Name</label> 
						<div class="col-12 col-sm-8 col-lg-10">
							<form:input path="firstName" type="text" id="firstName" name="firstName" class="form-control"/>	
						</div>
					</div>
					
					<div class="mb-3 row">
						<label for="lastName" class="col-sm-4 col-lg-2 col-form-label">Last Name</label> 
						<div class="col-12 col-sm-8 col-lg-10">
							<form:input path="lastName" type="text" id="lastName" name="lastName" class="form-control"/>	
						</div>
					</div>
					
					<div class="mb-3 row">
						<label for="email" class="col-sm-4 col-lg-2 col-form-label">Email</label> 
						<div class="col-12 col-sm-8 col-lg-10">
							<form:input path="email" type="text" id="email" name="email" class="form-control"/>	
						</div>
					</div>
					
					<div class="row">
						<div class="col">
							<button type="button" class="btn btn-info btn-lg btn-back">Back</button>
						</div>
						
						<div class="col text-end">
							<button type="submit" class="btn btn-primary btn-lg">Update</button>
						</div>
					</div>
				</form:form>
			</div>
		</div>
		
		<script type="text/javascript">
			const btnBack = document.querySelector(".btn-back");
			
			btnBack.addEventListener("click", (event) => {
				window.location.href = "${pageContext.request.contextPath}/admin-dashboard";
			}); 
		</script>
	</body>
</html>