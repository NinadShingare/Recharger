<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="com.mobileplan.model.MobilePlan"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<title>Recharger: View</title>
	<link rel="icon" type="image/x-icon" href="../images/favicon.png">

	<!-- Bootstrap CSS -->
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
		crossorigin="anonymous">

	<!-- CSS -->
	<link rel="stylesheet" href="../css/view.css">
</head>
<body id="view-page" class="invisible-scrollbar">

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
							href="create">Create</a></li>
						<li class="nav-item mx-3"><a class="nav-link bg-dark text-light active" 
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

	<%
	List<MobilePlan> plans = (List<MobilePlan>) request.getAttribute("plans");
	%>

	<div class="row mt-3" id="view-card-row">

		<%-- Options Card --%>
		<div class="card shadow mb-3 bg-body rounded" id="options-card">
			<div class="card-body">
				<div class="row">
					<div class="col-md-7">
						<h2>
							<b>Showing Available Plans</b>
						</h2>
					</div>

					<div class="col-md-5 d-flex flex-row-reverse py-1">
						<button class="btn btn-outline-danger mb-3 mx-2" type="button" 
							id="select-open"
							data-bs-toggle="tooltip" title="Select & Delete multiple Plans">
							Delete Multiple Plans
						</button>

						<form action="javascript:searchField()">
							<select class="form-select mb-3 mx-2" name="searchBy" id="searchCategory"
								onchange="this.form.submit()" style="width: 8.5rem;" 
								data-bs-toggle="tooltip" title="Select search by category" required>
								<option value="" disabled selected>Search by</option>
								<option value="ID">ID</option>
								<option value="Name">Name</option>
								<option value="Validity">Validity</option>
								<option value="Price">Price</option>
							</select>
						</form>
					</div>
				</div>
			</div>
		</div>

		<%-- Options Card: Select --%>
		<div class="card shadow mb-3 bg-body rounded" id="select-card"
			style="display: none; height: 5rem;">
			<div class="card-body">
				<div class="row py-1">
					<div class="col" style="height: 2.5rem;">
						<h5 class="mt-2" id="ElementCount"><b>Select Plans which you want to 
							delete</b></h5>
					</div>

					<div class="col d-flex flex-row-reverse" style="height: 2.4rem;">
						<button type="button" class="btn btn-outline-danger mx-2" id="select-close"
							data-bs-toggle="tooltip" title="Close or Undo the selections">
							Close 
						</button>

						<button data-bs-toggle="modal" id="selectDeleteBtn"
							data-bs-target="#deleteMultipleModal" data-bs-toggle="tooltip"
							class="btn btn-outline-danger" title="Delete selected plan">
							Delete
						</button>
					</div>
				</div>
			</div>

			<!-- Mobile Plan: Multiple Delete Modal -->
			<div class="modal fade" id="deleteMultipleModal"
				tabindex="-1" aria-labelledby="deleteMultipleModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="deleteMultipleModalLabel">
								<b>Warning</b>
							</h5>
							<button type="button" class="btn-close" 
								data-bs-dismiss="modal" aria-label="Close">
							</button>
						</div>
						<div class="modal-body">
							<img src="../images/delete-icon.png" alt="Delete Message Icon"
								width="160" height="165" style="margin-left: 9rem;"> <br>
							<br>
							<p style="margin-left: 2rem;">
								Do you really want to <b>delete</b> selected mobile plans?
							</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-outline-dark" 
								data-bs-dismiss="modal">Close
							</button>
							<form id="deleteBtn" action="/deleteItems/" method="POST">
								<input id="inputList" type="text" name="inputVal"
									style="display: none;">
								<button type="submit" form="deleteBtn" class="btn btn-outline-danger"
									data-bs-toggle="tooltip" title="Delete selected plans">
									Delete
								</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>


		<%-- Options Card: Search --%>
		<div class="card shadow mb-3 bg-body rounded" id="search-card"
			style="display: none; height: 5rem;">
			<div class="card-body">
				<div class="row py-1">
					<div class="col-md-4" style="height: 2.5rem; margin-top: 0.4rem;">
						<h5><b>Search Mobile Plans</b></h5>
					</div>

					<div class="col-md-8 d-flex flex-row-reverse" style="height: 2.4rem;">
						<button type="button" class="btn btn-outline-danger mx-2" id="search-close"
							data-bs-toggle="tooltip" title="Close search options">
							Close
						</button>

						<%-- Options Card: Search: Name Field --%>
						<form action="searchPlan" method="GET" role="search" 
							class="needs-validation" novalidate id="alpha" style="display: none;">

							<div class="d-flex">

								<div class="position-relative" style="height: 2.4rem;">
									<input class="form-control mb-3" type="text" name="keyword"
										placeholder="Search by Name" style="width: 15rem;" 
										minlength="1" maxlength="100" required autofocus
										id="nameInput" onkeyup="nameFunction()">
									<div class="invalid-tooltip">
										Please provide a plan name
									</div>
								</div>

								<button class="btn btn-outline-danger mb-3 mx-2" type="button" 
									id="search-select-open"
									data-bs-toggle="tooltip" title="Select & Delete multiple Plans">
									Delete Multiple Plans
								</button>

								<input class="form-control" type="text" name="searchBy" value="Name"
									style="display: none;">
							
								<button class="btn btn-dark mb-3 mx-2" type="submit"
									data-bs-toggle="tooltip" title="Search within available plans"
									style="display: none;">
									Search
								</button>
							</div>
						</form>

						<%-- Options Card: Search: ID Field --%>
						<form action="searchPlan" method="GET" role="search" 
							class="needs-validation" novalidate id="ID" style="display: none;">

							<div class="d-flex">
								<div class="position-relative" style="height: 2.4rem;">
									<input class="form-control mb-3" type="number" name="keyword"
										placeholder="Search by ID" min="1" max="2147483647" 
										style="width: 15rem;" required autofocus
										id="idInput" onkeyup="idFunction()">
									<div class="invalid-tooltip">
										Please provide a numeric value above 0
									</div>
								</div>

								<button class="btn btn-outline-danger mb-3 mx-2" type="button" 
									id="search-num-select-open"
									data-bs-toggle="tooltip" title="Select & Delete multiple Plans">
									Delete Multiple Plans
								</button>

								<input class="form-control" type="text" name="searchBy" id="numeric" 
									value="" style="display: none;">
								
								<button class="btn btn-dark mb-3 mx-2" type="submit"
									data-bs-toggle="tooltip" title="Search within available plans"
									style="display: none;">
									Search
								</button>
							</div>
						</form>

						<%-- Options Card: Search: Validity Field --%>
						<form action="searchPlan" method="GET" role="search" 
							class="needs-validation" novalidate id="VALIDITY" style="display: none;">

							<div class="d-flex">
								<div class="position-relative" style="height: 2.4rem;">
									<input class="form-control mb-3" type="number" name="keyword"
										placeholder="Search by Validity" min="1" max="2147483647" 
										style="width: 15rem;" required autofocus
										id="validityInput" onkeyup="validityFunction()">
									<div class="invalid-tooltip">
										Please provide a numeric value above 0
									</div>
								</div>

								<button class="btn btn-outline-danger mb-3 mx-2" type="button" 
									id="search-num-select-open"
									data-bs-toggle="tooltip" title="Select & Delete multiple Plans">
									Delete Multiple Plans
								</button>

								<input class="form-control" type="text" name="searchBy" id="numeric" 
									value="" style="display: none;">
								
								<button class="btn btn-dark mb-3 mx-2" type="submit"
									data-bs-toggle="tooltip" title="Search within available plans"
									style="display: none;">
									Search
								</button>
							</div>
						</form>

						<%-- Options Card: Search: Price Field --%>
						<form action="searchPlan" method="GET" role="search" 
							class="needs-validation" novalidate id="PRICE" style="display: none;">

							<div class="d-flex">
								<div class="position-relative" style="height: 2.4rem;">
									<input class="form-control mb-3" type="number" name="keyword"
										placeholder="Search by Price" min="1" max="2147483647" 
										style="width: 15rem;" required autofocus
										id="priceInput" onkeyup="priceFunction()">
									<div class="invalid-tooltip">
										Please provide a numeric value above 0
									</div>
								</div>

								<button class="btn btn-outline-danger mb-3 mx-2" type="button" 
									id="search-num-select-open"
									data-bs-toggle="tooltip" title="Select & Delete multiple Plans">
									Delete Multiple Plans
								</button>

								<input class="form-control" type="text" name="searchBy" id="numeric" 
									value="" style="display: none;">
								
								<button class="btn btn-dark mb-3 mx-2" type="submit"
									data-bs-toggle="tooltip" title="Search within available plans"
									style="display: none;">
									Search
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

		<%
		for (MobilePlan plan : plans) {
		%>

		<%-- Mobile Plan Details Card --%>
		<div class="col-md-4 justify-content-center" id="c<%=plan.getId()%>">
			<div class="card shadow mb-3 rounded" style="border: 1px solid black;"
				id="<%=plan.getId()%>" onclick="deletePlan(<%=plan.getId()%>)">
				<img src="../images/plan-details-isometric-image.png" class="card-img-top" 
					alt="Currency Image" height="175">
				<div class="card-body">
					<h4 class="card-title text-truncate" data-bs-toggle="tooltip" 
						title="<%=plan.getName()%>">
						<b><%=plan.getName()%></b>
					</h4>

					<textarea class="border-0 invisible-scrollbar" rows="2" cols="30"
						style="resize: none; border: none; outline: none;" 
						readonly><%=plan.getDescription()%></textarea>
					<hr>
					<div class="row">
						<div class="col-md-3 text-center text-truncate">
							<h6>
								<b>ID</b>
							</h6>
							<h6>
								<i>#<%=plan.getId()%></i>
							</h6>
						</div>
						<div class="col-md-5 text-center text-truncate">
							<h6>
								<b>Validity</b>
							</h6>
							<h6>
								<i><%=plan.getValidity()%> days</i>
							</h6>
						</div>
						<div class="col-md-4 text-center text-truncate">
							<h6>
								<b>Price</b>
							</h6>
							<h6>
								<i>Rs.<%=plan.getPrice()%></i>
							</h6>
						</div>
					</div>
					<br>
					<button data-bs-toggle="modal"
						data-bs-target="#updateModal<%=plan.getId()%>" type="button" 
						class="btn btn-dark mx-4" data-bs-toggle="tooltip" title="Update this plan">
						Update
					</button>

					<button data-bs-toggle="modal"
						data-bs-target="#deleteModal<%=plan.getId()%>" data-bs-toggle="tooltip"
						class="btn btn-outline-danger" title="Delete this plan">
						Delete
					</button>
				</div>
			</div>
		</div>

		<!-- Mobile Plan Details Card: Delete Modal -->
		<div class="modal fade centered" id="deleteModal<%=plan.getId()%>"
			tabindex="-1" aria-labelledby="deleteModalLabel"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="deleteModalLabel">
							<b>Warning</b>
						</h5>
						<button type="button" class="btn-close" 
							data-bs-dismiss="modal" aria-label="Close">
						</button>
					</div>
					<div class="modal-body">
						<img src="../images/delete-icon.png" alt="Delete Message Icon"
							width="160" height="165" style="margin-left: 9rem;"> <br>
						<br>
						<p style="margin-left: 5rem;">
							Do you really want to <b>delete</b> this item?
						</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-outline-dark" 
							data-bs-dismiss="modal">Close
						</button>
						<form action="/delete/<%=plan.getId()%>" method="GET">
							<button type="submit" class="btn btn-outline-danger">Delete</button>
						</form>
					</div>
				</div>
			</div>
		</div>

		<!-- Mobile Plan Details Card: Update Modal -->
		<div class="modal fade centered" id="updateModal<%=plan.getId()%>"
			tabindex="-1" aria-labelledby="updateModalLabel"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header text-center">
						<h5 class="modal-title" id="updateModalLabel">
							<b>Update Plan</b>
						</h5>
						<button type="button" class="btn-close" 
							data-bs-dismiss="modal" aria-label="Close">
						</button>
					</div>
					<form action="/update" method="POST" class="needs-validation" novalidate>
						<div class="modal-body">

							<div class="row">
								<div class="col">
									<div class="form-group">
										<label for="recipient-name" class="col-form-label">
											<b>ID</b></label>
										<input type="Number" value="<%=plan.getId()%>" name="id"
											class="form-control" id="recipient-name" readonly>
									</div>
								</div>

								<div class="col">
									<div class="form-group">
										<label for="recipient-name" class="col-form-label">
											<b>Name</b><b style="color: red;"> *</b>
										</label>
										<input type="text" class="form-control" id="recipient-name"
											name="name" value="<%=plan.getName()%>" 
											minlength="1" maxlength="100" required>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col">
									<div class="form-group">
										<label class="col-form-label"><b>Price</b>
										<b style="color: red;"> *</b></label>
										<div class="input-group">
											<span class="input-group-text">Rs.</span> 
											<input type="number" class="form-control" name="price" 
												min="1" max="2147483647" id="recipient-name"
												value="<%=plan.getPrice()%>" required> <span
												class="input-group-text">.00</span>
										</div>
									</div>
								</div>

								<div class="col">
									<div class="form-group">
										<label class="col-form-label"><b>Validity</b>
										<b style="color: red;"> *</b></label>
										<div class="input-group">
											<input type="number" class="form-control" name="validity"
												id="recipient-name" min="1" max="2147483647" 
												value="<%=plan.getValidity()%>" required>
											<span class="input-group-text">days</span>
										</div>
									</div>
								</div>
							</div>

							<div class="form-group">
								<label for="message-text" class="col-form-label">
									<b>Description</b><b style="color: red;"> *</b>
								</label>
								<input class="form-control" id="message-text" name="description"
									value="<%=plan.getDescription()%>"
									minlength="1" maxlength="200" required>
							</div>
						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-outline-dark" 
								data-bs-dismiss="modal">
								Close
							</button>
							<button type="submit" class="btn btn-outline-success">Update</button>
						</div>

						<%-- JS Code: Update Form Validation --%>
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
					</form>
				</div>
			</div>
		</div>

		<%
		}
		%>

		<%
		Object msg = request.getAttribute("msg");
		%>

		<%
		if (msg.equals("SHOW")) {
		%>

		<form action="view">
			<button type="submit" class="btn btn-dark" id="showAll" style="width: 9rem;">
				Show all plans
			</button>
		</form>

		<%
		}
		%>

		<%
		if (plans.isEmpty()) {
		%>

		<%-- Empty Card --%>
		<div class="card shadow mb-3 bg-body rounded" id="empty-card">
			<div class="card-body">
				<img src="../images/no-data-found.jpg" alt="No Data Found Image"
					width="240" height="240" style="margin-left: 21.5rem;"> <br>
				<br>
				<h3 style="margin-left: 23rem;">
					<b>No Plan Found</b>
				</h3>
			</div>
		</div>

		<script>
			document.getElementById("select-open").style.display = "none";
			document.getElementById("showAll").style.display = "none";
		</script>

		<%
		}
		%>
	</div>

	<!-- Multiple Delete Functionality JavaScript Code -->

	<script>
		let selectOption = false;
		let deleteBtn = document.getElementById("deleteBtn");
		let selectDeleteBtn = document.getElementById("selectDeleteBtn");
		deleteBtn.style.opacity = "0%";
		selectDeleteBtn.style.opacity = "0%";
		
		// JavaScript for Select and Search Options Card
		document.getElementById("select-open").onclick = function() {
			document.getElementById("options-card").style.display = "none";
			document.getElementById("select-card").style.display = "block";
			document.getElementById("search-card").style.display = "none";
			selectOption = true;	
		}

		document.getElementById("search-select-open").onclick = function() {
			document.getElementById("search-card").style.display = "none";
			document.getElementById("select-card").style.display = "block";
			selectOption = true;	
		}

		document.getElementById("search-num-select-open").onclick = function() {
			document.getElementById("search-card").style.display = "none";
			document.getElementById("select-card").style.display = "block";
			selectOption = true;	
		}

		document.getElementById("select-close").onclick = function() {
			document.getElementById("select-card").style.display = "none";
			document.getElementById("options-card").style.display = "block";
			document.getElementById("search-card").style.display = "none";
			selectOption = false;
			window.location.reload();
			undoSelect();
		}

		document.getElementById("search-close").onclick = function() {
			document.getElementById("search-card").style.display = "none";
			document.getElementById("options-card").style.display = "block";
			document.getElementById("select-card").style.display = "none";
			window.location.reload();
		}
			
		// Array for ids
		let inputEntity = [];
		// function for delete Plans by selecting ids
		function deletePlan(entityId) {
			let divObj;
			
			// geting input Box
			let inputBtn = document.getElementById("inputList");
			
			// Para: Select 1 Element 
			let para = document.getElementById("ElementCount");
			
			// Select Button : True/False
			if( selectOption ){
				
				// Validate
				if (!inputEntity.includes(entityId)) {
					// divObj for plan details card
					divObj = document.getElementById(entityId);
					
					// push : id of plan card in IdArray 
					inputEntity.push(entityId);
					divObj.style.opacity = "50%";
					divObj.style.border = "1px solid black";
			        inputBtn.value = inputEntity;
			        
			        if( inputEntity.length ){
			        	para.innerText = 'Selected ' + inputEntity.length + ' Plans';
			        	deleteBtn.style.opacity = "100%";
						selectDeleteBtn.style.opacity = "100%";
			        }
			        else{
			        	para.innerText = "";
			        	deleteBtn.style.display = "0%";
						selectDeleteBtn.style.opacity = "0%";
			        }  

				} else {
					// plan details card
					divObj = document.getElementById(entityId);
					
					// delete id from id Array
					inputEntity.splice(inputEntity.indexOf(entityId), 1);
					
					// set value of array to input Box 
					inputBtn.value = inputEntity;
					
					divObj.style.opacity = "100%";
					divObj.style.border = "1px solid black";
					
					if( inputEntity.length ){
			        	para.innerText = 'Selected ' + inputEntity.length + ' Plans';
			        	deleteBtn.style.opacity = "100%";
						selectDeleteBtn.style.opacity = "100%";
					}
					else{
			        	para.innerText = "";
			        	deleteBtn.style.opacity = "0%";
						selectDeleteBtn.style.opacity = "0%";
			        }
				}
				console.log("NEW DIV ARRAY : " + inputEntity);
			}
		}
		
		function undoSelect(){
			inputEntity.forEach(changeCss);
			inputEntity = [];
		}
		
		function changeCss(element){
			divObj = document.getElementById(element);
			divObj.style.opacity = "100%";
		}
	</script>

	<script>
		function searchField() {
			document.getElementById("options-card").style.display = "none";
			document.getElementById("search-card").style.display = "block";

			var object = document.forms[0].searchBy;
			var index = object.selectedIndex;
			var value =  object.options[index].value;
			var content = object.options[index].text;
			
			if (value == "Name") {
				document.getElementById("alpha").style.display = "block";
				document.getElementById("ID").style.display = "none";
				document.getElementById("VALIDITY").style.display = "none";
				document.getElementById("PRICE").style.display = "none";
			}
			else if (value == "ID") {
				document.getElementById("alpha").style.display = "none";
				document.getElementById("ID").style.display = "block";
				document.getElementById("VALIDITY").style.display = "none";
				document.getElementById("PRICE").style.display = "none";

			}
			else if (value == "Validity") {
				document.getElementById("alpha").style.display = "none";
				document.getElementById("ID").style.display = "none";
				document.getElementById("VALIDITY").style.display = "block";
				document.getElementById("PRICE").style.display = "none";
			}
			else {
				document.getElementById("alpha").style.display = "none";
				document.getElementById("ID").style.display = "none";
				document.getElementById("VALIDITY").style.display = "none";
				document.getElementById("PRICE").style.display = "block";
			}
		}

		function nameFunction() {
		var input, filter, i, txtValue;
		input = document.getElementById("nameInput");
		filter = input.value.toUpperCase();
		planSize = <%=plans.size()%>;

		planNames = <%=plans%>;

		for (i = 0; i < planSize; i++) {
			txtValue = planNames[i]["name"];

			if (txtValue.toUpperCase().indexOf(filter) > -1) {
				document.getElementById("c" + planNames[i]["id"]).style.display = "";
			} else {
				document.getElementById("c" + planNames[i]["id"]).style.display = "none";
			}
			}       
		}

		function idFunction() {
		var input, filter, i, txtValue;
		input = document.getElementById("idInput");
		filter = input.value.toUpperCase();
		planSize = <%=plans.size()%>;

		planNames = <%=plans%>;

		for (i = 0; i < planSize; i++) {
			txtValue = '' + planNames[i]["id"];

			if (txtValue.toUpperCase().indexOf(filter) > -1) {
				document.getElementById("c" + planNames[i]["id"]).style.display = "";
			} else {
				document.getElementById("c" + planNames[i]["id"]).style.display = "none";
			}
			}       
		}

		function validityFunction() {
		var input, filter, i, txtValue;
		input = document.getElementById("validityInput");
		filter = input.value.toUpperCase();
		planSize = <%=plans.size()%>;

		planNames = <%=plans%>;

		for (i = 0; i < planSize; i++) {
			txtValue = '' + planNames[i]["validity"];

			if (txtValue.toUpperCase().indexOf(filter) > -1) {
				document.getElementById("c" + planNames[i]["id"]).style.display = "";
			} else {
				document.getElementById("c" + planNames[i]["id"]).style.display = "none";
			}
			}       
		}

		function priceFunction() {
		var input, filter, i, txtValue;
		input = document.getElementById("priceInput");
		filter = input.value.toUpperCase();
		planSize = <%=plans.size()%>;

		planNames = <%=plans%>;

		for (i = 0; i < planSize; i++) {
			txtValue = '' + planNames[i]["price"];
			if (txtValue.toUpperCase().indexOf(filter) > -1) {
				document.getElementById("c" + planNames[i]["id"]).style.display = "";
			} else {
				document.getElementById("c" + planNames[i]["id"]).style.display = "none";
			}
			}       
		}
	</script>

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

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
		integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
		crossorigin="anonymous"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js"
		integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
		crossorigin="anonymous"></script>

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