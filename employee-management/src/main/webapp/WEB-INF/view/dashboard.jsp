<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Dashboard</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
	</head>
	<body>	
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="container-fluid">
				<h3>Welcome, 
					<span class="text-uppercase">
						<security:authentication property="principal.username"/>
						<security:authentication property="principal.authorities"/>
					</span>
				</h3> 
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
			    	<span class="navbar-toggler-icon"></span>
			    </button>
			    <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
			      <ul class="navbar-nav">
			        <li class="nav-item">
			          <security:authorize access="hasRole('ADMIN')">
						<form:form action="${pageContext.request.contextPath}/admin-dashboard" method="GET">
							<button type="submit" class="btn btn-primary" style="margin-left: 15px; margin-bottom: 10px;">Admin Dashboard</button>
						</form:form>
					</security:authorize>
			        </li>
			        <li class="nav-item">
			        	<form:form action="${pageContext.request.contextPath}/logout"
							method="POST">
							<button type="submit" class="btn btn-primary" style="margin-left: 15px; margin-bottom: 10px;">Logout</button>
						</form:form>
			        </li>
			      </ul>
			    </div>
			</div>
		</nav>
		
		<div class="container" style="margin-top: 45px;">
			
			<div class="row text-center">
				<h1 class="text-primary" style="margin-bottom: 25px; font-size: 45px">Customer List</h1>
			</div>
			<div class="table-responsive">
				<table class="table table-striped" style="margin-bottom: 55px;">
					<thead>
						<tr>
							<th scope="col">Username</th>
							<th scope="col">First Name</th>
							<th scope="col">Last Name</th>
							<th scope="col">Email</th>
							<th scope="col">Money Spent</th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					
					<tbody>
						<c:forEach var="customer" items="${customers}">
							<c:url var="updateLink" value="/updateCustomer">
								<c:param name="customerId" value="${customer.id}"/>
							</c:url>
							
							<c:url var="deleteLink" value="/deleteCustomer">
								<c:param name="customerId" value="${customer.id}"/>
							</c:url>
							
							<tr>
								<td>${customer.username}</td>
								<td>${customer.firstName}</td>
								<td>${customer.lastName}</td>
								<td>${customer.email}</td>
								<td>${customer.moneySpent}</td>
								<td>
									<a href="${updateLink}">Update</a> |
									<a href="${deleteLink}">Delete</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		
			<div class="row">
				<div class="col text-end">
					<form:form method="GET" action="${pageContext.request.contextPath}/add-customer">
						<button type="submit" class="btn btn-primary btn-ln btn-add-customer">Add Customer</button>
					</form:form>
				</div>
			</div>
		</div>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
		<script type="text/javascript">
			
		</script>
	</body>
</html>









