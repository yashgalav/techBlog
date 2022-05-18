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

<title>Register | Tech Blog</title>
</head>
<body>

<!-- navbar -->
		<%@ include file="normalNavbar.jsp" %>

<!-- registration form -->
		<main class="banner primaryBg" style="padding-bottom:100px">

			<div class="container">
	
				<div class="col-md-6 offset-md-3" >
				
					<div class="card ">
					
						<!-- header -->
						<div class="card-header primaryBg text-center text-white">
							<span class="fa fa-user-plus fa-3x"></span>
						 	<p>Register here</p>
					
						</div>
						
						<!-- body -->
						<div class="card-body">
							<form id="reg-id" action="RegisterServlet" method="post">
								  <div class="form-group">
									    <label for="username">User Name</label>
									    <input name="user_name" type="text" class="form-control" id="username"  placeholder="User Name">
								  </div>
								  
								  <div class="form-group">
									    <label for="useremail">Email address</label>
									    <input name="user_email" type="email" class="form-control" id="useremail" aria-describedby="emailHelp" placeholder="Enter email">
									    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
								  </div>
								  
								  
								  
								  <div class="form-group">
									    <label for="exampleInputPassword1">Password</label>
									    <input name="user_password" type="password" class="form-control" id="exampleInputPassword1" >
								  </div>
								  
								  <div class="form-group">
									    <label for="gender">Gender</label>
									    <br>
									    <input type="radio"  id="gender" value="male" name="gender">Male
									    <input type="radio"  id="gender" value="female" name="gender">Female
									    
								  </div>
								  
								  <div class="form-group">
									    <textarea name="about" type="textarea" class="form-control" cols="30" rows="1" placeholder="Enter Something about yourSelf."></textarea>
								  </div>
								  
								  <div class="form-check">
									    <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
									    <label class="form-check-label" for="exampleCheck1">agree terms and conditions.</label>
								  </div>
								  <div id="loader" class="container text-center" style="display:none;">
								  		<span class="fa fa-refresh fa-spin fa-3x"></span>
								  		<h4>Please wait...</h4>
								  </div>
	   					  		<button id="submit-id" type="submit" class="btn btn-primary">Submit</button>
							</form>
						
					
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
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		
		<script >
			$(document).ready(function(){
				console.log('loaded......');
				
				$('#reg-id').on('submit',function(event){
					event.preventDefault();
					
					let form = new FormData(this);
					
					//here currently submit button id clicked  so we hide this submit button with thw help of ajax.
					$("#submit-id").hide();
					$("#loader").show();
					
					//send register servlet:
					$.ajax({
						url: "RegisterServlet",
						type: 'POST',
						data: form,
						success : function(data,textStatus,jqXHR){
							console.log(data);
							$("#submit-id").show();
							$("#loader").hide();
							if(data.trim() === 'done'){
								swal("Registered Successfully...We going to edirecting to login page.")
								.then((value) => {
								  window.location="login.jsp";
								});
							}
							else{
								swal(data);
							}
						},
						error: function(jqXHR,textStatus,errorThrown){
							console.log(jqXHR)
							$("#submit-id").show();
							$("#loader").hide();
							swal("Sorry ! Something went Wrong..")
							
						},
						processData: false,
						contentType: false
					})
										
					
					
				})
				
			})
			
			
		
		
		</script>
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
</body>
</html>