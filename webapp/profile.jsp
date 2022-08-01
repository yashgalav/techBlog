<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.helper.connectionProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage ="error.jsp" %>
<%@page import="com.tech.blog.entities.MessageClass"%>
<%@page import="com.tech.blog.dao.PostDao,com.tech.blog.entities.Category" %>

 <!-- validation code to check user is login or not  -->   
<%
User user = (User)session.getAttribute("currentUser");
if(user == null){
	response.sendRedirect("login.jsp");
}

%>



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
	body{
		background: url('img/bgpic.jpg');
		background-size: cover;
		background-attachment:fix;
	}
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
      <li class="nav-item">
        <a class="nav-link" href="#" data-toggle="modal" data-target="#addPost-modal"> <span class="fa fa-plus" ></span> Add Post</a>
      </li>
      
     </ul>
     
     <ul class="navbar-nav mr-right">
      <li class="nav-item">
         <!-- Button trigger modal -->
        <a class="nav-link" href="#"  data-toggle="modal" data-target="#myModal"> <span class="fa fa-user-circle"></span> <%= user.getName().toUpperCase() %> </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="LogoutServlet"> <span class="fa fa-sign-out"></span> LogOut</a>
      </li>
    </ul>
    
  </div>    
</nav>
    
    <!-- end of navbar -->
  
  
  
     <!-- Add post modal -->		
			<!-- Modal -->
			
			<div class="modal fade" id="addPost-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">+ Add post</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      
			      <!-- *********************************from inside modal******************************* -->
			      <div class="modal-body">
			        <form action="addPostServlet" id="add-post-form" method="post">
			        	<div class="form-group">
			        		<select  class="form-control" name="cid" >
			        			<option selected disabled="checked">---Select Category---</option>
			        			<% 
			        				PostDao pd = new PostDao(connectionProvider.getConnection());
			        				ArrayList<Category> list = pd.getAllCategories();
			        				for(Category c : list){
			        			%>
			        					<option value="<%= c.getCid() %>"><%= c.getC_name() %></option>
			        			<%
			        						
			        				}
			        			%>
			        		</select>
			        	</div>
			        	
			        	<div class="form-group">
			        		<input name="pTitle" type="text" placeholder="Enter the Title" class="form-control"/>
			        	</div>
			        	<div class="form-group">
			        		<textarea name="pContent" style="height:200px" placeholder="Enter the your content" class="form-control"></textarea>
			        	</div>
			        	<div class="form-group">
			        		<textarea name="pCode" style="height:200px" placeholder="Enter the your code if any" class="form-control"></textarea>
			        	</div>
			        	<div class="form-group">
			        		<label>Select your picture</label>
			        		<br>
			        		<input name="pic" type="file"/>
			        	</div>
			        	<div class="container text-center">
					        <button type="submit" class="btn btn-outline-primary">Post</button>
					     </div>
			        	
			        </form>
			        
			        
			        
			      </div>
			    </div>
			  </div>
			</div>
     
     <!-- END of Add post modal -->
     
     
    <!-- for alert message -->
					<%
					 MessageClass m = (MessageClass) session.getAttribute("msg");  // Note: to add this messageClass we need to import the the messageClass.
					 if(m != null){
					%>
					<div class="alert <%= m.getCssClass() %>" role="alert">				
							<%= m.getContent() %>
					</div>  
					<%	  
					session.removeAttribute("msg");
					 }
					%>
	<!-- *********************************************************************** -->			
	 
     <!-- main body of the page START HERE -->
	     <main>
	     <div class="container ">
	     	<div class="row mt-4">
	     		<!-- first column  -->
	     		<div class="col-md-2 ">
	     			<div class="list-group">
					  <a href="#" onclick="getPosts(0,this)" class="c-link list-group-item list-group-item-action active"> All Post </a>
					  
					  
					  <%
					  		PostDao dao = new PostDao(connectionProvider.getConnection());
					  		ArrayList<Category> list1 = dao.getAllCategories();
					  		
					  		for(Category c : list1){
					  	%>
					  			
					  			<a href="#" onclick="getPosts(<%= c.getCid() %>, this)" class="c-link list-group-item list-group-item-action"><%= c.getC_name() %></a>
					  
			  			<%
					  		}
					  
					  %>
					</div>
	     			
	     		</div>
	     		
	     		<!-- Second column  -->
	     		<div class="col-md-10" >
	     			<!-- Post -->
	     			<div class="container text-center" id="postLoader">
	     				<i class="fa fa-refresh fa-4x fa-spin"></i>
	     				<h3 class="mt-2">Loading...</h3>
	     			</div>
	     			 
	     			 <!-- post Include here -->
	     			 <div class="container-fluid" id="post-container">
	     			
	     			
	     			</div>
	     			
	     			
	     		</div>
	     	</div>
	     </div>
	     
	     </main>
	       
       
     <!-- main body of the page END HERE --> 				
    
    <!-- *********************************************************************** -->
    
    <!-- Start of profile modal -->
				
				<!-- Modal -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-header primaryBg text-white">
				        <h5 class="modal-title" id="exampleModalLongTitle">TechBlog</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      
				      
				      <div class="modal-body">
				        <div class="container text-center">
				        	<img  src="pics/<%= user.getProfile() %>" class="img-fluid" style="border-radius:50%; max-width:150px; "> 
				        	<h5 class="modal-title" id="exampleModalLongTitle"><%= user.getName().toUpperCase() %></h5>	
				  		
				  <!-- details  -->
				  			
				  			<div id="profile-original">
				  				<table class="table">
								  <tbody>
								    <tr>
								      <th scope="row">ID:</th>
								      <td><%= user.getId() %></td>									    
								  	</tr>
								    <tr>
								      <th scope="row">Name:</th>
								      <td><%= user.getName() %></td>
								    </tr>
								    <tr>
								      <th scope="row">Email:</th>
								      <td><%= user.getEmail() %></td>
								    </tr>
								    <tr>
								      <th scope="row">Gender:</th>
								      <td><%= user.getGender().toUpperCase() %></td>
								    </tr>
								    <tr>
								      <th scope="row">Registered Time:</th>
								      <td><%= user.getDateTime().toLocaleString() %></td>
								    </tr>
								    <tr>
								      <th scope="row">status:</th>
								      <td><%= user.getAbout() %></td>
								    </tr>
								  </tbody>
								</table>     
				  			</div>
				  			
				  			<div id="profile-editable"  style="display:none;">
				  				<h3 class="mt-2" >Please Edit Carefully.</h3>			
								<form action="editableServlet" method="post" enctype="multipart/form-data">
				  					<table class="table">
				  						<tbody>
				  						<tr>
									      <th scope="row">ID:</th>
									      <td><%= user.getId() %></td>									    
									  	</tr>
									    <tr>
									      <th scope="row">Name:</th>
									      <td><input type="text" name="user_name" class="form-control" value="<%= user.getName() %>"></td>
									    </tr>
									    <tr>
									      <th scope="row">Email:</th>
									      <td><input type="email" name="user_email" class="form-control" value="<%= user.getEmail() %>"></td>
									    </tr>
									    <tr>
									      <th scope="row">Password:</th>
									      <td><input type="text" name="user_password" class="form-control" value="<%= user.getPassword() %>"></td>
									    </tr>
									    <tr>
									      <th scope="row">Gender:</th>
									      <td><%= user.getGender().toUpperCase() %></td>
									    </tr>
									    <tr>
									      <th scope="row">Registered Time:</th>
									      <td><%= user.getDateTime().toLocaleString() %></td>
									    </tr>
									    <tr>
									      <th scope="row">status:</th>
									      <td><textarea row="3" name="about" class="form-control" value="<%= user.getAbout() %>"><%= user.getAbout() %></textarea></td>
									    </tr>
									    <tr>
									      <th scope="row">Profile change:</th>
									      <td><input type="file" name="user_pic" class="form-control" > </td>
									    </tr>
									    
									    </tbody>
				  					</table>
				  					
				  					<div class="container mb-2">
				  						<button type="submit" class="btn btn-outline-primary">Save</button>
				  					</div>
				  			   </form>		
				  			</div>
				  							        
				        
				      </div>
				      
				      
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				        <button id="edit-btn" type="button" class="btn btn-primary"><span class="	fa fa-pencil-square-o"></span> Edit</button>
				      </div>
				    </div>
				  </div>
				</div>
    
    <!-- End of profile modal -->
       
   
 
       
       
    <!-- javascript -->
		<script
		  src="https://code.jquery.com/jquery-3.6.0.min.js"
		  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		  crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
		
		<script src="js/script.js" type ="text/javascript"></script>    
             
      <!-- code for hide and show the editable content using toggle button this code is reusable -->
       <script>
       		$(document).ready(function(){
       			let editStatus = false;
       			

       			$("#edit-btn").click(function(){
           			if( editStatus == false){
       					$("#profile-original").hide();			
       					$("#profile-editable").show();
       					$(this).text("Back");
       					editStatus = true;
           			}
           			else{
           				$("#profile-original").show();
       					$("#profile-editable").hide();
       					$(this).text("Edit");
           				editStatus = false;
           			}
           			
           			
           			})
       		})
       
       </script>

       
       <!-- add post js -->
       <script>
       		$(document).ready(function(e){
       			
       			
       			$("#add-post-form").on("submit",function(event){
       				// this code get called when form is submitted...
       				event.preventDefault();
       				console.log("inside function...")
       				let form = new FormData(this);
       				
       				// now requesting to servlet
       				$.ajax({
       					url: "addPostServlet",
       					type:'POST',
       					data: form,
       					success: function(data, textStatus, jqXHR ){
       						if(data.trim() =="done"){
       							swal("Good job!", "Successfully Posted!", "success")
       							.then((value) => {
  								  window.location="profile.jsp";
  								});
       						}else{
       							swal("Error!", "Something Went Worng...", "error")
       							.then((value) => {
  								  window.location="profile.jsp";
  								});
       						}
       					},
       					error: function(jqXHR, textStatus, errorThrown){
       						swal("Error!", "Something Went Worng...", "error")
       						.then((value) => {
								  window.location="profile.jsp";
							});
       					},
       					processData: false,
       					contentType: false
       				})
       				
       			})	
       			
       		})
       		
       </script>
		
		
		<!-- loading Post using Ajax -->
		<script >
			
			function getPosts(catId, ref){
				
				$("#postLoader").show();
				$("#post-container").hide();
				$(".c-link").removeClass('active');
				
				$.ajax({
					url: "loadPost.jsp",
					data:{cid:catId},
					success: function(data, textStatus, jqXHR ){
						console.log(data);
						$("#postLoader").hide();
						$("#post-container").show();
						$("#post-container").html(data);
						$(ref).addClass('active');
						
					},
					error: function(jqXHR, textStatus, errorThrown){
						
					}
				
				})
			}
				
		
			
			$(document).ready(function(e){
				let allPostRef = $(".c-link")[0];
				getPosts(0, allPostRef);
			
				
			})
		
		</script>



</body>
</html>