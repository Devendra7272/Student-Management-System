<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial scale-1">

<title>header</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
	crossorigin="anonymous">

</head>
<body>

	<div class="container" style="margin-top: 100px;">

		<nav class="navbar navbar-dark bg-dark fixed-top">
			<div class="container-fluid">
				
				<a class="navbar-brand" href="#">
				<img src="SMSLogo.jpg" alt="Logo" width="45" height="45" class="d-inline-blockalign-text-top">
				<span class="fs-3 fw-semibold ms-3">
					STUDENT MANAGEMENT SYSTEM
				</span>
				</a>
				
				<button class="navbar-toggler" type="button"
					data-bs-toggle="offcanvas" data-bs-target="#offcanvasDarkNavbar"
					aria-controls="offcanvasDarkNavbar" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="offcanvas offcanvas-end text-bg-dark" tabindex="-1"
					id="offcanvasDarkNavbar" aria-labelledby="offcanvasDarkNavbarLabel">
					<div class="offcanvas-header">
						<h5 class="offcanvas-title" id="offcanvasDarkNavbarLabel">Dark
							offcanvas</h5>
						<button type="button" class="btn-close btn-close-white"
							data-bs-dismiss="offcanvas" aria-label="Close"></button>
					</div>
					<div class="offcanvas-body">
						<ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
							<li class="nav-item"><a class="nav-link active"
								aria-current="page" href="./home.jsp">Home</a></li>
							<li class="nav-item"><a class="nav-link" href="./Aboutus.jsp">About
									us</a></li>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#" role="button"
								data-bs-toggle="dropdown" aria-expanded="false"> Student </a>
								<ul class="dropdown-menu dropdown-menu-dark">
									<li><a class="dropdown-item" href="./addStudent">Add
											Student</a></li>
									<li><a class="dropdown-item" href="./displayStudent">Display
											Student</a></li>
									<li><a class="dropdown-item" href="./searchStudent">Search
											Student</a></li>
									<li><a class="dropdown-item" href="./deleteStudent">Delete
											Student</a></li>
									<li><a class="dropdown-item" href="./updateStudent">Update
											Student</a></li>

								</ul></li>
						</ul>
					</div>
				</div>
			</div>
		</nav>

	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
		crossorigin="anonymous"></script>
</body>
</html>
