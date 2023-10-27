<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register Page</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous" />


<!-- for external file -->

<link href="CSS/myStyle.css" rel="stylesheet" type="text/css" />

<!-- for awesome icons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />

<style>
.banner-background {
	clip-path: polygon(50% 0%, 100% 0, 100% 93%, 70% 100%, 33% 92%, 0 100%, 0 0);
	);
}
</style>


</head>
<body>

	<%@include file="normal_navbar.jsp"%>

	<main class="primary-background " style="padding:bottom:80px;">
	<div class="container">
		<div class="col-md-6 offset-md-3">
			<div class="card">
				<div class="card-header text-center primary-background text-white">
					<span class="fa fa-user-circle fa-3x"></span>
					<p>Register Here</p>
				</div>
				<div class="card-body">
					<form id="reg-form" action="RegisterServlet" method="post">
						<div class="form-group">
							<label for=user_name">User Name</label> <input name="user_name"
								type="text" class="form-control" id="user_name"
								aria-describedby="emailHelp" placeholder="enter your name">

						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Email address</label> <input
								name="user_email" type="email" class="form-control"
								id="exampleInputEmail1" aria-describedby="emailHelp"
								placeholder="Enter email"> <small id="emailHelp"
								class="form-text text-muted">We'll never share your
								email with anyone else.</small>
						</div>

						<div class="form-group">
							<label for="exampleInputPassword1">Password</label> <input
								name="user_password" type="password" class="form-control"
								id="exampleInputPassword1" placeholder="Password">
						</div>
						<div class="form-group">
							<label for="gender">Select Gender</label> <br> <input
								type="radio" id="gender" name="gender" value="male">Male
							<input type="radio" id="gender" name="gender" value="female">Female
							<input type="radio" id="gender" name="gender" value="others">others

						</div>
						<div class="form-group">
							<textarea name="user_about" id="" cols='35' rows='5'
								placeholder="Enter something about yourself.."></textarea>
						</div>


						<div class="form-check">
							<input name="check" type="checkbox" class="form-check-input"
								id="exampleCheck1"> <label class="form-check-label"
								for="exampleCheck1"> agree term and conditions</label>
						</div>
						<div class="container text-center" id="loader"
							style="Display: none;">
							<span class="fa fa-refresh fa-spin fa-3x"></span>
							<h4>Please wait...</h4>
						</div>
						<br>
						<button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>

					</form>


				</div>
				<div class="card-footer"></div>
			</div>
		</div>
	</div>
	</main>


	<script src="https://code.jquery.com/jquery-3.6.3.min.js"
		integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>

	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>



	<script>
		$(document).ready(function(){
			console.log("loaded....")
			
			$('#reg-form').on('submit' ,function(event){
				event.preventDefault();
				
				let form=new FormData(this);
				
				$("#submit-btn").hide();
				$("#loader").show();
				
				$.ajax({
					
					url:"RegisterServlet",
					type:'POST',
					data: form,
					success: function(data,textStatus,jqXHR){
						
						console.log(data); 
						 
						$("#submit-btn").show();  //show the submit button when the all entries are right
						$("#loader").hide();   // loader are hide when data stored in the db
						if(data.trim()===data){
							swal("Successfully Registered, We redirecting to Login Page....")
							.then((value) => {              //when upper statement execute then click and we get this promiss
							  window.location="Login.jsp"
							});	
						}
						else{
							swal(data);
						}
						
					},
					error:function(jqXHR,textStatus,errorThrown){
						$("#submit-btn").show();  
						$("#loader").hide();
						swal("something went wrong!! try again");

					},
					
					processData: false,
					contentType: false
				});
				
			});
			
		});
		
	</script>
</body>
</html>