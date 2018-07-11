<%@page import="JavaClasses.Quiz"%>
<%@page import="JavaClasses.QuizDatabase"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <!-- Bootstrap CSS -->
    <!-- We Will Be Using Bootstrap Framework For The Front End Of This Project -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    
    <!-- Bootstrap is using JQuery and bootstrap.js aswell so i include their cdn-s -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    
    <!-- This webpage's costum css files -->
    <style><%@include file="styles/style.css"%></style>
    <style><%@include file="styles/quiz-summary-style.css"%></style>
    
    <script type="text/javascript"><%@include file="scripts/quiz-summary-script.js"%></script>
    
    <title>Summary</title>
</head>
<body class = 'bg'>
  
  <nav class="navbar navbar-expand-lg navbar-light light-bg">
      <div><a class="navbar-brand border border-secondary rounded non-transparent" href="#"><p class="ml-1 mr-1 mb-auto mt-auto">Quiz Website</p></a></div>

      <ul class="navbar-nav ml-auto">
        <li class="nav-item hover-shadow">
          <a class="nav-link" href="<%=request.getContextPath()%>/homepage.jsp" id = 'home'><h4 class="ml-3 mr-3 mb-auto mt-auto">Home</h4> </a>
        </li>
        <li class="nav-item  hover-shadow">
          <a class="nav-link" href="<%=request.getContextPath()%>/quizzes.jsp" id = 'about'><h4 class="ml-3 mr-3 mb-auto mt-auto">Quizzes</h4> </a>
        </li>
        <li class="nav-item  hover-shadow">
          <a class="nav-link" href="#" id ='login'><h4 class="ml-3 mr-3 mb-auto mt-auto">Profile</h4></a>
        </li>
        <li class="nav-item  hover-shadow">
          <a class="nav-link" href="#" id = 'register'><h5 class="ml-3 mr-3 mb-auto mt-auto">Log Out</h5> </a>
        </li>
      </ul>
    </nav>
    <%QuizDatabase base = (QuizDatabase)request.getServletContext().getAttribute(QuizDatabase.ATTRIBUTE_NAME);
    Quiz quiz = base.getQuiz(Integer.parseInt(request.getParameter("id")));
    %>
    
    <div class = 'container-fluid mt-3'>
    
      <div class = 'row'>
        <div class = 'col-sm-8'>
          <div class ='light-bg rounded m-1 p-1'>
            <h1 class = 'display-4 m-3'><%=quiz.getQuizName() %></h1>
            <h3 class ='m-2'>Author: <label class ='text-info author'>Rezo</label></h3>
            <h4 class = 'm-2'>Number of Questions: <%=quiz.getQuestionNumber() %></h4>
            <div class = 'm-2 lighter-bg rounded'>
              <h5><%=quiz.getQuizDescription() %></h5>
            </div>
            <input type = 'hidden' id = 'start-path' value = '<%=request.getContextPath() + "/take-quiz.jsp?id=" + request.getParameter("id")%>'>
            <input type = 'hidden' id = 'edit-path' value = '<%=request.getContextPath() + "/edit-quiz.jsp?id=" + request.getParameter("id")%>'>
            <button class = 'btn btn-dark m-1 mr-3' id = 'start' ><h3>Start Quiz</h3></button>
            <button class = 'btn btn-info m-1 ml-3' id = 'edit'><h3>Quiz Edition</h3></button>
          </div>
          
          <%for(int i=0;i<4;i++){ %>
          <div class ='light-bg rounded m-1 mt-4 p-1 col-sm-10'>
            <h3>You Scored 9 Points <label class = 'float-right'>DD/MM/YYYY</label> </h3>
          </div>
          <%} %>
        </div>
        <div class = 'col-sm-4'>
          <div class ='light-bg rounded m-1 p-1 text-center'>
            <h3>Average Score: 67</h3>
          </div>
          
          <div class ='light-bg rounded m-1 mt-4 p-1'>
            <h3 class = 'text-center'>Top Performers</h3>
            <div class ='border'>
              <h4>Some dude <label class = 'float-right mr-3'>80</label></h4>
            </div>
            <div class ='border'>
              <h4>Some dude <label class = 'float-right mr-3'>70</label></h4>
            </div>
            <div class ='border'>
              <h4>Some dude <label class = 'float-right mr-3'>60</label></h4>
            </div>
          </div>
        </div>
        
        
      </div>
    
    </div>
    
</body>
</html>