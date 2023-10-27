
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="java.util.*"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	User user=(User)session.getAttribute("currentUser");
	if(user==null){
		response.sendRedirect("login_page.jsp");
	}
%>

<%
	int post_id = Integer.parseInt(request.getParameter("post_id"));
	PostDao d=new PostDao(ConnectionProvider.getConnection());
	Post p=d.getPostByPostId(post_id);
	

%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><%=p.getpTitle() %></title>


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
		
	}

	.post-title{
		font-weight:100;
		font-size:26px;
	}
	.post-content{
		font-weight:100;
		font-size:22px;
	}
	.post-code{
		font-weight:100;
		font-size:20px;
	}
	.post-date{
		font-style:italic;
		
		color:gray
	}
	.post-user-info{
		font-weight:500;
	}
	.row-user{
		border:1px solid #e2e2e2;
	}
	body{
		background:url(images/smooth.avif);
		background-size:cover;
		background-attachment:fixed;
	}
</style>
<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v16.0"></script>

</head>
<body>
	
	<!--  Normal Navbar-->

	<nav class="navbar navbar-expand-lg navbar-dark primary-background">
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
					<a class="dropdown-item" href="#">Programming Languages</a> <a
						class="dropdown-item" href="#">Project Implementation</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#">Data Structures</a>
				</div></li>

			<li class="nav-item"><a class="nav-link" href="#"><span
					class="	fa fa-address-book-o"></span>Contact us</a></li>

			<li class="nav-item"><a class="nav-link" href="#"
				data-toggle="modal" data-target="#add-post-modal"><span
					class="	fa fa-comment"></span> Do Post</a></li>


		</ul>
		<ul class="navbar-nav mr-right">
			<li class="nav-item"><a class="nav-link" href="#!"
				data-toggle="modal" data-target="#profile-Modal"><span
					class="fa fa-user  "></span> <%=user.getName()%></a></li>
			<li class="nav-item"><a class="nav-link" href="LogoutServlet"><span
					class="fa fa-user-plus "></span>Logout</a></li>
		</ul>
	</div>
	</nav>
	
	<!-- Main Content of the body -->
	
	<div class="container">
	
		<div class="row my-4">
		
			<div class="col-md-6  offset-md-3  ">
			
				<div class="card">
					<div class="card-header bg-info text-white">
					
						<h4 class="post-title"><%=p.getpTitle() %></h4>
					
					</div>
					
					<div class="card-body">
					
						<h5 class="post-content"><%=p.getpContent() %></h5>
						
						
						<img class="card-img-top my-4" src="blog_pic/<%=p.getpPic()%>" alt="Card image cap" >
						
						<div class="row my-3  row-user">
							<div class="col-md-7">
							
							
								<%
									UserDao ud=new UserDao(ConnectionProvider.getConnection()); //the method which is getUserIdByUser having by UserDao
								
									User newUser=ud.getUserByUserId(p.getUserId());	//it is return the full detail of the user who post 
								
								%>
								<p class="post-user-info"><a href="#!"><%=newUser.getName() %></a> has posted:</p>
							
							</div>
							<div class="col-md-5">
							
								<p class="post-date"><%= DateFormat.getDateTimeInstance().format(p.getpDate()) %></p>
							
							</div>
						</div>
						
						<div class="post-code">
							
							<pre><%=p.getpCode() %></pre>
						
						</div>
						
						
					</div>
					<div class="card-footer  bg-info">
					
						<%
							LikeDao ld=new LikeDao(ConnectionProvider.getConnection());
						%>
						
						<a href="#!" onclick="doLike(<%=p.getPid()%>,<%=user.getId() %>) " class="btn btn-outline-light"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%=ld.countLikeOnPost(p.getPid()) %></span></a>
			
			
			
						<a href="#!" class="btn btn-outline-light"><i class="fa fa-commenting-o"></i><span> 20</span></a>
						
					
						
						
					</div>
					
					<div class="card-footer">
						<div class="fb-comments" data-href="http://localhost:9498/TechBlogs/show_blog_page.jsp?post_id=<%=p.getPid() %>" data-width="" data-numposts="5"></div>
					</div>
					
				 
				</div>
				<br>
				<a href="profile.jsp" class="btn btn-info btn-lg active" role="button" aria-pressed="true">back</a>
			
			</div>
			
		</div>
	
	</div>
	
	
	
	
		<!-- Modal -->
	<div class="modal fade" id="profile-Modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
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
							<form action="EditServlet" method="post"
								enctype="multipart/form-data">
								<table class="table">
									<tr>
										<td>Id:</td>
										<td><%=user.getId()%></td>
									</tr>

									<tr>
										<td>Name:</td>
										<td><input type="text" class="form-control"
											name="user_name" value="<%=user.getName()%>"></td>
									</tr>
									<tr>
										<td>Email:</td>
										<td><input type="email" class="form-control"
											name="user_email" value="<%=user.getEmail()%>"></td>
									</tr>
									<tr>
										<td>Password:</td>
										<td><input type="password" class="form-control"
											name="user_password" value="<%=user.getPassword()%>"></td>
									</tr>
									<tr>
										<td>Gender:</td>
										<td><%=user.getGender().toUpperCase()%></td>
									</tr>
									<tr>
										<td>About:</td>
										<td><textarea rows="5" class="form-control"
												name="user_about">
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
							<textarea class="form-control" name="pContent"
								style="height: 200px" placeholder="Enter your Content "></textarea>
						</div>
						<div class="form-group">
							<textarea class="form-control" name="pCode" style="height: 200px"
								placeholder="Enter your Program "></textarea>
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


	<script type="text/javaScript" src="js/myjs.js"></script>


</body>
</html>