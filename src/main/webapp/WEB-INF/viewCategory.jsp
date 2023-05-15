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
<title>View Category</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
</head>
<body>
	<div class="bg-dark d-flex justify-content-around p-3">
		<h1 class="text-white">
			<c:out value="${category.name}" />
		</h1>
		<div class="d-flex gap-3">
			<a href="/home" class="btn btn-outline-light h-75">Home</a> <a
				href="/category/create" class="btn btn-outline-light h-75">Create
				Category</a>
		</div>
	</div>
	<div class="container mt-3">
		<div class="card">
			<div class="card-header">Products</div>
			<div class="card-body">
				<ul>
					<c:forEach var="product" items="${categoryInProduct}">
						<li><c:out value="${product.name}" /></li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div class="mt-3">
			<form action="/category/join/${category.id}" method="post">
				<label for="products" class="form-label">Add Product:</label> 
				<c:if test="${not empty errorMessage}">
			        <div class="mb-2">
			        	<p class="text-danger">
			        		<c:out value="${errorMessage}"/>
			        	</p> 
			        </div>
			    </c:if> 
				<select
					name="products" id="products" class="form-select">
					<option value="" disabled selected>--Select Product--</option>
					<c:forEach var="product" items="${categoryInNotProduct}">
						<option value="${product.id}">${product.name}</option>
					</c:forEach>
				</select> 
				<input type="submit" value="Add" class="btn btn-primary mt-3" />
			</form>
		</div>

	</div>
</body>
</html>