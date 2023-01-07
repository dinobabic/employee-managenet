<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Update Customer</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
	</head>
	<body>
		<div class="container" style="margin-top: 45px">
			<div class="card">
				<h1 class="card-header text-center text-primary" style="font-size: 45px;">Update Customer</h1>
				<div class="card-body">
					<form:form action="${pageContext.request.contextPath}/saveCustomer" method="POST" modelAttribute="customer">
						<form:hidden path="id"/>
						
						<div class="mb-3 row">
							<label for="username" class="col-sm-4 col-lg-2 col-form-label">Username</label> 
							<div class="col-12 col-sm-8 col-lg-10">
								<form:input path="username" type="text" id="username" name="username" class="form-control"/>	
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
						
						<div class="mb-3 row">
							<label for="moneySpent" class="col-sm-4 col-lg-2 col-form-label">Money Spent</label> 
							<div class="col-12 col-sm-8 col-lg-10">
								<form:input path="moneySpent" type="text" id="moneySpent" name="moneySpent" class="form-control"/>	
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
		</div>
		
		<script type="text/javascript">
			const btnBack = document.querySelector(".btn-back");
			
			btnBack.addEventListener("click", (event) => {
				window.location.href = "${pageContext.request.contextPath}/successLogin";
			}); 
		</script>
	</body>
</html>

