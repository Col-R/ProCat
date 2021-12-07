<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<meta charset="ISO-8859-1">
<title>Category Page</title>
</head>
<body>
<div class="container">
  <div class="row">
    	<div class="col-5 offset-1">
        	<h1><c:out value = "${category.name}"/></h1>
        </div>
  </div>
  <div class="row">
    <div class="col-5 offset-1">
      <h3>Categories</h3>
      <ul>
      	<c:forEach items = "${category.products }" var = "prod">
      	 <li>${prod.name }</li>
      	</c:forEach>
      </ul>
    </div>
    <div class="col-5 offset-1">
    <h3>Add Product</h3>
    
      <form method = "POST" action = "/addProd/${category.id }">
      	<select name = "prod">
      		<c:forEach items = "${notInCat}" var = "prod">
      			<option value = "${prod.id }">${prod.name}</option>
      		</c:forEach>
      	</select>
 	<button type="submit" class="btn btn-primary">Submit</button>
      </form>
      
    </div>
  </div>
</div>
</body>
</html>