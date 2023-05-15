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
<title>Home</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
</head>
<body>
	<div class="bg-dark d-flex justify-content-around p-3">
		<h1 class="text-white">Home Page</h1>
		<div class="d-flex gap-3">
			<a href="/product/create" class="btn btn-outline-light h-75">Create Product</a> 
			<a href="/category/create"class="btn btn-outline-light h-75">Create Category</a>
		</div>
	</div>
	<div class="container col-12 mt-3">
		<div class="d-flex gap-3">
			<div class="card col-6">
				<div class="card-header">Products</div>
				<div class="card-body">
					<ul>
						<c:forEach var="product" items="${products}">
							<li><a href="/view/product/${product.id}"> 
								<c:out value="${product.name}" />
							</a></li>
						</c:forEach>
					</ul>
	
				</div>
			</div>
			
			<div class="card col-6">
				<div class="card-header">Categories</div>
				<div class="card-body">
					<ul>
						<c:forEach var="category" items="${categories}">
							<li><a href="/view/category/${category.id}"> 
								<c:out value="${category.name}" />
							</a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</div>

</body>
</html>