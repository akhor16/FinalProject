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
<!-- This webpage's costum css file -->
<link rel='stylesheet' href='styles/loginStyle.css'>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Log In to Quiz Website</title>
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
			id='about'><h4 class="ml-3 mr-3 mb-auto mt-auto">Quizzes</h4> </a></li>
	</ul>
	</nav>

	<div class="container">
		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#login">Log In</a></li>
			<li><a data-toggle="tab" href="#signup">Sign Up</a></li>
		</ul>

		<div class="tab-content">
			<div id="login" class="tab-pane fade in active">
				<h3>Log In</h3>
				<form role="form" data-toggle="validator">
					<div class="form-group">
						<label for="inputEmail">Email address</label> <input
							type="email" class="form-control" id="exampleInputEmail1"
							aria-describedby="emailHelp" placeholder="Enter email">
					</div>
					<div class="form-group">
						<label for="inputPassword">Password</label> <input
							type="password" class="form-control" id="exampleInputPassword1"
							placeholder="Password">
					</div>
				</form>
				<label class="remember pull-right psT"><input
					type="checkbox" id="remember_me"
					data-analytics="AuthPageRememberMe" data-attr1="master"> <small>Remember
						me</small></label>
				<button type="button"
					class="btn border border-secondary hover-button">Log In</button>
			</div>
			<div id="signup" class="tab-pane fade">
				<!--  add validator control -->
				<form data-toggle="validator" role="form">

					<h3>Sign Up</h3>

					<label for="email">Name:</label>
					<div class="form-group">
						<div>
							
							<div class="form-group col-sm-6">
								<input type="text" class="form-control" id="nameinput"
									aria-describedby="emailHelp" placeholder="Enter Name">
							</div>

							<div class="form-group col-sm-6">
								<input type="text" class="form-control" id="lastnameinput"
									placeholder="Enter Last Name">
							</div>
						</div>


					</div>

					<div class="form-group">
						<label for="exampleInputEmail1">Email address</label> <input
							type="email" class="form-control" id="exampleInputEmail1"
							aria-describedby="emailHelp" placeholder="Enter email">
					</div>

					<div class="form-group">

						<!-- http://1000hz.github.io/bootstrap-validator/ -->
						<label for="passwordLabel" class="control-label">Password</label>
						<div class="form-group">
							<div>
								<div class="form-group col-sm-6">
									<input type="password" data-minlength="6" class="form-control"
										id="registerPassword" placeholder="Password" required>
									<div class="help-block">Minimum of 6 characters</div>
								</div>
								<div class="form-group col-sm-6">
									<input type="password" class="form-control"
										id="registerPasswordConfirm" data-match="#inputPassword"
										data-match-error="Didn't Match" placeholder="Confirm" required>
									<div class="help-block with-errors"></div>
								</div>
							</div>
						</div>
					</div>
					<div class="clearfix msB">
						<label class="remember pull-right psT"><input
							type="checkbox" id="remember_me"
							data-analytics="AuthPageRememberMe" data-attr1="master">
							<small>Remember me</small></label>
						<button type="button"
							class="btn border border-secondary hover-button">Create
							An Account</button>
					</div>
				</form>
			</div>

		</div>
	</div>
</body>
</html>