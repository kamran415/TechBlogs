<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Message"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Profile Page</title>


<%@page import="com.tech.blog.entities.User"%>

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
body{
		background:url(images/smooth1.avif);
		background-size:cover;
		background-attachment:fixed;
	}
</style>
</head>
<body>

	<%
	User user = (User) session.getAttribute("currentUser");  //for getting the all information of the user 
	%>
	<!--  Normal Navbar-->
	
	<nav class="navbar navbar-expand-lg navbar-dark primary-background ">
	<a class="navbar-brand" href="#"><span class="fa fa-asterisk">TechBlog</span></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="index.jsp"><span
					class=" fa fa-bell-o"></span>Home <span class="sr-only">(current)</span>
			</a></li>

			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"><span class="fa fa-check-square-o">
				</span>Categories </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a class="dropdown-item" href="#">Python Programming</a> <a
						class="dropdown-item" href="#">Java Programming</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#">Web Technology</a>
				</div></li>
			<li class="nav-item"><a class="nav-link" href="#"><span
					class="	fa fa-address-book-o"></span>Contact us</a></li>
			<li class="nav-item"><a class="nav-link" href="#"
				data-toggle="modal" data-target="#add-post-modal"><span
					class="	fa fa-comment"></span> Do Post</a></li>
		</ul>
		<ul class="navbar-nav mr-right">
			<li class="nav-item"><a class="nav-link" href="#!"
				data-toggle="modal" data-target="#profile-Modal"><span class="fa fa-user  "></span> <%=user.getName()%></a></li>
			<li class="nav-item"><a class="nav-link" href="LogoutServlet"><span class="fa fa-user-plus "></span>Logout</a></li>
		</ul>
	</div>
	</nav> 
	


	<!-- end of navbar -->

	<%
	Message m = (Message) session.getAttribute("msg");
	if (m != null) {
	%>
	<div class="alert <%=m.getCssClass()%>" role="alert"><%=m.getContent()%></div>

	<%
	session.removeAttribute("msg");

	}
	%>

	<main>
	<div class="container ">
		<div class="row mt-4">
			<!--  first column-->
			<div class="col-md-4">
				<!-- Categories -->
				<div class="list-group">
					<a href="#" onclick="getPosts(0,this)"class="c-link list-group-item list-group-item-action active">
					All	Posts </a>

					<!-- Categories -->

					<%
					
					PostDao d = new PostDao(ConnectionProvider.getConnection());
					ArrayList<Category> list1 = d.getAllCategories();
					for (Category cc : list1) {
					%>

					<a href="#" onclick="getPosts(<%=cc.getCid()%>,this)" class="c-link list-group-item list-group-item-action "><%=cc.getName()%>
					</a>
					<%
					}
					%>
				</div>


			</div>

			<!-- second column -->
			<div class="col-md-8" id="post-container">
				<!-- Posts -->
				
				
				<div class="container text-center mt-4" id="loader">
					<i class="fa fa-refresh fa-3x fa-spin"></i>
					<h3 class="mt-3">Loading...</h3>

				</div>
 				<div class="container-fluid" id="post-container"></div>  <!--   jo content aayega dynamically load hoke wo yahan ayega aur tak loader dikhayi dega  --> 
				

			</div>
		</div>

	</div>
	</main>



	<!-- start of profile model -->

	<!-- Button trigger modal -->

	<!-- Modal -->
	<div class="modal fade" id="profile-Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header   primary-background text-white">
					<h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container text-center">
						<h6>
							<img src="pics/<%=user.getProfile()%>" class="img-fluid"
								style="border-radius: 50%">
						</h6>
						<h5 class="modal-title  mt-3" id="exampleModalLabel"><%=user.getName()%></h5>
						<!-- Details -->
						<div id="profile-details">

							<table class="table table-striped">

								<tbody>
									<tr>
										<th scope="row">Id:</th>
										<td><%=user.getId()%></td>

									</tr>
									<tr>
										<th scope="row">Email:</th>
										<td><%=user.getEmail()%></td>

									</tr>
									<tr>
										<th scope="row">Gender:</th>
										<td><%=user.getGender()%></td>

									</tr>
									<tr>
										<th scope="row">Status:</th>
										<td><%=user.getAbout()%></td>

									</tr>
									<tr>
										<th scope="row">Registered on:</th>
										<td><%=user.getDateTime().toString()%></td>

									</tr>
								</tbody>
							</table>

						</div>
						<div id="profile-edit" style="display: none;">
							<h4 class="mt-2">Please Edit Carefully</h4>
							<form action="EditServlet" method="post"enctype="multipart/form-data">
								<table class="table">
									<tr>
										<td>Id:</td>
										<td><%=user.getId()%></td>
									</tr>
									<tr>
										<td>Name:</td>
										<td><input type="text" class="form-control"  name="user_name" value="<%=user.getName()%>"></td>
									</tr>
									<tr>
										<td>Email:</td>
										<td><input type="email" class="form-control" name="user_email" value="<%=user.getEmail()%>"></td>
									</tr>
									<tr>
										<td>Password:</td>
										<td><input type="password" class="form-control" name="user_password" value="<%=user.getPassword()%>"></td>
									</tr>
									<tr>
										<td>Gender:</td>
										<td><%=user.getGender().toUpperCase()%></td>
									</tr>
									<tr>
										<td>About:</td>
										<td><textarea rows="5" class="form-control" name="user_about">
												<%=user.getAbout()%>		
										</textarea></td>
									</tr>
									<tr>
										<td>New Profile:</td>
										<td><input type="file" name="image" class="form-control">
										</td>
									</tr>
								</table>
								<div class="container">
									<button type="submit" class="btn btn-outline-success">Save</button>
								</div>
							</form>
						</div>
					</div>


				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button id="edit-profile-btn" type="button"
						class="btn btn-primary ">Edit</button>
				</div>
			</div>
		</div>
	</div>
	<!-- End of profile  model-->

	<!-- Add post model -->
	<!-- Modal -->
	<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header bg-info text-white">
					<h5 class="modal-title" id="exampleModalLabel">Provide the
						post detail</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<form id="add-post-form" action="addPostServlet" method="post">
						<div class="form-group">
							<select class="form-control" name="cid">
								<option selected disabled>---select category---</option>
								<%
								PostDao postd = new PostDao(ConnectionProvider.getConnection());
								ArrayList<Category> list = postd.getAllCategories();
								for (Category c : list) {
								%>
								<option value="<%=c.getCid()%>"><%=c.getName()%></option>
								<%
								}
								%>
							</select>

						</div>
						<div class="form-group"> 
							<input type="text" name="pTitle" placeholder="Enter post Title"
								class="form-control">
						</div>
						<div class="form-group">
							<textarea class="form-control" name="pContent" style="height: 200px" placeholder="Enter your Content "></textarea>
						</div>
						<div class="form-group">
							<textarea class="form-control" name="pCode" style="height: 200px" placeholder="Enter your Program "></textarea>
						</div>
						<div class="form-group">
							<lable>Select your pic</lable>
							<br> <input type="file" name="pic">
						</div>
						<div class="container text-center bg-info text-white">
							<br>
							<button type="submit" class="btn btn-outline-light">Post</button>
							<br> <br>
						</div>
					</form>

				</div>

			</div>
		</div>
	</div>
	<!-- javaScript -->

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
		crossorigin="anonymous">
		
	</script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
	<script>
		$(document).ready(function() {

			let status = false;

			$('#edit-profile-btn').click(function() {
				//	alert("button clicked")
				if (status == false) {
					$("#profile-details").hide()

					$("#profile-edit").show();

					status = true;
					$(this).text("Back")
				} else {
					$("#profile-details").show()

					$("#profile-edit").hide();

					status = false;
					$(this).text("Edit")
				}

			})
		});
	</script>
	<!--  	now add post javaScript   -->

	<script>
		$(document)
				.ready(
						function(e) {
							$("#add-post-form")
									.on(
											"submit",
											function(event) {
												//this code gets called when form is submitted
												event.preventDefault();
												console
														.log("you have clicked on submitted..")

												let form = new FormData(this); // FormData stores the all data of the form  where we writing the code inside the add-post-form thats why it store into Form data

												//Now requesting to server
												$
														.ajax({

															url : "AddPostServlet",
															type : 'POST',
															data : form,
															success : function(
																	data,
																	textStatus,
																	jqXHR) {
																//success....
																console
																		.log(data);
																if (data.trim() == 'done') {
																	swal(
																			"Good Job !",
																			"saved successfully",
																			"success");

																} else {
																	swal(
																			"Error !",
																			"Something went wrong try Again.....",
																			"error");
																}

															},
															error : function(
																	jqXHR,
																	textStatus,
																	errorThrown) {
																// error...

																swal(
																		"Error !",
																		"Something went wrong try Again",
																		"error");
															},
															processData : false, // if we will not do it 
															contentType : false

														})

											})
						})
	</script>
	
	<!-- Loading page using Ajax...... -->
	
	<script>
	function getPosts(catId,temp){
		$("#loader").show();
		$("#post-container").hide()
		$(".c-link").removeClass('active')
		
		$.ajax({
			url:"load_post.jsp",
			data:{cid:catId},
			success:function(data,textStatus,jqXHR){
				console.log(data);
				$("#loader").hide();
				$("#post-container").show();
				$("#post-container").html(data)
				$(temp).addClass('active')
			}
		})
	}	
	
	$(document).ready(function (e){
		
			let allPostRef=$(".c-link")[0]  // by default active state set on all posts"0th position which is all post"
			getPosts(0,allPostRef)
		})
	</script>
</body>
</html>