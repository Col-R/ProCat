<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<meta charset="ISO-8859-1">
<title>New Category</title>
</head>
<body>
<div class = "container">
<div class = "row">
<h1>New Category</h1>
</div>
<div class = "mb-3 row">
<form:form method = "POST" action = "/addCategory" modelAttribute = "category">
	<form:label path="name">Name</form:label> <!-- Path matches attribute name -->
	<form:errors path = "name"></form:errors>
	<form:input class ="form-control" type = "text" path="name"/>
	<button type="submit" class="btn btn-primary">Submit</button>
</form:form>
</div>
</div>

</body>
</html>