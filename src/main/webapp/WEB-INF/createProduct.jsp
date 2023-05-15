<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- c:out ; c:forEach etc. -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Formatting (dates) -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true"%>
<html>
<head>
<meta charset="UTF-8">
<title>Create Product</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
</head>
<body>
	<div class="bg-dark d-flex justify-content-around p-3">
		<h1 class="text-white">New Product</h1>
		<div class="d-flex gap-3">
			<a href="/home" class="btn btn-outline-light h-75">Home</a> 
			<a href="/category/create"class="btn btn-outline-light h-75">Create Category</a>
		</div>
	</div>
	<div class="container mt-3">
		<form:form action="/product/create/new" method="post" modelAttribute="product">
			<c:if test="${bindingResult.hasErrors()}"> 
				<div class="alert alert-danger mt-3 d-block ">
					<h3>
						<strong>Validation Error:</strong>
					</h3>
					<div class="mb-3">
						<form:errors path="name" class="text-danger" />
					</div>
					<div class="mb-3">
						<form:errors path="price" class="text-danger" />
					</div>
					<div class="mb-3">
						<form:errors path="description" class="text-danger" />
					</div>
				</div>
			</c:if>
			<div class="mb-3">
				<form:label path="name" class="form-label">Name:</form:label>
				<form:input path="name" class="form-control" type="text" />
			</div>

			<div class="mb-3">
				<form:label path="price" class="form-label">Price:</form:label>
				<form:input path="price" class="form-control" type="number"/>
			</div>
			
			<div class="mb-3">
				<form:label path="description" class="form-label">Description:</form:label>
				<form:textarea path="description" class="form-control" rows="5" cols="50" type="text" />
			</div>

			<input type="submit" value="Submit" class="btn btn-primary" />
		</form:form>
	</div>
</body>
</html>