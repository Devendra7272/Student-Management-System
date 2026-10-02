<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file ="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial scale-1">
<title>Page 1</title>

</head>
<body>

	<div class="container" style="width: 500px; margin-top: 100px;">
		<h2 class="text-center text-primary mt-5 mb-3">Registration Form</h2>

		<form method="Post" action="./addStudent">

			<div class="row mb-3">
				<label for="exampleInputEmail1" class="form-label">Roll
					Number :</label> <input type="text" name="rno" class="form-control"
					id="exampleInputEmail1" aria-describedby="emailHelp">
			</div>


			<div class="row mb-3">
				<label for="exampleInputEmail1" class="form-label">Name :</label> <input
					type="text" name="name" class="form-control"
					id="exampleInputEmail1" aria-describedby="emailHelp">
			</div>


			<div class="row mb-3">
				<label for="exampleInputEmail1" class="form-label">Percentage
					:</label> <input type="text" name="per" class="form-control"
					id="exampleInputEmail1" aria-describedby="emailHelp">
			</div>


			<div class="d-grid gap-2">
				<input type="submit" value="Save" class=" btn btn-primary">
			</div>

		</form>
		<br> 
		${msg}

	</div>
	</div>
	
</body>
</html>