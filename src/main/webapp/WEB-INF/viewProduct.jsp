<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Formatting (dates) -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Product</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
</head>
<body>
	<div class="bg-dark d-flex justify-content-around p-3">
		<h1 class="text-white">
			<c:out value="${product.name}" />
		</h1>
		<div class="d-flex gap-3">
			<a href="/home" class="btn btn-outline-light h-75">Home</a> <a
				href="/product/create" class="btn btn-outline-light h-75">Create
				Product</a>
		</div>
	</div>
	<div class="container mt-3">
		<div class="card">
			<div class="card-header">Categories</div>
			<div class="card-body">
				<ul>
					<c:forEach var="category" items="${productInCategory}">
						<li><c:out value="${category.name}" /></li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div class="mt-3">
			<form action="/product/join/${product.id}" method="post">
				<label for="categories" class="form-label">Add Category:</label>
				<c:if test="${not empty errorMessage}">
			        <div class="mb-2">
			        	<p class="text-danger">
			        		<c:out value="${errorMessage}"/>
			        	</p> 
			        </div>
			    </c:if> 
				<select
					name="categories" id="categories" class="form-select">
					<option value="" disabled selected>--Select Category--</option>
					<c:forEach var="category" items="${productInNotCategory}">
						<option value="${category.id}">${category.name}</option>
					</c:forEach>
				</select> 
				<input type="submit" value="Add" class="btn btn-primary mt-3" />
			</form>
		</div>

	</div>
</body>
</html>