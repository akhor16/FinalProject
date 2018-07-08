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
    <title>Create Quiz</title>
</head>

<body class = 'bg'>
    <nav class="navbar navbar-expand-lg navbar-light light-bg">
      <div><a class="navbar-brand border border-secondary rounded non-transparent" href="#"><p class="ml-1 mr-1 mb-auto mt-auto">Quiz Website</p></a></div>

      <ul class="navbar-nav ml-auto">
        <li class="nav-item hover-shadow">
          <a class="nav-link" href="#" id = 'home'><h4 class="ml-3 mr-3 mb-auto mt-auto">Home</h4> </a>
        </li>
        <li class="nav-item  hover-shadow">
          <a class="nav-link" href="#" id = 'about'><h4 class="ml-3 mr-3 mb-auto mt-auto">Quizzes</h4> </a>
        </li>
        <li class="nav-item  hover-shadow">
          <a class="nav-link" href="#" id ='login'><h4 class="ml-3 mr-3 mb-auto mt-auto">Profile</h4></a>
        </li>
        <li class="nav-item  hover-shadow">
          <a class="nav-link" href="#" id = 'register'><h5 class="ml-3 mr-3 mb-auto mt-auto">Log Out</h5> </a>
        </li>
      </ul>
    </nav>

    <div class = 'container-fluid mt-3'>
      <div class = 'row justify-content-center'>
        <div class = 'col-sm-2 border'>asd</div>

        <div class = 'col-sm-8 border'>
          <form action = 'CreateQuiz' method = 'POST'>
	          <div class = 'lighter-bg border rounded col-sm-12 first-stage'>
	            <h2 class = 'm-2 display-4'> Createing Quiz: </h2>
	            <div class ='row m-1'>
	              <input type="text" name = '<%=CreateQuizConstants.QUIZ_NAME%>' class="form-control light-bg login-input" placeholder="Quiz Name" maxlength="61" id ='input-quizname'>
	              <small class = 'red-small' id = 'min-limit'>sorry, but you should enter longer name</small>
	               
	            </div>
	
	            <div class ='row m-1'>
	              <textarea name = '<%=CreateQuizConstants.QUIZ_DESCRIPTION%>' class="form-control light-bg login-input " placeholder="Quiz Description" rows="6" cols="50" maxlength="550" id ='quiz-desc'></textarea>
	              <small class = 'red-small' id = 'desc-limit'>sorry but you should enter more description</small>
	            </div>
	
	            <select name = '<%=CreateQuizConstants.TIME_LIMIT%>' class="form-control login-input" id="sel1" placeholder = 'Select Time'>
	              <option value = '1'>No Time Limit (Click To Choose)</option>
	              <option value = '2'>10 min</option>
	              <option value = '3'>15 min</option>
	              <option value = '4'>20 min</option>
	              <option value = '4'>30 min</option>
	              <option value = '4'>45 min</option>
	            </select>
	
	            <button type="button" class="btn btn-dark m-3"  id = 'continue-btn'> Continue >> </button>
	            <button type="button" class="btn btn-danger m-3" id = 'an'> Cancel :( </button>
	
	          </div>
	          
	          
            <div class = 'second-stage'>
		          <div class = 'lighter-bg border rounded col-sm-12 mt-3'>
		            <h1 class ='display-4 m-2'> Questions:</h1>
		          </div>
		          <div class = 'lighter-bg border rounded col-sm-12 mt-3 mb-3' id = 'question'>
		            <div class = 'row'>
		              <h3 class ='m-1'>Question 1:</h3>
		              <button class = 'btn btn-danger ml-auto m-1' type = 'button' id = 'x-button'>X</button>
		            </div>
		            <select name = '<%=CreateQuizConstants.QUESTION_TYPE%>1' class="form-control login-input" placeholder = 'Question Type' id = 'select'>
		              <option value = '0'>Choose Question Type</option>
		              <option value = '#multiple-choice'>Multiple Choice</option>
		              <option value = '#open-ended'>Open Ended</option>
		              <option value = '#fill-blank'>Fill In The Blank</option>
		              <option value = '#match'>Matching</option>
		            </select>
		            <textarea name = '<%=CreateQuizConstants.QUESTION_DESCRIPTION%>1' class="form-control light-bg login-input m-1" placeholder="Question:" rows="6" cols="50" maxlength="1200" id ='textarea'></textarea>
		            <div id = 'multiple-choice' class = 'm-2 hidden'>
		              <div class="radio m-3">
		                <label><input type="radio" name="<%=CreateQuizConstants.QUESTION_RADIO%>1" value = '0' disabled checked></label>
		                <input name = '<%=CreateQuizConstants.FIRST_OPTION %>1' type = 'text' class = 'login-input' placeholder="Type Answer" disabled>
		              </div>
		              <div class="radio m-3">
		                <label><input type="radio" name="<%=CreateQuizConstants.QUESTION_RADIO%>1" value = '1' disabled></label>
		                <input name = '<%=CreateQuizConstants.SECOND_OPTION %>1' type = 'text' class = 'login-input' placeholder="Type Answer" disabled>
		              </div>
		              <div class="radio m-3">
		                <label><input type="radio" name="<%=CreateQuizConstants.QUESTION_RADIO%>1" value = '2' disabled></label>
		                <input name = '<%=CreateQuizConstants.THIRD_OPTION %>1' type = 'text' class = 'login-input' placeholder="Type Answer" disabled>
		              </div>
		              <div class="radio m-3">
		                <label><input type="radio" name="<%=CreateQuizConstants.QUESTION_RADIO%>1" value = '3' disabled></label>
		                <input name = '<%=CreateQuizConstants.FOURTH_OPTION %>1' type = 'text' class = 'login-input' placeholder="Type Answer" disabled>
		              </div>
		            </div>
		            <div id = 'open-ended' class = 'm-2 hidden'>
		              <div id = 'answer1' class = 'mt-1'>
		                <input name = '<%=CreateQuizConstants.ANSWER %>11' type = 'text' class = 'login-input open-ended-field' placeholder="Type Answer" maxlength="100" id = 'answer-field1' disabled>
		                <button class = 'btn btn-light ml-2 minus-btn mt-2' type = 'button' data-toggle="tooltip" title="remove Answer" disabled> - </button>
		              </div>
		              <div id = 'answer2' class = 'mt-1 hidden'>
		                <input name = '<%=CreateQuizConstants.ANSWER %>21' type = 'text' class = 'login-input open-ended-field' placeholder="Type Answer" maxlength="100" id = 'answer-field1' disabled>
		                <button class = 'btn btn-light ml-2 minus-btn mt-2' type = 'button' data-toggle="tooltip" title="remove Answer" id = 'answer-btn' > - </button>
		              </div>
		              <div id = 'answer3' class = 'mt-1 hidden'>
		                <input name = '<%=CreateQuizConstants.ANSWER %>31' type = 'text' class = 'login-input open-ended-field' placeholder="Type Answer" maxlength="100" id = 'answer-field1' disabled>
		                <button class = 'btn btn-light ml-2 minus-btn mt-2' type = 'button' data-toggle="tooltip" title="remove Answer" id = 'answer-btn' > - </button>
		              </div>
		              <div class = 'mt-1' id = 'plus-btn-div'>
		                <button class = 'btn btn-dark' type = 'button' title="Add Answer" id = 'plus-btn'>+</button>
		              </div>
		              <input type = 'hidden' name = '<%=CreateQuizConstants.ANSWER_NUM %>1' value = '1' id = 'answer-num'>
		            </div>
		            <div id = 'fill-blank' class = 'hidden'>
		              <small>The Blank Words Should Be Double Parentheses.</small>
		              <small>Example: ((London)) Is The Capital of England</small>
		
		            </div>
		            <div id = 'match' class = 'hidden'>
		              <div  class = 'row'>
		                <input name = '<%=CreateQuizConstants.LEFT_MATCHING %>11' type = 'text' class = 'login-input match-field m-3' placeholder="Matching One" maxlength="100" id = 'answer-field1' disabled>
		                <input name = '<%=CreateQuizConstants.RIGHT_MATCHING %>11'type = 'text' class = 'login-input match-field m-3' placeholder="Matching One" maxlength="100" id = 'answer-field1' disabled>
		              </div>
		              <div  class = 'row'>
		                <input name = '<%=CreateQuizConstants.LEFT_MATCHING %>21' type = 'text' class = 'login-input match-field m-3' placeholder="Matching Two" maxlength="100" id = 'answer-field1' disabled>
		                <input name = '<%=CreateQuizConstants.RIGHT_MATCHING %>21' type = 'text' class = 'login-input match-field m-3' placeholder="Matching Two" maxlength="100" id = 'answer-field1' disabled>
		              </div>
		              <div  class = 'row'>
		                <input name = '<%=CreateQuizConstants.LEFT_MATCHING %>31' type = 'text' class = 'login-input match-field m-3' placeholder="Matching Three" maxlength="100" id = 'answer-field1' disabled>
		                <input name = '<%=CreateQuizConstants.RIGHT_MATCHING %>31' type = 'text' class = 'login-input match-field m-3' placeholder="Matching Three" maxlength="100" id = 'answer-field1' disabled>
		              </div>
		              <div  class = 'row'>
		                <input name = '<%=CreateQuizConstants.LEFT_MATCHING %>41' type = 'text' class = 'login-input match-field m-3' placeholder="Matching Three" maxlength="100" id = 'answer-field1' disabled>
		                <input name = '<%=CreateQuizConstants.RIGHT_MATCHING %>41' type = 'text' class = 'login-input match-field m-3' placeholder="Matching Three" maxlength="100" id = 'answer-field1' disabled>
		              </div>
		            </div>
		          </div>
		          
		          
		          <div class = 'lighter-bg border rounded col-sm-12 mt-3 mb-3 add-question' id = 'add-question'>
		            <h1 class ='display-4 m-2' > New Question...</h1>
		          </div>
           
		          <input type = 'hidden' name = '<%=CreateQuizConstants.QUESTION_NUM %>' value = '1' id = 'questionNum'>
		
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