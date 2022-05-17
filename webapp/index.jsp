<%@page import="com.tech.blog.helper.connectionProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<!-- css -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="css/style.css" type="text/css"></link>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
	.banner{
		clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 90%, 71% 100%, 34% 91%, 0 100%, 0 0);	}

</style>

<title>Tech Blog | Programming</title>
</head>
<body>

<%
	Connection con = connectionProvider.getConnection();
%>

<!-- navbar -->
		<%@ include file="normalNavbar.jsp" %>

<!-- banner -->
		<div class="container-fluid m-0 p-0 banner">
			<div class="jumbotron primaryBg text-white">
				<div class="container">
						<h3 class="display-3">Welcome to TechBlog</h3>
						<p>A programming language is any set of rules that converts strings, or graphical program elements in the case of visual programming languages, to various kinds of machine code output. Programming languages are one kind of computer language, and are used in computer programming to implement algorithms.</p>
						<p>Most programming languages consist of instructions for computers. There are programmable machines that use a set of specific instructions,
						   rather than general programming languages. Since the early 1800s, programs have been used to direct the behavior of machines such as 
						   Jacquard looms, music boxes and player pianos. The programs for these machines (such as a player piano's scrolls)
						   did not produce different behavior in response to different inputs or conditions.
						</p>
						
						<a class="btn btn-outline-light" href="registration.jsp"><span class="fa fa-user-plus"></span> Start ! its Free</a>
						<a class="btn btn-outline-light" href="login.jsp" ><span class="fa fa-user-circle fa-spin"></span> Login</a>
				</div>
			</div>
		</div>


<!-- cards -->
		<div class="container">
			
			<!-- row 1 -->
			<div class="row mb-2" >
					
				<!-- card 1 -->
				<div class="col-md-4">
					<div class="card">
						 <div class="card-body">
						     <h5 class="card-title">Java Programming</h5>
						     <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
						     <a href="#" class="btn primaryBg text-white">Read more</a>
						  </div>
					</div>
				</div>
				
				<!-- card 2 -->
				<div class="col-md-4">
					<div class="card">
						 <div class="card-body">
						     <h5 class="card-title">Java Programming</h5>
						     <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
						     <a href="#" class="btn primaryBg text-white">Read more</a>
						  </div>
					</div>
				</div>
				
				<!-- card 3 -->
				<div class="col-md-4">
					<div class="card">
						 <div class="card-body">
						     <h5 class="card-title">Java Programming</h5>
						     <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
						     <a href="#" class="btn primaryBg text-white">Read more</a>
						  </div>
					</div>	
				</div>
			</div>
			
			<!-- row 2 -->
			<div class="row mb-2" >
				<!-- card 1 -->
				<div class="col-md-4">
					<div class="card">
						 <div class="card-body">
						     <h5 class="card-title">Java Programming</h5>
						     <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
						     <a href="#" class="btn primaryBg text-white">Read more</a>
						  </div>
					</div>
				</div>
				
				<!-- card 2 -->
				<div class="col-md-4">
					<div class="card">
						 <div class="card-body">
						     <h5 class="card-title">Java Programming</h5>
						     <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
						     <a href="#" class="btn primaryBg text-white">Read more</a>
						  </div>
					</div>
				</div>
				
				<!-- card 3 -->
				<div class="col-md-4">
					<div class="card">
						 <div class="card-body">
						     <h5 class="card-title">Java Programming</h5>
						     <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
						     <a href="#" class="btn primaryBg text-white">Read more</a>
						  </div>
					</div>	
				</div>
			</div>
		</div>
		
		
		
		
		
		
		
		
				
<!-- javascript -->
		<script
		  src="https://code.jquery.com/jquery-3.6.0.min.js"
		  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		  crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
		<script src="js/script.js" type ="text/javascript"></script> 


</body>
</html>