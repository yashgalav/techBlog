<%@page import="com.tech.blog.entities.MessageClass"%>
<%@page import="com.mysql.cj.protocol.Message"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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

<title>Login | TechBlog</title>
</head>
<body>

<!-- navbar -->
<%@ include file="normalNavbar.jsp" %>

<!-- login form -->
	<main class="d-flex align-items-center primaryBg banner" style="height:70vh">
		<div class="container">
			<div class="row">
				<div class="col-md-4 offset-md-4">
					<div class="card ">
						<div class="card-header primaryBg text-white text-center ">
							<span class="fa fa-user-circle fa-3x"></span>
							<p>Login here</p>
						</div>
						
						
						<!-- for alert message -->
						<%
						 MessageClass m = (MessageClass) session.getAttribute("msg");
						 if(m != null){
						%>
							<div class="alert <%= m.getCssClass() %>" role="alert">
								<%= m.getContent() %>
						</div>  
						<%	  
							session.removeAttribute("msg");
						 }
						%>
						
						
						
						
						<div class="card-body">
							<form action="login" method="post">
								  <div class="form-group">
									    <label for="exampleInputEmail1">Email address</label>
									    <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
									    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
								  </div>
								  <div class="form-group">
									    <label for="exampleInputPassword1">Password</label>
									    <input name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
								  </div>
								  <div class="container text-center">
										<button type="submit" class="btn btn-primary">Submit</button>									    
								  </div>
							</form>
						</div>
					</div>
				
				</div>
			
			</div>
		
		</div>
	
	
	</main>


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