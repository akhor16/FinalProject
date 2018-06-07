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
		
		<!-- This webpage's costum css file -->
		<style><%@include file="styles/style.css"%></style>

		
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>Quiz Homepage</title>
		
	</head>
	<body class = "bg">
		<nav class="navbar navbar-expand-lg navbar-light light-bg">
	    <div><a class="navbar-brand border border-secondary rounded non-transparent" href="#"><p class="ml-1 mr-1 mb-auto mt-auto">Quiz Website</p></a></div>
      <div class = ' ml-3'>
        <button type="button" class="btn btn-dark" data-toggle="collapse" data-target="#demo">
          Notifications 
          <span class="text-center badge badge-light badge-pill ml-1">1</span>
        </button>
        
        <div id="demo" class="collapse abs-position border border-secondary rounded col-sm-3 black-bg">
          <div class = 'mt-1 mb-2 notify-item rounded p-2'>
            <h6>Rezo Meishvili</h6>
            Challenge To a Quizz 
          </div>
          
          <div class = 'mt-1 mb-2 notify-item rounded p-2'>
            <h6>Rezo Meishvili</h6>
            Challenge To a Quizz 
          </div>
          
          <div class = 'mt-1 mb-2 notify-item rounded p-2'>
            <h6>Rezo Meishvili</h6>
            Challenge To a Quizz 
          </div>
          
          <div class = 'mt-1 mb-2 notify-item rounded p-2'>
            <h6>Rezo Meishvili</h6>
            Challenge To a Quizz 
          </div>
          
          <div class = 'mt-1 notify-item rounded p-2'>
            <h6>Rezo Meishvili</h6>
            Challenge To a Quizz 
          </div>
          
          <p class = 'notify-label mb-0'>See More Notifications >> </p> 
        </div>
      </div>
      
	    <ul class="navbar-nav ml-auto">
	      <li class="nav-item hover-shadow">
	        <a class="nav-link" href="#" id = 'home'><h4 class="ml-3 mr-3 mb-auto mt-auto">Home</h4> </a>
	      </li>
	      <li class="nav-item  hover-shadow">
	        <a class="nav-link" href="#" id = 'about'><h4 class="ml-3 mr-3 mb-auto mt-auto">Quizzes</h4> </a>
	      </li>
	      <li class="nav-item  hover-shadow">
	        <a class="nav-link" href="#" id ='login'><h4 class="ml-3 mr-3 mb-auto mt-auto h">Profile</h4></a>
	      </li>
	      <li class="nav-item  hover-shadow">
	        <a class="nav-link" href="#" id = 'register'><h5 class="ml-3 mr-3 mb-auto mt-auto">Log Out</h5> </a>
	      </li>
      </ul>
    </nav>
	  	
    <div class="container-fluid mt-3">
      <div class = 'row justify-content-center '>
        
        <div class = 'col-sm-2'>
          <div class = 'panel panel-default lighter-bg border rounded'>
            
              <table class = 'table rounded'>
                <thead class= 'text-center'>
                  <tr class= 'text-center'><div class = 'text-center'><h4>Popular Quizzes</h4></div></tr>
                </thead>    
	               
	              <tbody class = ''>
	                <tr class ='lighter-bg quizz-list-item'>
	                  <td><h6>First Quiz</h6></td>
	                  <td><span class="text-center badge badge-secondary badge-pill">1</span></td>
	                </tr>
	                <tr class = 'quizz-list-item'>
	                  <td><h6>Second Quiz</h6></td>
	                  <td><span class="text-center badge badge-secondary badge-pill">2</span></td>
	                </tr>
	                <tr class ='lighter-bg quizz-list-item'>
	                  <td><h6>Third Quiz</h6></td>
	                  <td><span class="text-center badge badge-secondary badge-pill">3</span></td>
	                </tr>
	                <tr  class = 'quizz-list-item'>
	                  <td><h6>Fourth Quiz</h6></td>
	                  <td><span class="text-center badge badge-secondary badge-pill">4</span></td>
	                </tr>
	                
                  <tr class ='lighter-bg quizz-list-item'>
                    <td><h6>Fifth Quizz</h6></td>
                    <td><span class="text-center badge badge-secondary badge-pill">5</span></td>
                  </tr>            
	              </tbody>
	            </table>
	            
	            
            
          </div>
          
          <div class = 'rounded lighter-bg mt-4 border'>
            
              <table class = 'table rounded'>
                <thead class= 'text-center'>
                  <tr class= 'text-center'><div class = 'text-center'><h4>Recently Uploaded Quizes</h4></div></tr>
                </thead>    
                 
                <tbody class = ''>
                  <tr class ='lighter-bg quizz-list-item'>
                    <td><h6>First Quiz</h6></td>
                    <td><span class="text-center badge badge-secondary badge-pill">1 day</span></td>
                  </tr>
                  <tr class = 'quizz-list-item'>
                    <td><h6>First Quiz</h6></td>
                    <td><span class="text-center badge badge-secondary badge-pill">2 days</span></td>
                  </tr>
                  <tr class ='lighter-bg quizz-list-item'>
                    <td><h6>First Quiz</h6></td>
                    <td><span class="text-center badge badge-secondary badge-pill">3 days</span></td>
                  </tr>
                  <tr class = 'quizz-list-item'>
                    <td><h6>First Quiz</h6></td>
                    <td><span class="text-center badge badge-secondary badge-pill">4 days</span></td>
                  </tr>
                  
                  <tr class ='lighter-bg quizz-list-item justify-context-between'>
                    <td><h6>First Quiz</h6></td>
                    <td><span class="text-center badge badge-secondary badge-pill">5 days</span></td>
                  </tr>            
                </tbody>
              </table>
              
              
            
          </div>
        
        </div>
        
        
        
        <div class="col-sm-8 border">
        
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
        
        <div class = 'col-sm-2 border'>
          
        
        </div>
        
      </div>
    </div>
    	
    	
    	
	</body>
</html>