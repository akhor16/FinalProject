<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Bootstrap CSS -->
<!-- We Will Be Using Bootstrap Framework For The Front End Of This Project -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">

<!-- Bootstrap is using JQuery and bootstrap.js aswell so i include their cdn-s -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

<!-- This webpage's costum css file -->
<style><%@include file="styles/style.css"%></style>


<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Quizzes</title>

</head>
<body class="bg">
	<nav class="navbar navbar-expand-lg navbar-light light-bg">
	<div>
		<a
			class="navbar-brand border border-secondary rounded non-transparent"
			href="#"><p class="ml-1 mr-1 mb-auto mt-auto">Quiz Website</p></a>
	</div>

	<ul class="navbar-nav ml-auto">
		<li class="nav-item hover-shadow"><a class="nav-link" href="#"
			id='home'><h4 class="ml-3 mr-3 mb-auto mt-auto">Home</h4> </a></li>
		<li class="nav-item  hover-shadow"><a class="nav-link" href="#"
			id='login'><h4 class="ml-3 mr-3 mb-auto mt-auto h">Profile</h4></a></li>
		<li class="nav-item  hover-shadow"><a class="nav-link" href="#"
			id='register'><h5 class="ml-3 mr-3 mb-auto mt-auto">Log Out</h5>
		</a></li>
	</ul>
	</nav>

	<div class="container-fluid mt-3">
		<div class='row justify-content-center '>
			<div class="col-sm-8 border">

				<div class="m-3 light-bg border rounded">
					<div class='m-1'>
						<h1 class='display-4'>Some News 1</h1>
						<p>some news text or smth</p>
						<button type="button"
							class="btn border border-secondary hover-button">Learn
							More >></button>
					</div>
				</div>

				<div class="m-3 light-bg border rounded">
					<div class='m-1'>
						<h1 class='display-4'>Some News 1</h1>
						<p>some news text or smth</p>
						<button type="button"
							class="btn border border-secondary hover-button">Learn
							More >></button>
					</div>
				</div>

			</div>

			

		</div>
	</div>



</body>
</html>