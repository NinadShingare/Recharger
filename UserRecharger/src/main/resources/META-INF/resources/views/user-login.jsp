<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.example.demo.entity.Plan"%>
<%@ page import="com.example.demo.entity.User"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<title>Recharger: User Login</title>
	<link rel="icon" type="image/x-icon" href="../images/favicon.png">

	<!-- Bootstrap CSS -->
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
		crossorigin="anonymous">
	
	<%-- Bootstrap JS --%>
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" 
		integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" 
		crossorigin="anonymous"></script></head>

	<!-- CSS -->
	<link href="../css/user-login.css" rel="stylesheet">
</head>
<body>

	<%-- Navigation Bar --%>
	<nav class="navbar navbar-expand-lg mt-2">
		<div class="container">
			<div class="container">
				<a class="navbar-brand" href="/"> <img src="../images/recharger_logo1.png"
					alt="Mobile Plan Logo" width="175" height="50" style="border-radius: 10px;">
				</a>
			</div>
		</div>
	</nav>

	<%
	Object msg = request.getAttribute("msg");
	%>

	<%-- User Login Card --%>
	<div class="card shadow p-3 my-4 bg-body rounded" id="user-login-card">
		<div class="card-body">
			<div class="row" id="user-login-card-row">
				<div class="col-md-6 p-4">
					<h1>
						<b>User Login</b>
                    </h1>
					<br>
					<form action="/verify" method="POST" class="needs-validation" novalidate>
						<label  class="form-label">
							<b>Username</b><b style="color: red;"> *</b></label>
						<div class="input-group mb-3" style="width: 25rem;">
							<input type="text" class="form-control rounded" 
								placeholder="Enter your username" name="username"
								aria-label="Username" aria-describedby="basic-addon1" required 
								autofocus>
							<div class="invalid-tooltip">
								Please provide an username
							</div>
						</div>

						<label  class="form-label">
							<b>Password</b><b style="color: red;"> *</b></label>
						<div class="input-group mb-3" style="width: 25rem;">
							<input type="password" class="form-control rounded" 
								placeholder="Enter your password" name="password"
								aria-label="Username" aria-describedby="basic-addon1" required>
							<div class="invalid-tooltip">
								Please provide a password
							</div>
						</div>

						<button type="submit" class="btn btn-dark mt-4"
							data-bs-toggle="tooltip" title="Login to Mobile Plan Application"
							style="width: 10rem;">
							Login
						</button>
                    </form>
                    <!-- Add a link to the registration page -->
		            <p class="mt-3">
		                Don't have an account? 
		                <a href="/register" class="text-decoration-none">Register here</a>
		            </p>
				</div>

				<%
				if (msg.equals("USERNAME")) {
				%>

				<div class="modal fade" id="errorModal" tabindex="-1"
					role="dialog" aria-labelledby="errorModalLabel"
					aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="errorModalLabel">
									<b>Incorrect Username</b>
								</h5>
								<button type="button" class="btn-close" 
									data-bs-dismiss="modal" aria-label="Close">
								</button>
							</div>
							<div class="modal-body">
								Looks like you've entered your <b>username</b> incorrectly.
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-danger" 
									data-bs-dismiss="modal" aria-label="Close">Close
								</button>
							</div>
						</div>
					</div>
				</div>

				<script>
					var errorModal = new bootstrap.Modal(document.getElementById('errorModal'), {})
  					errorModal.show()
				</script>

				<%
				}
				%>

				<%
				if (msg.equals("PASSWORD")) {
				%>

				<div class="modal fade" id="errorModal" tabindex="-1"
					role="dialog" aria-labelledby="errorModalLabel"
					aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="errorModalLabel">
									<b>Incorrect Password</b>
								</h5>
								<button type="button" class="btn-close" 
									data-bs-dismiss="modal" aria-label="Close">
								</button>
							</div>
							<div class="modal-body">
								Looks like you've entered your <b>password</b> incorrectly.
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-danger" 
									data-bs-dismiss="modal" aria-label="Close">Close
								</button>
							</div>
						</div>
					</div>
				</div>

				<script>
					var errorModal = new bootstrap.Modal(document.getElementById('errorModal'), {})
  					errorModal.show()
				</script>

				<%
				}
				%>

				<%
				if (msg.equals("BOTH")) {
				%>

				<div class="modal fade" id="errorModal" tabindex="-1"
					role="dialog" aria-labelledby="errorModalLabel"
					aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="errorModalLabel">
									<b>Incorrect Username and Password</b>
								</h5>
								<button type="button" class="btn-close" 
									data-bs-dismiss="modal" aria-label="Close">
								</button>
							</div>
							<div class="modal-body">
								Looks like you've entered both your <b>username</b> as well as 
								<b>password</b> incorrectly.
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-danger" 
									data-bs-dismiss="modal" aria-label="Close">Close
								</button>
							</div>
						</div>
					</div>
				</div>

				<script>
					var errorModal = new bootstrap.Modal(document.getElementById('errorModal'), {})
  					errorModal.show()
				</script>

				<%
				}
				%>

				<div class="col-md-6">
					<img src="../images/login-isometric.jpeg" width="375" height="382.5">
				</div>
			</div>
		</div>
	</div>

	<%-- JS Code: Login Form Validation --%>
	<script>
		(() => {
			'use strict'

			const forms = document.querySelectorAll('.needs-validation')

			Array.from(forms).forEach(form => {
				form.addEventListener('submit', event => {
				if (!form.checkValidity()) {
					event.preventDefault()
					event.stopPropagation()
				}

				form.classList.add('was-validated')
				}, false)
			})
			})()
	</script>

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