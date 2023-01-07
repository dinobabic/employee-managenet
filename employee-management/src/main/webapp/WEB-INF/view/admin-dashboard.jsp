<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
		<title>Admin Dashboard</title>
		</head>
	<body>
		<div class="container" style="margin-top: 150px">
			<h1 style="margin-bottom: 25px; text-align: center; font-size: 45px;" class="text-primary">Employee List</h1>
			<table class="table table-striped">
				<thead>
					<tr>
						<th scope="col">Username</th>
						<th scope="col">First Name</th>
						<th scope="col">Last Name</th>
						<th scope="col">Email</th>
						<th scope="col">Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="user" items="${users}">
						<c:url var="updateLink" value="/employee/updateEmployee">
							<c:param name="userId" value="${user.id}"/>
						</c:url>
						
						<c:url var="deleteLink" value="/employee/deleteEmployee">
							<c:param name="userId" value="${user.id}"/>
						</c:url>
					
						<tr>
							<td>${user.username}</td>
							<td>${user.firstName}</td>
							<td>${user.lastName}</td>
							<td>${user.email}</td>	
							<td>
								<a href="${updateLink}">Update</a> | 
								<a href="${deleteLink}">Delete</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<div class="row">
				<div class="text-center">
					<button type="button" class="btn btn-primary btn-lg btn-back" style="padding-left: 35px; padding-right: 35px">Back</button>
				</div>
			</div>
		</div>
		
		<script type="text/javascript">
			const btnBack = document.querySelector(".btn-back");
			
			btnBack.addEventListener("click", (event) => {
				window.location.href = "${pageContext.request.contextPath}/successLogin"
			});
		</script>
	</body>
</html>