<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

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
	<link href="../css/create.css" rel="stylesheet">
</head>
<body>

	<%-- Navigation Bar --%>
	<nav class="navbar navbar-expand-lg mt-2">
		<div class="container">
			<div class="container" style="width: 64rem;">
				<a class="navbar-brand" href="/home"> <img src="../images/recharger_logo1.png"
					alt="Mobile Plan Logo" width="175" height="50" style="border-radius: 10px;">
				</a>
			</div>

			<div class="navbar-nav w-100">
				<div class="navbar-nav">
					<ul class="nav nav-pills nav-fill">
						<li class="nav-item mx-2"><a
							class="nav-link text-dark" aria-current="page"
							href="/home">Home</a></li>
						<li class="nav-item mx-3"><a class="nav-link bg-dark text-light active"
							href="create">Create</a></li>
						<li class="nav-item mx-3"><a class="nav-link text-dark"
							href="view">View</a></li>

						<%
						Object admin = request.getAttribute("admin");
						%>

						<%
						if (admin.equals("true")) {
						%>
						<li class="nav-item mx-3"><a class="nav-link text-dark"
							role="button"
							href="http://localhost:8081/view-logs">Logs</a></li>
						<%
						}
						%>

						<%
						if (admin.equals("false")) {
						%>
						<li class="nav-item mx-3"><a class="nav-link text-dark"
							data-bs-toggle="modal" role="button" href="#logsModal">Logs</a></li>
						<%
						}
						%>
						<li class="nav-item mx-3"><a class="nav-link text-dark"
							href="contact">Contact</a></li>
						<li class="nav-item mx-3"><a class="nav-link text-dark"
							href="about-us">About</a></li>
						<li class="nav-item"><a class="nav-link text-dark">|</a></li>
						<li class="nav-item mx-3"><a class="nav-link text-dark"
							data-bs-toggle="modal" role="button" href="#logOutModal">
							Log out</a></li>		
					</ul>
				</div>
			</div>
		</div>
	</nav>

	<!-- Log Out Modal -->
    <div class="modal fade" id="logOutModal" 
        aria-hidden="true" tabindex="-1" aria-labelledby="logOutModalLabel">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="logOutModalLabel">
                        <b>Warning</b>
                    </h5>
                    <button type="button" class="btn-close" 
                        data-bs-dismiss="modal" aria-label="Close">
                    </button>
                </div>
                <div class="modal-body">
                    <p>
                        Do you really want to <b>log out</b> of mobile plan application?
                    </p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-dark"
                        data-bs-dismiss="modal"
                        data-bs-toggle="tooltip" title="Go back to application">
                        Close
                    </button>
                    <form action="\">
                        <button type="submit" class="btn btn-outline-danger"
                            data-bs-toggle="tooltip" title="Delete this plan">
                            Log Out
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>

	<!-- Logs Modal -->
    <div class="modal fade" id="logsModal" 
        aria-hidden="true" tabindex="-1" aria-labelledby="logOutModalLabel">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="logOutModalLabel">
                        <b>Warning</b>
                    </h5>
                    <button type="button" class="btn-close" 
                        data-bs-dismiss="modal" aria-label="Close">
                    </button>
                </div>
                <div class="modal-body">
                    <p>
						You'll be asked to enter admin <b>username</b> and <b>password</b> for 
						authentication purpose.
					</p>
					<p>
                        This is an <b>restricted</b> feature for normal user.
						Only <b>admin</b> can access this section.
                    </p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-dark"
                        data-bs-dismiss="modal"
                        data-bs-toggle="tooltip" title="Go back to application">
                        Close
                    </button>
                    <form action="/admin">
                        <button type="submit" class="btn btn-outline-primary"
                            data-bs-toggle="tooltip" title="Go to Logs">
                            Go to Logs
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>

	<%-- Create Card --%>
	<div class="card shadow p-3 my-4 bg-body rounded" id="create-card">
		<div class="card-body">
			<h2>
				<b>Create a Mobile Plan</b>
			</h2>

			<div class="row" id="create-card-row">
				<div class="col-md-6">
					<br>
					<form action="/insert" method="POST" class="needs-validation" novalidate>
						<div class="form-group" style="display: none">
							<input type="number" class="form-control" name="id" value="0">
						</div>

						<div class="form-group position-relative">
							<label  class="form-label">
								<b>Name</b><b style="color: red;"> *</b></label>
							<input type="text" class="form-control mb-2" 
								placeholder="Enter Plan Name" minlength="1" maxlength="100"
								name="name" required autofocus>
							<div class="invalid-tooltip">
								Please provide a plan name
							</div>
						</div>
						
						<div class="row">
							<div class="col position-relative">
								<label class="form-label"><b>Price</b>
									<b style="color: red;"> *</b>
								</label>
								<div class="input-group mb-2" style="height: 2.4rem;">
									<span class="input-group-text mb-3">Rs.</span> 
									<input type="number" class="form-control mb-3" name="price" 
										placeholder="Enter Price" min="1" max="2147483647" required>
									<div class="invalid-tooltip rounded">
										Please provide plan price (Only numbers allowed)
									</div>
									<span class="input-group-text mb-3">.00</span>
								</div>
							</div>

							<div class="col position-relative">
								<div class="form-group">
									<label class="form-label"><b>Validity</b>
										<b style="color: red;"> *</b>
									</label>
									<div class="input-group mb-2" style="height: 2.4rem;">
										<input type="number" onfocus="" class="form-control mb-3" 
											placeholder="Enter Validity" name="validity" min="1" 
											max="2147483647" required>
										<div class="invalid-tooltip rounded">
											Please provide plan validity (Only numbers allowed)
										</div>
										<span class="input-group-text mb-3">days</span>
									</div>
								</div>
							</div>
						</div>

						<div class="form-group position-relative">
							<label class="form-label"><b>Description</b>
								<b style="color: red;"> *</b>
							</label>
							<textarea class="form-control" rows="2" name="description" 
								style="resize: none;" minlength="1" maxlength="200"
								placeholder="Enter Plan Description" required></textarea>
							<div class="invalid-tooltip">
								Please provide a plan description
							</div>
						</div>

						<button type="submit" class="btn btn-dark mt-4" data-bs-toggle="tooltip"
							title="Submit details and create a new mobile plan">
							Create a Plan
						</button>
					</form>

					<%-- JS Code: Create Form Validation --%>
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
				</div>

				<div class="col-md-6">
					<img src="../images/create-isometric.png" width="300"
						height="310" style="margin-left: 4rem;">
				</div>
			</div>
		</div>
	</div>

	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>

	<!-- Popper JS -->
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