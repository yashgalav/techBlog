<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage ="error.jsp" %>

<%
User user = (User)session.getAttribute("currentUser");
if(user == null){
	response.sendRedirect("login.jsp");

}

%>



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

<title>profile | techBlog</title>
</head>
<body>
	<!-- start navbar -->
<nav class="navbar navbar-expand-lg navbar-dark primaryBg">
  <a class="navbar-brand" href="index.jsp"><span class="fa fa-asterisk"></span> Tech Blog</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#"> <span class="fa fa-code"></span> LearnCode with Yash<span class="sr-only">(current)</span></a>
      </li>
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <span class="fa fa-reorder"></span> Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Programing</a>
          <a class="dropdown-item" href="#">Project Implementation</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Data Structure</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#"> <span class="fa fa-phone"></span> Contact</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#"> <span class="fa fa-address-book"></span> About</a>
      </li>
      
     </ul>
     
     <ul class="navbar-nav mr-right">
      <li class="nav-item">
        <a class="nav-link" href="login.jsp"> <span class="fa fa-user-circle"></span> <%= user.getName() %></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="LogoutServlet"> <span class="fa fa-user-circle"></span> LogOut</a>
      </li>
    </ul>
    
  </div>    
</nav>
    
    <!-- end of navbar -->
    
       
</body>
</html>