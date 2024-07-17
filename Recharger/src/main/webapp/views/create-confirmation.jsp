<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.mobileplan.model.MobilePlan"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<title>Recharger: Create</title>
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

	<%
	MobilePlan plan = (MobilePlan) request.getAttribute("plan");
	%>

	<%-- Create Confirmation Card --%>
	<div class="card shadow p-3 my-4 bg-body rounded" id="create-confirmation-card">
		<div class="card-body">
			<div class="row" id="create-confirmation-card-row">
				<h3>
					<b>Mobile Plan Created Successfully</b>
				</h3>
				<div class="col-md-6 mt-4">
					<h6><b>Preview of newly created plan</b><h6>

					<div class="card shadow mb-3 rounded" style="width: 22.5rem; height: 12.75rem;">
						<div class="card-body">
							<div class="card-title text-truncate" data-bs-toggle="tooltip" 
								title="<%=plan.getName()%>">
								<h4><b><%=plan.getName()%></b></h4>
							</div>
							<textarea class="border-0 invisible-scrollbar" rows="2" cols="33"
								style="resize: none; border: none; outline: none;" 
								readonly><%=plan.getDescription()%></textarea>
							<hr>
							
							<div class="row">
								<div class="col-md-3">
									<h6><b>ID</b></h6>
								</div>
								<div class="col-md-5">
									<h6><b>Validity</b></h6>
								</div>
								<div class="col-md-4">
									<h6><b>Price</b></h6>
								</div>
							</div>

							<div class="row">
								<div class="col-md-3 text-truncate">
									<i>#<%=plan.getId()%></i>
								</div>
								<div class="col-md-5 text-truncate">
									<i><%=plan.getValidity()%> days</i>
								</div>
								<div class="col-md-4 text-truncate">
									<i>$<%=plan.getPrice()%></i>
								</div>
							</div>
						</div>
					</div>
					
					<div class="d-flex flex-row">
						<form action="create">
							<button type="submit" class="btn btn-dark mt-4"
								data-bs-toggle="tooltip" title="Create another mobile plan">
								Create another Plan
							</button>
						</form>

						<form action="view">
							<button type="submit" class="btn btn-outline-dark mt-4 mx-4"
								data-bs-toggle="tooltip" title="View all the available mobile plans">
								View Available Plans
							</button>
						</form>
					</div>
				</div>

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