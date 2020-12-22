<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
	<head>
		<title>Customer List</title>
		
		<!-- reference our style sheet -->
		<link	type="text/css"
				rel="stylesheet"
				href="${pageContext.request.contextPath}/resources/css/style.css" />	
	</head>
	<body>
		<div id="wrapper">
			<div id="header">
				<h2>CRM - Customer RelationShip Manager</h2>
			</div>
		</div>
		
		<div id="container">
			<div id="content">
			
				<!-- add new button: "Add Customer" -->
				<input type="button" value="Add Customer"
						onclick="window.location.href='showFormForAdd';return false;"
				/>	<br><br>
				
				<!-- Add html table here -->
				<table>
					<tr>
						<th>First Name</th>
						<th>Last Name</th>
						<th>Email</th>
						<th>Action</th>
					</tr>
					
					<!-- loop over and print our customers -->
					<c:forEach var="tempCustomer" items="${customers}">
					
					<!-- construct an "update" link with customer id using jstl custom tags -->
					<c:url var="updateLink" value="/customer/showFormForUpdate">
						<c:param name="customerId" value="${tempCustomer.id}"/>
					</c:url>
					
					<!-- construct an "delete" link with customer id using jstl custom tags -->
					<c:url var="deleteLink" value="/customer/delete">
						<c:param name="customerId" value="${tempCustomer.id}"/>
					</c:url>
					
						<tr>
							<td>${tempCustomer.firstName}</td>
							<td>${tempCustomer.lastName}</td>
							<td>${tempCustomer.email}</td>
							
							<td>
								<!-- display the update link -->
								<a href="${updateLink}">Update</a>
								| 
								<a href="${deleteLink}"
								onclick="if (!(confirm('Are you sure you want to delete this customer ??'))) return false">Delete</a>
								<!-- above added java script code to prompt the user before delete -->
							</td>
						</tr>
						
					</c:forEach>
					
				</table>
					
			</div>
		</div>
	</body>
</html>