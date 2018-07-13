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
<link rel='stylesheet' href='styles/create-quiz-style.css'>
<link rel='stylesheet' href='styles/loginStyle.css'>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript"><%@include file="scripts/login-register-script.js"%></script>
<title>Log In to Quiz Website</title>
</head>
<body class="bg">
	<nav class="navbar navbar-expand-lg navbar-light light-bg">
	<div>
		<a
			class="navbar-brand border border-secondary rounded non-transparent"
			href="#"><p class="ml-1 mr-1 mb-auto mt-auto">Quiz Website</p></a>
	</div>
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
						<label for="userNameLogin">User name</label> <input type="text"
							class="form-control" id="userNameLogin" 
							placeholder="Enter user name">
					</div>
					<div class="form-group">
						<label for="passwordLogin">Password</label> <input type="password"
							class="form-control" id="passwordLogin" placeholder="Password">
					</div>

					<div>
						<small class='red-small' id='wrongLogin'>You
							entered wrong user name or password</small>
					</div>
					<div>
						<button type="button" id="loginButton"
							class="btn border border-secondary hover-button">Log In</button>
					</div>
				</form>
			</div>
			<div id="signup" class="tab-pane fade">
				<!--  add validator control -->
				<form data-toggle="validator" role="form">

					<h3>Sign Up</h3>

					<label for="nameRegister">Name:</label>
					<div class="form-group">
						<div>

							<div class="form-group col-sm-6">
								<input type="text" onfocus="fadeOutRedTexts()" class="form-control" id="nameRegister"
									placeholder="Enter Name">
							</div>

							<div class="form-group col-sm-6">
								<input type="text" onfocus="fadeOutRedTexts()" class="form-control" id="lastNameRegister"
									placeholder="Enter Last Name">
							</div>
						</div>


					</div>

					<div class="form-group">
						<label for="userNameRegister">User name</label> <input
							type="text" onfocus="fadeOutRedTexts()" class="form-control" id="userNameRegister"
							placeholder="Enter user name">
					</div>

					<div class="form-group">

						<!-- http://1000hz.github.io/bootstrap-validator/ -->
						<label for="passwordLabel" class="control-label">Password</label>
						<div class="form-group">
							<div>
								<div class="form-group col-sm-6">
									<input type="password" onfocus="fadeOutRedTexts()" data-minlength="6" class="form-control"
										id="passwordRegister" placeholder="Password" required>
									
								</div>
								<div class="form-group col-sm-6">
									<input type="password" onfocus="fadeOutRedTexts()" class="form-control"
										id="passwordRegisterConfirm" data-match="#inputPassword"
										data-match-error="Didn't Match" placeholder="Confirm" required>
									<div class="help-block with-errors"></div>
								</div>
							</div>
							<div>
								<small class='red-small' id='passDidntMatch'>Those passwords did not match. Try again.
								</small>
							</div>
							<div>
								<small class='red-small' id='passMinLen'>Use 6 characters or more for your password
								</small>
							</div>
						</div>
					</div>
					
					<div>
						<small class='red-small' id='fillAllFieldsRegister'>Please fill all the fields in
						</small>
					</div>
					<div>
						<small class='red-small' id='wrongRegister'>The user name you entered is already in use</small>
					</div>
					<div >
						<button type="button" id="registerButton"
							class="btn border border-secondary hover-button">Create
							An Account</button>
					</div>
				</form>
			</div>

		</div>
	</div>
</body>
</html>