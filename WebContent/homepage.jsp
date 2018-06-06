<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<!-- Bootstrap CSS -->
		<!-- We Will Be Using Bootstrap Framework For The Front End Of This Project -->
    	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
		<!-- This webpage's costum css file -->
		<link rel = 'stylesheet' href = 'styles/style.css'>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>Quiz Homepage</title>
		
	</head>
	<body class = "bg">
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
	  	
    <div class="container-fluid mt-3">
      <div class = 'row justify-content-center '>
        
        <div class = 'col-sm-3 '>
          <div class = 'rounded lighter-bg'>
            
              <table class = 'table rounded'>
                <thead class= 'text-center'>
                  <tr class= 'text-center'><div class = 'text-center'><h4>Popular Quizzes</h4></div></tr>
                </thead>    
	               
	              <tbody class = ''>
	                <tr class ='lighter-bg quizz-list-item'>
	                  <td><h5>First Quiz</h5></td>
	                </tr>
	                <tr class = 'quizz-list-item'>
	                  <td><h5>Second Quiz</h5></td>
	                </tr>
	                <tr class ='lighter-bg quizz-list-item'>
	                  <td><h5>Third Quiz</h5></td>
	                </tr>
	                <tr  class = 'quizz-list-item'>
	                  <td><h5>Fourth Quiz</h5></td>
	                </tr>
	                
                  <tr class ='lighter-bg quizz-list-item'>
                    <td><h5>Fifth Quizz</h5></td>
                  </tr>            
	              </tbody>
	            </table>
	            
	            
            
          </div>
          
          <div class = 'rounded lighter-bg mt-4'>
            
              <table class = 'table rounded'>
                <thead class= 'text-center'>
                  <tr class= 'text-center'><div class = 'text-center'><h4>Recently Uploaded Quizes</h4></div></tr>
                </thead>    
                 
                <tbody class = ''>
                  <tr class ='lighter-bg quizz-list-item'>
                    <td><h5>First Quiz</h5></td>
                  </tr>
                  <tr class = 'quizz-list-item'>
                    <td><h5>First Quiz</h5></td>
                  </tr>
                  <tr class ='lighter-bg quizz-list-item'>
                    <td><h5>First Quiz</h5></td>
                  </tr>
                  <tr>
                    <td class = 'quizz-list-item'><h5>First Quiz</h5></td>
                  </tr>
                  
                  <tr class ='lighter-bg quizz-list-item'>
                    <td><h5>First Quizz</h5></td>
                  </tr>            
                </tbody>
              </table>
              
              
            
          </div>
        
        </div>
        
        
        
        <div class="col-sm-6 border">
        
	        <div class = "m-3 light-bg border rounded">
	          <div class = 'm-1'>
		          <h1 class ='display-4'>Some News 1</h1>
		          <p>some news text or smth</p>
		          <button type="button" class="btn border border-secondary hover-button">Learn More >></button>
		        </div>
	        </div>
	        
	        <div class = "m-3 light-bg border rounded">
            <div class = 'm-1'>
              <h1 class ='display-4'>Some News 1</h1>
              <p>some news text or smth</p>
              <button type="button" class="btn border border-secondary hover-button">Learn More >></button>
            </div>
          </div>
          
        </div>
        
        <div class = 'col-sm-3 border'>
          
        
        </div>
        
      </div>
    </div>
    	
    	
    	
	</body>
</html>