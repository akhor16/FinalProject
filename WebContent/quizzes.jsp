<%@page import="java.util.ArrayList"%>
<%@page import="JavaClasses.QuizDatabase"%>
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
<style><%@include file="styles/loginStyle.css"%></style>


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
			<%QuizDatabase base = new QuizDatabase();
			ArrayList<String> names = base.getQuizNames();
			%>
				<% for(int i = 0; i < names.size(); i++) { %>
				<div class="m-3 light-bg border rounded"> 
					<div class='m-1'>
					<p class = 'rtl'>
						<%int id = base.getQuizIdByName(names.get(i)); %>
	    				<a class='h2 notify-label mb-1 text-dark' href="<%=request.getContextPath()%>/QuizDescription?id=<%=id%>"><%=names.get(i) %></a>
						<p>Author: <a class = "notify-label mb-0 text-dark" href = "#"> <%= "ყველაზე მაგარი ავტორი"%> </a></p>
						<p>
						 <div class="row a">
							  <div class="column lef a">
							 	 Question Num: <%=4 %>
							  </div>
							  <div class="column cen a">
							  	Duration: <%=60 %> min
							  </div>
							  <div class="column rig a">
							  	<a class = 'notify-label mb-0 text-dark' href = "#">Take a Quiz >> </a>
								</div>
							  
						</div> 
						</p>
						
						
					</div>
				</div>
				<% }%>
			</div>
		</div>
	</div>
</body>
</html>