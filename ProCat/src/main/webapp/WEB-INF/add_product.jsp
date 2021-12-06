<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<meta charset="ISO-8859-1">
<title>New Product</title>
</head>
<body>
<div class = "container">
<div class = "row">
<h1>New Product</h1>
</div>
<div class = "mb-3 row">
<form:form method = "POST" action = "/addProduct" modelAttribute = "product">
<div class = "mb-2">
	<form:label path="name">Name</form:label> <!-- Path matches attribute name -->
	<form:errors path = "name"></form:errors>
	<form:input class = "form-control" type = "text" path="name"/>
</div>
<div class = "mb-2">
	<form:label path="description">Description</form:label> <!-- Path matches attribute name -->
	<form:errors path = "description"></form:errors>
	<form:input class ="form-control" type = "text" path="description"/>

</div>
<div class = "mb-2">	
	<form:label path="price">Price</form:label> <!-- Path matches attribute name -->
	<form:errors path = "price"></form:errors>
	<form:input class ="form-control" type = "text" path="price"/>
</div>	
	<button type="submit" class="btn btn-primary">Submit</button>
</form:form>
</div>
</div>

</body>
</html>