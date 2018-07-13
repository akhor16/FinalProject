<%@page import="JavaClasses.Account"%>
<%@page import="JavaClasses.StrPair"%>
<%@page import="JavaClasses.QuizDatabase" %>
<%@page import="JavaClasses.Quiz" %>
<%@page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
    <script src="https://ajax.googleapis.c>om/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    
    <!-- This webpage's costum css files -->
    <style><%@include file="styles/style.css"%></style>
    
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<title>Profile</title>
</head>
<%
		Account acc = (Account)(request.getSession().getAttribute(Account.SESSION_ATTRIBUTE_NAME));
		String id = request.getParameter("id");
		if(acc == null){
			RequestDispatcher rd = request.getRequestDispatcher("loginAndRegister.jsp");
			rd.forward(request, response);
		} else if(id == null){
			RequestDispatcher rd = request.getRequestDispatcher("homepage.jsp");
			rd.forward(request, response);
		} else {
		
		int userId = acc.getUserId();
		QuizDatabase db = new QuizDatabase();
		String loginUserName = db.getUserNameById(userId);
		String userName = db.getUserNameById(Integer.parseInt(id));
	%>
<body class = 'bg'>

  <nav class="navbar navbar-expand-lg navbar-light light-bg">
      <div><a class="navbar-brand border border-secondary rounded non-transparent" href="homepage.jsp"><p class="ml-1 mr-1 mb-auto mt-auto">Quiz Website</p></a></div>

      <ul class="navbar-nav ml-auto">
        <li class="nav-item hover-shadow">
          <a class="nav-link" href="<%=request.getContextPath()%>/homepage.jsp" id = 'home'><h4 class="ml-3 mr-3 mb-auto mt-auto">Home</h4> </a>
        </li>
        <li class="nav-item  hover-shadow">
          <a class="nav-link" href="<%=request.getContextPath()%>/quizzes.jsp" id = 'about'><h4 class="ml-3 mr-3 mb-auto mt-auto">Quizzes</h4> </a>
        </li>
        <li class="nav-item  hover-shadow">
          <a class="nav-link" href="<%=request.getContextPath()%>/user-profile.jsp?id=<%=userId %>"><h4 class="ml-3 mr-3 mb-auto mt-auto h"><%=loginUserName %></h4></a>
        </li>
        <li class="nav-item  hover-shadow">
          <a class="nav-link" href="LogoutServlet?method=get" id = 'logout'><h5 class="ml-3 mr-3 mb-auto mt-auto">Log Out</h5> </a>
        </li>
      </ul>
    </nav>  
    <div class = 'container-fluid mt-3'>
      
      <div class = 'row'>
        <div class = 'col-sm-5'>
          <div class ='col-sm-12 m-1 rounded light-bg p-1'>
            <h1 class = 'display-4 m-1'><%=userName %></h1>
            <h4 class = 'm-1'>Number Of Participations: <%= db.getTakenQuizzesNum(Integer.parseInt(id))%></h4>
            <h4 class = 'm-1'>Number Of Creations: <%= db.getCreatedQuizzesNum(Integer.parseInt(id))%></h4>
          </div>
          
          <div class ='col-sm-12 m-1 mt-3 rounded light-bg p-1'>
            <h2 class = 'text-center'>latest Participations</h2>
          </div>
          
          <%
          List<StrPair> takenQuizIds = db.getTakenQuizzesIDs(Integer.parseInt(id));
          int takenNum = takenQuizIds.size();
          for(int i = 0; i < takenNum && i < 8; i++){
          %>
          <div class ='col-sm-12 m-1 rounded light-bg p-1'>
            <h5><a href = "quiz-summary.jsp?id=<%=takenQuizIds.get(i).getFirst() %>">
            <%=db.getQuiz(Integer.parseInt(takenQuizIds.get(i).getFirst())).getQuizName() %></a></h5>
            <h5>Points: <%=takenQuizIds.get(i).getSecond() %></h5>
          </div>
          
          <%} %>         
        </div>
        
        <div class = 'col-sm-1'></div>
        
        <div class = 'col-sm-6'>
          <div class ='col-sm-12 m-1 rounded light-bg p-1'>
            <h1 class = 'text-center'>Created Quizzes</h1>
          </div>
          <%
          List<String> createdQuizIds = db.getCreatedQuizzesIDs(Integer.parseInt(id));
          int createdNum = createdQuizIds.size();
          for(int i = 0; i < createdNum; i++){
        	  Quiz quiz = db.getQuiz(Integer.parseInt(createdQuizIds.get(i)));
          %>
          <div class ='col-sm-12 m-1 rounded light-bg p-1'>
            <h5><a href = "quiz-summary.jsp?id=<%=createdQuizIds.get(i) %>"><%=quiz.getQuizName() %></a></h5>
            <h5>Number Of Questions: <%=quiz.getQuestionNumber() %></h5>
          </div>
          
          <%} %>
        </div>
      </div>
      
    </div>
 
</body>
</html>
<%}%>