<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial scale-1">

<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script> 
    
     function openPopupBox(trno)  // trno=102
     {
    	 var tr = document.getElementById(trno);
    	 
    	 var td = tr.getElementsByTagName("td");  // td-->[0]: <td> 102 </td>  [1]:bbb  [2]:500
    	 
    	 var srno  = td[0].textContent;  // srno =102
    	 var sname = td[1].textContent;  // sname= BBB
    	 var sper  = td[2].textContent;  // sper = 70
    	 
    	 //set value to popup
    	 
    	 var modalRno = document.getElementById("modalRno");
    	 modalRno.value = srno;
    	 
    	 var modalName = document.getElementById("modalName");
    	 modalName.value = sname;
    	 
    	 var modalPer = document.getElementById("modalPer");
    	 modalPer.value = sper;
    	 
    	 // Call popup
    	 new bootstrap.Modal(document.getElementById("updateModal")).show();
    	 
    	 //now we separate this line for better Understanding
    	
    	 //var popup = document.getElementById("updateModal");
    	 //var modal = new bootstrap.Modal(popup);    //we creating object 
    	 //modal.show();   // now calling modal
    	
     }

     function modify()
     {

    		 var modalRno  = document.getElementById("modalRno");
             var modalName = document.getElementById("modalName");
    		 var modalPer  = document.getElementById("modalPer");

    		 var srno  = modalRno.value;
    		 var sname = modalName.value;
    		 var sper  = modalPer.value;

    		 //Call servlet & send Rno as a 'srno'

    		 // Then you receive 'success' or 'failed' token

    		 // Fetch( URL, DATA).then() .then() .catch()

    		 fetch("http://localhost:8080/00-SMS-Mgmt-Appl/updateStudent",
    			     {

    			         method : 'POST' ,
    			         body   : new URLSearchParams( {'srno': srno, 'sname' : sname, 'sper' : sper })

    		    	 }	     		 
    		 )
    		 .then(response => response.text() )
    		 .then(data =>
    		              {
    		            	  if(data.trim() == "success")
   		            	      {
    		            		
    		            		  Swal.fire({
    		            			  title: "Record is Updated!",
    		            			  icon: "success",
    		            			  draggable: true
    		            			});
    		            		  //alert("Record Updated Successfully !!");
    		            		  
    		            		  var clsbtn = document.getElementById("clsbtn");
    		            		  clsbtn.click();
    		            		  
    		            		  location.reload();
    		            		  <!-- This is Success , direct Close , and Without touch Refresh Buttons logic -->
   		            	      }

   		            	      if(data.trim() == "Failed")
   		            	      {

   		            	    	  //alert("failed to Update Record !!");
   		            	    	
   		            	    	  Swal.fire({
   		            	    	  icon: "error",
   		            	    	  title: "Oops...",
   		            	    	  text: "Failed to Save Record!",
   		            	    	  footer: "Try One More Time"
   		            	    	});

   		            	      }
    		              }
    		 )
    		 .catch(error => console.error("Problem while Updating Roll Number :" + srno));	 
     }
</script>

</head>

<body>
	<div class="container">

		<h2 class="text-primary mt-5 mb-3 text-center">Student
			Information</h2>

		<div class="d-flex justify-content-end">

			<form class="d-flex mb-3 text-end" method="Get"
				action="./updateStudent">
				<input class="form-control me-2" name="srno" type="search"
					placeholder="Enter Roll Number" aria-label="Search" />
				<button class="btn btn-outline-success" type="submit" name="sbtn"
					value="search">Search</button>
				<input class="btn btn-outline-success ms-1" type="submit"
					name="sbtn" value="Refresh">
			</form>

		</div>

		<table class="table table-hover table-bordered text-center">
			<thead>
				<tr class="table-primary">
					<th>RNO</th>
					<th>NAME</th>
					<th>PER</th>
					<th>Action</th>
				</tr>
			</thead>

			<tbody>

				<!-- Jsp Cha If Else aha -->
				<!-- NOT FOUND CASE -->
				<c:if test="${empty students}">
					<tr>
						<td colspan="4" style='color: red'>NO DATA FOUND!!</td>
					</tr>

				</c:if>

				<!-- FOUND CASE -->
				<c:if test="${not empty students}">
					<c:forEach var="S" items="${students}">
						<tr id="${S.rno}">

							<td>${S.rno}</td>
							<td>${S.name}</td>
							<td>${S.per}</td>
							<td>
								<button type="button" class="btn btn-primary"
									onClick="openPopupBox('${S.rno}')">Update</button>
							</td>
						</tr>

					</c:forEach>
				</c:if>

			</tbody>
		</table>
	</div>

	<!-- Modal -->

	<div class="modal fade" id="updateModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">

			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">Update
						Student</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>

				<div class="modal-body">
					<div class="mb-3">
						<label for="recipient-name" class="col-form-label">Roll
							Number:</label> <input type="text" class="form-control" id="modalRno" disabled>
					</div>
				</div>

				<div class="modal-body">
					<div class="mb-3">
						<label for="recipient-name" class="col-form-label">Student
							Name:</label> <input type="text" class="form-control" id="modalName">
					</div>
				</div>

				<div class="modal-body">
					<div class="mb-3">
						<label for="recipient-name" class="col-form-label">Percentage:</label>
						<input type="text" class="form-control" id="modalPer">
					</div>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal" id="clsbtn"> Close </button>
					<button type="button" class="btn btn-primary" onClick='modify()'>Update
						changes</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
