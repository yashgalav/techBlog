<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<title>Sorry!! Something went wrong...</title>
</head>
<body>
	<div class="container p-3 text-center" >
		<div >
			<img src="img/computer.png" class="img-fluid"/>
		</div>
		<h1 class="display-3">Sorry!! Something went wrong...</h1>
		<p><%= exception %></p>
		<a href="index.jsp" class="btn btn-outline-secondary">Home</a>
	</div>
	</body>
</html>