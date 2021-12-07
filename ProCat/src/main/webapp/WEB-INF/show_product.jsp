<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<meta charset="ISO-8859-1">
<title>Product Page</title>
</head>
<body>

<div class="container">
<h1><c:out value = "${product.name}"/></h1>
  <div class="row">
    <div class="col-5 offset-1">
      <h3>Categories</h3>
      <ul>
      	<c:forEach items = "${product.categories }" var = "cat">
      	 <li>${cat.name }</li>
      	</c:forEach>
      </ul>
    </div>
    <div class="col-5 offset-1">
    <h3>Add Category</h3>
    
      <form method = "POST" action = "/addCat/${product.id }">
      	<select name = "cats">
      		<c:forEach items = "${notInProd}" var = "cat">
      			<option value = "${cat.id }">${cat.name}</option>
      		</c:forEach>
      	</select>
 	<button type="submit" class="btn btn-primary">Submit</button>
      </form>
      
    </div>
  </div>
</div>

</body>
</html>