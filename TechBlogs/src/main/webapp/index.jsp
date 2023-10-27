<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home page</title>
<!-- for Bootstrap... -->

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

	<%@include file="normal_navbar.jsp" %>
	
		

	<!--  Banner  -->

	<div class="container-fluid p-0 m-0">

		<div class="jumbotron primary-background text-white banner-background">

			<div class="container">

				<h3 class="display-3">Welcome to TechBlog</h3>
				<p>Welcome to technical blog ,A programming language is a system
					of notation for writing computer programs.[1] Most programming
					languages are text-based formal languages, but they may also be
					graphical. They are a kind of computer language.</p>

				<p>The description of a programming language is usually split
					into the two components of syntax (form) and semantics (meaning),
					which are usually defined by a formal language. Some languages are
					defined by a specification document (for example, the C programming
					language is specified by an ISO Standard) while other languages
					(such as Perl) have a dominant implementation that is treated as a
					reference. Some languages have both, with the basic language
					defined by a standard and extensions taken from the dominant
					implementation being common. Programming language theory is the
					subfield of computer science that studies the design,
					implementation, analysis, characterization, and classification of
					programming languages.</p>

				<button class="btn btn-outline-light btn-lg">
					<span class="fa fa-check-square-o"></span> Start ! It's Free
				</button>
				<a href="Login.jsp" class="btn btn-outline-light btn-lg">
					<span class="fa fa-user-o fa-spin"></span> Login
				</a>

			</div>

		</div>

	</div>


	<!-- cards -->

	<div class="container">

		<div class="row  mb-2">

			<div class="col-md-4">

				<div class="card">

					<div class="card-body">
						<h5 class="card-title">Java Programming Language</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							more</a>
					</div>
				</div>

			</div>

			<div class="col-md-4">

				<div class="card">

					<div class="card-body">
						<h5 class="card-title">Java Programming Language</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							more</a>
					</div>
				</div>

			</div>

			<div class="col-md-4">

				<div class="card">

					<div class="card-body">
						<h5 class="card-title">Java Programming Language</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							more</a>
					</div>
				</div>

			</div>

		</div>

		<div class="row">

			<div class="col-md-4">

				<div class="card">

					<div class="card-body">
						<h5 class="card-title">Java Programming Language</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							more</a>
					</div>
				</div>

			</div>

			<div class="col-md-4">

				<div class="card">

					<div class="card-body">
						<h5 class="card-title">Java Programming Language</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							more</a>
					</div>
				</div>

			</div>

			<div class="col-md-4">

				<div class="card">

					<div class="card-body">
						<h5 class="card-title">Java Programming Language</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							more</a>
					</div>
				</div>

			</div>

		</div>

	</div>



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



</body>
</html>


