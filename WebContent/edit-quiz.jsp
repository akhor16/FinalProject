<%@page import="java.util.ArrayList"%>
<%@page import="JavaClasses.Quiz"%>
<%@page import="JavaClasses.QuizDatabase"%>
<%@page import="JavaClasses.CreateQuizConstants"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Bootstrap CSS -->
    <!-- We Will Be Using Bootstrap Framework For The Front End Of This Project -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    
    <!-- Bootstrap is using JQuery and bootstrap.js aswell so i include their cdn-s -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    
    <!-- This webpage's costum css files -->
    <style><%@include file="styles/style.css"%></style>
    <style><%@include file="styles/create-quiz-style.css"%></style>
    
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    
    <!-- Changed line below because javascript src = 'link' wasn't able to load on jsp file -->
    <!-- here I use script tag and load javascript code from file directly in it. -->
    <script type="text/javascript"><%@include file="scripts/script.js"%></script>
    <title>Edit Quiz</title>
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
    int id = Integer.parseInt(request.getParameter("id"));
    Quiz quiz = base.getQuiz(id);
    %>

    <div class = 'container-fluid mt-3'>
      <div class = 'row justify-content-center'>
        <div class = 'col-sm-2 border'>asd</div>

        <div class = 'col-sm-8 border'>
          <form action = 'EditQuiz' method = 'POST'>
            <div class = 'lighter-bg border rounded col-sm-12'>
              <h2 class = 'm-2 display-4'> Editing Quiz: </h2>
              <div class ='row m-1'>
                <input type="text" name = '<%=CreateQuizConstants.QUIZ_NAME%>' class="form-control light-bg login-input" value = '<%=quiz.getQuizName() %>' placeholder="Quiz Name" maxlength="61" id ='input-quizname'>
                <input type = 'hidden' name = 'quiz-id' value = '<%=id%>'>
                <small class = 'red-small' id = 'min-limit'>sorry, but you should enter longer name</small>
                 
              </div>
  
              <div class ='row m-1'>
                <textarea name = '<%=CreateQuizConstants.QUIZ_DESCRIPTION%>' class="form-control light-bg login-input " 
                    placeholder="Quiz Description" rows="6" cols="50" maxlength="550" id ='quiz-desc'><%=quiz.getQuizDescription() %></textarea>
                <small class = 'red-small' id = 'desc-limit'>sorry but you should enter more description</small>
              </div>
  
  
            </div>
            
            
            <div class = ''>
              <div class = 'lighter-bg border rounded col-sm-12 mt-3'>
                <h1 class ='display-4 m-2'> Questions:</h1>
              </div>
              
              <%for(int i=0;i<quiz.getQuestionNumber();i++){ %>
              <div class = 'lighter-bg border rounded col-sm-12 mt-3 mb-3' id = 'question'>
                <div class = 'row'>
                  <h3 class ='m-1'>Question <%=i+1 %>:</h3>
                  <button class = 'btn btn-danger ml-auto m-1' type = 'button' id = 'x-button' disabled>X</button>
                </div>
                <select name = '<%=CreateQuizConstants.QUESTION_TYPE%>1' class="form-control login-input" placeholder = 'Question Type' id = 'select' disabled>
                  <%if(quiz.getType(i) == Quiz.MULTI_CHOICE_NUM) %><option value = '#multiple-choice'>Multiple Choice</option>
                  <%if(quiz.getType(i) == Quiz.OPEN_ENDED_NUM) %><option value = '#open-ended'>Open Ended</option>
                  <%if(quiz.getType(i) == Quiz.FILL_IN_NUM) %><option value = '#fill-blank'>Fill In The Blank</option>
                  <%if(quiz.getType(i) == Quiz.MATCHING_NUM) %><option value = '#match'>Matching</option>
                </select>
                <%String questionDesc = quiz.getQuestionText(i); %>
                <%if(quiz.getType(i) == Quiz.FILL_IN_NUM){
                	questionDesc = quiz.getFullFillInQuestionText(i);%>
                  <input type = 'hidden' value = '<%=Quiz.FILL_IN_NUM%>' name = 'question-type<%=i%>'>
                <%} %>
                <textarea name = '<%=CreateQuizConstants.QUESTION_DESCRIPTION + "" + i%>' class="form-control light-bg login-input m-1" 
                      placeholder="Question:" rows="6" cols="50" maxlength="1200" id ='textarea'><%=questionDesc %> </textarea>
                
                
                <!-- MULTIPLE CHOICE DIV -->
                <%if(quiz.getType(i) == Quiz.MULTI_CHOICE_NUM){ %>
                  <input type = 'hidden' value = '<%=Quiz.MULTI_CHOICE_NUM%>' name = 'question-type<%=i%>'>
                  <%ArrayList<String> answers = quiz.getMultiChoiceQuestionPossibleAnswers(i); %>
	                <input type = 'hidden' name = 'ans-num<%=i %>' value = '<%=answers.size() %>' >
	                <div id = 'multiple-choice' class = 'm-2'>
	                <%for(int j=0;j<answers.size();j++){ %>       
                    <div class="radio m-3">
	                    <label>
		                    <input type="radio" name="<%=CreateQuizConstants.QUESTION_RADIO + "" + i%>" value = '<%=j%>' 
		                    <%if(quiz.checkMultiChoiceQuestionAnswer(i, answers.get(j))){ %> checked <%} %>>
	                    </label>
	                    <input name = '<%=CreateQuizConstants.FIRST_OPTION + "" + i + j%>' type = 'text' class = 'login-input' 
	                    value = "<%=answers.get(j) %>" placeholder = 'Enter Option' >
	                  </div>
	                <%} %>
	                  
	                </div>
                <%} %>
                
                <!-- OPEN ENDED DIV -->
                <%if(quiz.getType(i) == Quiz.OPEN_ENDED_NUM){ %>
                  <input type = 'hidden' value = '<%=Quiz.OPEN_ENDED_NUM%>' name = 'question-type<%=i%>'>
                  <%ArrayList<String> answers = quiz.getOpenEndedAnswers(i); %>
                  <input type = 'hidden' name = 'ans-num<%=i %>' value = '<%=answers.size() %>' >
	                <div id = 'open-ended' class = 'm-2'>
	                  <% for(int j=0;j<answers.size();j++){%>
	                  <div id = 'answer1' class = 'mt-1'>
	                    <input name = '<%=CreateQuizConstants.ANSWER + i + j%>' type = 'text' class = 'login-input open-ended-field' 
	                    value = '<%=answers.get(j) %>' placeholder="Type Answer" maxlength="100" id = 'answer-field1' >
	                    <button class = 'btn btn-light ml-2 minus-btn mt-2' type = 'button' data-toggle="tooltip" title="remove Answer" disabled> - </button>
	                  </div>
	                  <%} %>
	                  <input type = 'hidden' name = '<%=CreateQuizConstants.ANSWER_NUM %>1' value = '<%=answers.size() %>' id = 'answer-num'>
	                </div>
	                <div id = 'fill-blank' class = 'hidden'>
	                  <small>The Blank Words Should Be Double Parentheses.</small>
	                  <small>Example: ((London)) Is The Capital of England</small>
	                </div>
	                
                <%} %>
                
                <!-- MATCHING DIV-->
                <%if(quiz.getType(i) == Quiz.MATCHING_NUM){ %>
                  <input type = 'hidden' value = '<%=Quiz.MATCHING_NUM%>' name = 'question-type<%=i%>'>
	                
	                <div id = 'match'>
	                <%ArrayList<String> keys = quiz.getMatchingQuestionKeys(i);
	                 ArrayList<String> values = quiz.getMatchingQuestionValues(i);
	                %>
	                <input type = 'hidden' name = 'ans-num<%=i %>' value = '<%=keys.size() %>' >
	                  <%for(int j=0;j<keys.size();j++){ %> 
	                  <div  class = 'row'>
	                    <input name = '<%=CreateQuizConstants.LEFT_MATCHING + i + j%>' type = 'text' class = 'login-input match-field m-3' 
	                    value = '<%=keys.get(j) %>' placeholder="Matching One" maxlength="100" id = 'answer-field1' >
	                    
	                    <input name = '<%=CreateQuizConstants.RIGHT_MATCHING + i + j%>'type = 'text' class = 'login-input match-field m-3' 
	                    value = '<%=values.get(j)%>'placeholder="Matching One" maxlength="100" id = 'answer-field1' >
	                  </div>
	                  <%} %>
	                </div>
	              
                <%} %>
              </div>
              <%} %>
              
           
              <input type = 'hidden' name = '<%=CreateQuizConstants.QUESTION_NUM %>' value = '<%=quiz.getQuestionNumber() %>' id = 'questionNum'>
    
              <div class = 'lighter-bg border rounded col-sm-12 mt-3 mb-3'>
                <input id = 'sbm' type = 'submit' class = 'btn btn-dark m-3' value = 'Submit Quiz!'>
                <button class = 'btn btn-danger m-3'>Cancel lol</button>
                <small class = 'red-small' id = 'null-inputs'>You Should Fill All The Fields</small>
              </div>
              
            </div>
                        
          </form>
        </div>
        
        <div class = 'col-sm-2 border'> </div>

      </div>


    </div>


  </body>






  </body>
</html>