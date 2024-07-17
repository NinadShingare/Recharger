<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.example.demo.entity.Plan"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<title>Recharger: Select</title>
	<link rel="icon" type="image/x-icon" href="../images/favicon.png">

	<!-- Bootstrap CSS -->
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
		crossorigin="anonymous">

	<!-- CSS -->
	<link href="../css/create-confirmation.css" rel="stylesheet">
</head>
<body>

	<%-- Navigation Bar --%>
	<nav class="navbar navbar-expand-lg mt-2">
		<div class="container">
			<div class="container">
				<a class="navbar-brand" href="/home"> <img src="../images/recharger_logo1.png"
					alt="Mobile Plan Logo" width="175" height="50" style="border-radius: 10px;">
				</a>
			</div>
		</div>
	</nav>


	<div class="card shadow p-3 my-4 bg-body rounded" id="create-confirmation-card">
		<div class="card-body">
			<div class="row" id="create-confirmation-card-row">
				<h3>
					<b>Mobile Plan Selected Successfully</b>
				</h3>
				

				<div class="col-md-6">
					<img src="../images/create-confirmation-vector.png" width="350" height="300"
						style="margin-left: 2rem;">
				</div>
			</div>
		</div>
	</div>

	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>

	<!-- Popper.js -->
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
		crossorigin="anonymous"></script>
</body>
</html>