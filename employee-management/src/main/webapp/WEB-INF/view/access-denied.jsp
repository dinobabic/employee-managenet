<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Access Denied</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
	</head>
	<body>
		<div class="container">
			<div class="alert alert-danger text-center" role="alert" style="margin-top: 50px">
				<h1>WARNING: You are not allowed to view this page!</h1>
			</div>
			
			<div class="text-center">
				<button type="button" class="btn btn-danger btn-lg btn-back">Back</button>
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