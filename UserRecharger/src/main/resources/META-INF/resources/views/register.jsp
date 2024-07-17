<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.example.demo.entity.Plan"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<title>Mobile Plan: User Registration</title>
	<link rel="icon" type="image/x-icon" href="../images/favicon.png">

	<!-- Bootstrap CSS -->
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
		crossorigin="anonymous">
	
	<!-- Bootstrap JS -->
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" 
		integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" 
		crossorigin="anonymous"></script>

  	
	<!-- CSS -->
	<link href="../css/user-register.css" rel="stylesheet">
</head>
<body>

	<%-- Navigation Bar --%>
	<nav class="navbar navbar-expand-lg mt-2">
		<div class="container">
			<div class="container">
				<a class="navbar-brand" href="/"> <img src="../images/seekers-logo.png"
					alt="Mobile Plan Logo" width="175" height="50" style="border-radius: 10px;">
				</a>
			</div>
		</div>
	</nav>

	<%
	Object msg = request.getAttribute("msg");
	%>
	<%
				if (msg.equals("USERNAME_EXISTS")) {
				%>
				<div class="alert alert-danger" role="alert">
                        The provided username is already in use. Please choose a different one.
                </div>
    <%
				}
	%>      
	<%-- User Registration Card --%>
	<div class="card shadow p-3 my-4 bg-body rounded" id="user-register-card">
		<div class="card-body">
			<div class="row" id="user-register-card-row">
				<div class="col-md-6 p-4">
					<h1>
						<b>User Registration</b>
                    </h1>
					<br>
					<form action="/register" method="POST" class="needs-validation" novalidate>
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
							<b>Contact</b><b style="color: red;"> *</b></label>
						<div class="input-group mb-3" style="width: 25rem;">
							<input type="number" class="form-control rounded" 
								placeholder="Enter your Contact number" name="contact"
								aria-label="Contact" aria-describedby="basic-addon1" required>
							<div class="invalid-tooltip">
								Please provide a contact
							</div>
						</div>
						
						<label  class="form-label">
							<b>Email</b><b style="color: red;"> *</b></label>
						<div class="input-group mb-3" style="width: 25rem;">
							<input type="email" class="form-control rounded" 
								placeholder="Enter your Email" name="email"
								aria-label="Email" aria-describedby="basic-addon1" required>
							<div class="invalid-tooltip">
								Please provide a Email
							</div>
						</div>
						
						<label  class="form-label">
							<b>Password</b><b style="color: red;"> *</b></label>
						<div class="input-group mb-3" style="width: 25rem;">
							<input type="password" class="form-control rounded" 
								placeholder="Enter your password" name="password"
								aria-label="Password" aria-describedby="basic-addon1" required>
							<div class="invalid-tooltip">
								Please provide a password
							</div>
						</div>
						
						<label  class="form-label">
							<b>Confirm Password</b><b style="color: red;"> *</b></label>
						<div class="input-group mb-3" style="width: 25rem;">
							<input type="password" class="form-control rounded" 
								placeholder="Confirm your password" name="c_password"
								aria-label="Password" aria-describedby="basic-addon1" required>
							<div class="invalid-tooltip">
								Please provide similar password
							</div>
						</div>
						<button type="submit" class="btn btn-dark mt-4"
							data-bs-toggle="tooltip" title="Register to Mobile Plan Application"
							style="width: 10rem;">
							Register
						</button>
                    </form>
                    <!-- Add a link to the login page -->
		            <p class="mt-3">
		                Already have a account? 
		                <a href="/" class="text-decoration-none">Login here</a>
		            </p>
				</div>

				<%
				if (msg.equals("USERNAME_EXISTS")) {
				%>
				<div class="alert alert-danger" role="alert">
                        The provided username is already in use. Please choose a different one.
                </div>
				<div class="modal fade" id="errorModal" tabindex="-1"
					role="dialog" aria-labelledby="errorModalLabel"
					aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="errorModalLabel">
									<b>Username Already Exists</b>
								</h5>
								<button type="button" class="btn-close" 
									data-bs-dismiss="modal" aria-label="Close">
								</button>
							</div>
							<div class="modal-body">
								The provided <b>username</b> is already in use. Please choose a different one.
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

	<%-- JS Code: Registration Form Validation --%>
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
			  	<script>
    (() => {
        'use strict';

        const forms = document.querySelectorAll('.needs-validation');

        Array.from(forms).forEach((form) => {
            form.addEventListener('submit', (event) => {
                const passwordInput = form.querySelector('input[name="password"]');
                const confirmPasswordInput = form.querySelector('input[name="c_password"]');

                if (passwordInput.value !== confirmPasswordInput.value) {
                    event.preventDefault();
                    event.stopPropagation();
                    alert('Password and Confirm Password must match.');
                } else if (!form.checkValidity()) {
                    event.preventDefault();
                    event.stopPropagation();
                }

                form.classList.add('was-validated');
            }, false);
        });
    })();
</script>
<script>
    (() => {
        'use strict';

        const forms = document.querySelectorAll('.needs-validation');

        Array.from(forms).forEach((form) => {
            form.addEventListener('submit', (event) => {
                const contactInput = form.querySelector('input[name="contact"]');
                const contactValue = contactInput.value;

                // Check if contact has exactly 10 digits
                if (!/^\d{10}$/.test(contactValue)) {
                    event.preventDefault();
                    event.stopPropagation();
                    alert('Contact number must be exactly 10 digits.');
                } else if (!form.checkValidity()) {
                    event.preventDefault();
                    event.stopPropagation();
                }

                form.classList.add('was-validated');
            }, false);
        });
    })();
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

