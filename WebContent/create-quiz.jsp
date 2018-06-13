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
          <div class = 'lighter-bg border rounded col-sm-12'>
            <h2 class = 'm-2 display-4'> Createing Quiz: </h2>
            <div class ='row m-1'>
              <input type="text" class="form-control light-bg login-input" placeholder="Quiz Name" maxlength="61" id ='input-quizname'>
              <small class = 'red-small' id = 'min-limit'>sorry, but text should contain atleast 8 albphabet letters</small>
              <small class = 'red-small' id = 'no-text'>sorry but you should enter quiz name</small>

            </div>

            <div class ='row m-1'>
              <textarea class="form-control light-bg login-input " placeholder="Quiz Description" rows="6" cols="50" maxlength="550" id ='textarea'></textarea>
            </div>

            <select class="form-control login-input" id="sel1" placeholder = 'Select Time'>
              <option value = '1'>No Time Limit (Click To Choose)</option>
              <option value = '2'>10 min</option>
              <option value = '3'>15 min</option>
              <option value = '4'>20 min</option>
              <option value = '4'>30 min</option>
              <option value = '4'>45 min</option>
            </select>

            <button type="button" class="btn btn-dark m-3" data-toggle="collapse" data-target="#demo" id = 'continue-btn'> Continue >> </button>
            <button type="button" class="btn btn-danger m-3" data-toggle="collapse" data-target="#demo"> Cancel :( </button>

          </div>

          <div class = 'lighter-bg border rounded col-sm-12 mt-3'>
            <h1 class ='display-4 m-2'> Questions:</h1>
          </div>
          <div class = 'lighter-bg border rounded col-sm-12 mt-3 mb-3' id = 'question1'>
            <div class = 'row'>
              <h3 class ='m-1'>Question 1:</h3>
              <button class = 'btn btn-danger ml-auto m-1'>X</button>
            </div>
            <select class="form-control login-input" placeholder = 'Question Type' id = 'select'>
              <option value = '0'>Choose Question Type</option>
              <option value = '#multiple-choice'>Multiple Choice</option>
              <option value = '#open-ended'>Open Ended</option>
              <option value = '#fill-blank'>Fill In The Blank</option>
              <option value = '#match'>Matching</option>
            </select>
            <textarea class="form-control light-bg login-input m-1" placeholder="Question:" rows="6" cols="50" maxlength="1200" id ='textarea'></textarea>
            <div id = 'multiple-choice' class = 'm-2 hidden'>
              <div class="radio m-3">
                <label><input type="radio" name="optradio"></label>
                <input type = 'text' class = 'login-input' placeholder="Type Answer">
              </div>
              <div class="radio m-3">
                <label><input type="radio" name="optradio"></label>
                <input type = 'text' class = 'login-input' placeholder="Type Answer">
              </div>
              <div class="radio m-3">
                <label><input type="radio" name="optradio"></label>
                <input type = 'text' class = 'login-input' placeholder="Type Answer">
              </div>
              <div class="radio m-3">
                <label><input type="radio" name="optradio"></label>
                <input type = 'text' class = 'login-input' placeholder="Type Answer">
              </div>
            </div>
            <div id = 'open-ended' class = 'm-2 hidden'>
              <div id = 'answer1' class = 'mt-1'>
                <input type = 'text' class = 'login-input open-ended-field' placeholder="Type Answer" maxlength="100" id = 'answer-field1'>
                <button class = 'btn btn-light ml-2 minus-btn mt-2' data-toggle="tooltip" title="remove Answer" disabled> - </button>
              </div>
              <div id = 'answer2' class = 'mt-1 hidden'>
                <input type = 'text' class = 'login-input open-ended-field' placeholder="Type Answer" maxlength="100" id = 'answer-field1'>
                <button class = 'btn btn-light ml-2 minus-btn mt-2' data-toggle="tooltip" title="remove Answer" id = 'answer-btn' > - </button>
              </div>
              <div id = 'answer3' class = 'mt-1 hidden'>
                <input type = 'text' class = 'login-input open-ended-field' placeholder="Type Answer" maxlength="100" id = 'answer-field1'>
                <button class = 'btn btn-light ml-2 minus-btn mt-2' data-toggle="tooltip" title="remove Answer" id = 'answer-btn' > - </button>
              </div>
              <div class = 'mt-1' id = 'plus-btn-div'>
                <button class = 'btn btn-dark' data-toggle="tooltip" title="Add Answer" id = 'plus-btn'>+</button>
              </div>
            </div>
            <div id = 'fill-blank' class = 'hidden'>
              <small>The Blank Words Should Be Double Parentheses.</small>
              <small>Example: ((London)) Is The Capital of England</small>

            </div>
            <div id = 'match' class = 'hidden'>
              <div  class = 'row'>
                <input type = 'text' class = 'login-input match-field m-3' placeholder="Matching One" maxlength="100" id = 'answer-field1'>
                <input type = 'text' class = 'login-input match-field m-3' placeholder="Matching One" maxlength="100" id = 'answer-field1'>
              </div>
              <div  class = 'row'>
                <input type = 'text' class = 'login-input match-field m-3' placeholder="Matching Two" maxlength="100" id = 'answer-field1'>
                <input type = 'text' class = 'login-input match-field m-3' placeholder="Matching Two" maxlength="100" id = 'answer-field1'>
              </div>
              <div  class = 'row'>
                <input type = 'text' class = 'login-input match-field m-3' placeholder="Matching Three" maxlength="100" id = 'answer-field1'>
                <input type = 'text' class = 'login-input match-field m-3' placeholder="Matching Three" maxlength="100" id = 'answer-field1'>
              </div>
              <div  class = 'row'>
                <input type = 'text' class = 'login-input match-field m-3' placeholder="Matching Three" maxlength="100" id = 'answer-field1'>
                <input type = 'text' class = 'login-input match-field m-3' placeholder="Matching Three" maxlength="100" id = 'answer-field1'>
              </div>
            </div>


              
          </div>
          <div class = 'lighter-bg border rounded col-sm-12 mt-3 mb-3 add-question' id = 'add-question'>
            <h1 class ='display-4 m-2' > New Question...</h1>
          </div>

          <div class = 'lighter-bg border rounded col-sm-12 mt-3 mb-3'>
            <button class = 'btn btn-black m-3'>Submit QUiz!</button>
            <button class = 'btn btn-danger m-3'>Cancel lol</button>
          </div>
        </div>
        
        <div class = 'col-sm-2 border'>asd</div>

      </div>


    </div>


  </body>






  </body>
</html>