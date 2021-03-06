<%@page import="JavaClasses.QuizDatabase"%>
<%@page import="JavaClasses.TakeQuizConstants"%>
<%@page import="JavaClasses.Account"%>
<%@page import="java.util.ArrayList"%>
<%@page import="JavaClasses.Quiz"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <!-- Bootstrap CSS -->
  <!-- We Will Be Using Bootstrap Framework For The Front End Of This Project -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
  <!-- This webpage's costum css file -->
  <style><%@include file="styles/style.css"%></style>
  <style><%@include file="styles/take-quiz-style.css"%></style>
  
  <!-- here I use script tag and load javascript code from file directly in it. -->
  <script type="text/javascript"><%@include file="scripts/take-quiz-script.js"%></script>
  
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <title>Taking A Quizz</title>
</head>
<%
		Account acc = (Account)(request.getSession().getAttribute(Account.SESSION_ATTRIBUTE_NAME));
		if(acc == null){
			RequestDispatcher rd = request.getRequestDispatcher("loginAndRegister.jsp");
			rd.forward(request, response);
		} else {
		int userId = acc.getUserId();
		 QuizDatabase base = (QuizDatabase)request.getServletContext().getAttribute(QuizDatabase.ATTRIBUTE_NAME);
		String loginUserName = base.getUserNameById(userId);
		String quizId = request.getParameter("id"); 
	    if(quizId == null){
	    	RequestDispatcher rd = request.getRequestDispatcher("homepage.jsp");
			rd.forward(request, response);
	    }
	   String userName = base.getUserNameById(userId);
	    int id = Integer.parseInt(quizId);
	    Quiz quiz = base.getQuiz(id);%>  
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
	        <a class="nav-link" href="<%=request.getContextPath()%>/user-profile.jsp?id=<%=userId %>"><h4 class="ml-3 mr-3 mb-auto mt-auto h"><%=userName %></h4></a>
	      </li>
	      <li class="nav-item  hover-shadow">
	        <a class="nav-link" href="LogoutServlet?method=get" id = 'logout'><h5 class="ml-3 mr-3 mb-auto mt-auto">Log Out</h5> </a>
	      </li>
      </ul>
    </nav>
    <div class = 'container-fluid mt-3'>
      <div class = 'row justify-content-center'>
        <div class = 'col-sm-2'></div>

        <div class = 'col-sm-8'>
          
          <div class = 'lighter-bg border rounded col-sm-12 mb-3 mt-3'>
            <h1 class = 'word-wrap text-center'><%=quiz.getQuizName() %></</h1>
          </div>
          <form>
          <%for(int i=0;i<quiz.getQuestionNumber();i++){ %>
            <div class = 'lighter-bg border rounded col-sm-12 mb-3 mt-3'>
	            <h1 class="display-4"> Question <%=i+1 %></h1>
	            <div class ='row m-1'>
	              <div class = 'question-bg col-sm-12 rounded'>
	                <p><%= quiz.getQuestionText(i)%></p>
	              </div>
	              <!-- fill in the blank field man -->
	              <%if(quiz.getType(i) == Quiz.FILL_IN_NUM){ %>
	                 <%for(int j=0;j<quiz.getFillInQuestionWordNum(i);j++){ %>
	                   <input type = 'text' class = 'form-control login-input m-2' placeholder="Field No <%=j+1%>" name = "<%=TakeQuizConstants.FILL_IN_ANSWER + "" + j + "" + i%>">
	                 <%} %>
	              <%} %>
	              <!-- regular answer field -->
	              <%if(quiz.getType(i) == Quiz.OPEN_ENDED_NUM){ %>
                  <input type="text" name="<%=TakeQuizConstants.REGULAR_ANSWER + "" +i %>" class ='form-control login-input m-1' placeholder="Enter Your Answer">
	              <%} %>
	              <!-- multiple choice answer field -->
	              <%if(quiz.getType(i) == Quiz.MULTI_CHOICE_NUM){  %>
	              <%ArrayList<String> answers = quiz.getMultiChoiceQuestionPossibleAnswers(i); %>
		              <div class = 'col-sm-12'>
		                <%for(int j=0;j<answers.size();j++){ %>
			                <div class = 'radio'>
			                  <input type = 'radio' name = '<%=TakeQuizConstants.RADIO_ANSWER + "" + i%>' value = '<%=answers.get(j)%>'>
			                  <label><%=answers.get(j) %></label>
			                </div>
		                <%} %>
		              </div>
	              <%} %>
	              <!-- matching answer field -->
	              <%if(quiz.getType(i) == Quiz.MATCHING_NUM){  %>
                  <%  ArrayList<String> keys = quiz.getMatchingQuestionKeys(i); %>
                  <%  ArrayList<String> values = quiz.getMatchingQuestionValues(i); %>
	                <div class = 'col-sm-12'>
		                <%for(int j=0;j<keys.size();j++){ %>
			                <div class = 'm-2'>
			                  <label class = 'mr-5'><%=keys.get(j) %></label>
			                  <select class="login-input" name = "<%=TakeQuizConstants.MATCHING_ANSWER + "" + j + "" + i%>">
                          <%for(int k=0;k<keys.size();k++){ %>
                            <option value = '<%=values.get(k)%>'><%= values.get(k)%></option>
                          <%} %>
			                  </select>
			                </div>
                    <%} %>
		              </div>
                <%} %>
	            </div>
            </div>
          <%} %>
          <div class = 'lighter-bg border rounded col-sm-12 mb-3 mt-3'>
            
            
            <input type = 'hidden' name = '<%=TakeQuizConstants.QUIZ_NAME %>' value = '<%=quiz.getQuizName()%>'>
            <input type = 'button' id = 'submit' class = 'btn btn-dark' value = 'Submit This Quiz' >
          </div>
          </form>
          <div class = 'result lighter-bg border rounded col-sm-12 mb-3 mt-3' id = 'result'>
            <h1 class = 'display-4'>you scored points</h1>
            <input type = 'hidden' id = 'quiz-id' value = '<%=id %>'>
            <button class = 'btn form-control btn-dark' id = 'go-back'>Get Back To Quiz Page</button>
          </div>
      
          
        </div>
        <div class = 'col-sm-2'></div>
      </div>
    </div>
  </body>

</html>
<%}%>