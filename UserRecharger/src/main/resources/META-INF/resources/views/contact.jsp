<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Recharger: Contact</title>
    <link rel="icon" type="image/x-icon" href="../images/favicon.png">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" 
        rel="stylesheet" 
        integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" 
        crossorigin="anonymous">

    <!-- CSS -->
    <link href="../css/about.css" rel="stylesheet">
</head>
<body class="invisible-scrollbar">

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
						<li class="nav-item mx-2"><a class="nav-link text-dark"
							aria-current="page" href="/home">Home</a></li>
						
						<li class="nav-item mx-3"><a class="nav-link text-dark" 
                            href="view">View</a></li>
						<li class="nav-item mx-3"><a class="nav-link bg-dark text-light active"
							href="contact">Contact</a></li>
                     

						<li class="nav-item mx-3"><a class="nav-link text-dark"
							href="about-us">About</a></li>
						<li class="nav-item"><a class="nav-link text-dark">|</a></li>
                        <li class="nav-item mx-3"><a class="nav-link text-dark"
							data-bs-toggle="modal" role="button" href="#logOutModal">Log out</a></li>
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
                        Do you really want to <b>log out</b> of Recharger application?
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
                            data-bs-toggle="tooltip" title="Log out of application">
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

    <%-- About Card --%>
    <div class="card shadow p-3 my-4 bg-body rounded" id="about-card">
        <div class="card-body">
            <h2>
                <b>Contact Us</b>
            </h2>
            <br>

            <div class="row">
                <div class="col-md-8">
                    <div class="card">
                        <div class="card-body">
                         

                            <div class="row">
                                <div class="col-md-7">
                                <br>
                                    <p>
                                        Recharger is an microservice web platform for users to recharge their mobile sim.
                                    </p>
                                </div>

                                <div class="col-md-5">
                                    <img src="../images/about-mobile-plan-isometric.png" 
                                        width="175" height="175">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
				<div class="card mt-4">
    <div class="card-body">
        <h3>
            <b>Developed and Managed By</b>
        </h3>
        <div class="row">
            <div class="col">
                <div class="row">
                    <div class="col-md-4">
                        <img src="../images/profile.jpg" width="150" 
                            height="150" 
                            style="border-radius: 100%; margin-top: 2.50rem; 
                                margin-left: 2rem; border: 2px solid black;">
                    </div>
                    <div class="col-md-8">
                        <h5 class="mt-5"><b>Ninad Shingare</b>
                            <p  style="color: grey; font-size: 15px;">Developer</p>
                        </h5>
                        <br>
                        <div class="row">
                        	<div class="col-6">Contact : +91 8408824429</div>
                                   	 
                        	<div class="col-6">Email : nvshingare67@gmail.com</div>
                        </div>
                        <br>
                        <div class="row">
                        <div class="col-6"><p>Address: H.no.1330, Samartha Nagar, Varde Road, Tal- Kudal, Dist- Sindhudurg, PINCODE- 416812</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" 
        crossorigin="anonymous"></script>
</body>
</html>