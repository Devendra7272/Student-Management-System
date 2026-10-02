<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file ="header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial scale-1">

<title>Insert title here</title>

</head>

<body>
	<div class="container">

		<h2 class="text-primary mt-5 mb-3 text-center">Student
			Information</h2>

		<div class="d-flex justify-content-end">
		
			<form class="d-flex mb-3 text-end"  method="Get"  action="./displayStudent">
				<input class="form-control me-2" name="srno" type="search" placeholder="Enter Roll Number"
					aria-label="Search" />
				<button class="btn btn-outline-success" type="submit" name="sbtn" value="search">Search</button>
				<input class="btn btn-outline-success ms-1" type="submit" name="sbtn" value="Refresh">
			</form>
			
		</div>

		<table class="table table-hover table-bordered text-center">
			<thead>
				<tr class="table-primary">
					<th>RNO</th>
					<th>NAME</th>
					<th>PER</th>
				</tr>
			</thead>

			<tbody>

				<!-- Jsp Cha If Else aha -->
				<!-- NOT FOUND CASE -->
				<c:if test="${empty students}">
					<tr>
						<td colspan="3" style='color: red'>NO DATA FOUND!!</td>
					</tr>

				</c:if>

				<!-- FOUND CASE -->
				<c:if test="${not empty students}">
					<c:forEach var="S" items="${students}">

						<tr>
							<td>${S.rno}</td>
							<td>${S.name}</td>
							<td>${S.per}</td>
						</tr>

					</c:forEach>

				</c:if>

			</tbody>

		</table>

	</div>
	
</body>
</html>
