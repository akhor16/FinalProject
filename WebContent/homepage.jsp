<%@page import="JavaClasses.StrPair"%>
<%@page import="java.util.ArrayList"%>
<%@page import="JavaClasses.Account, JavaClasses.QuizDatabase"%>
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
		<%
		Account acc = (Account)(request.getSession().getAttribute(Account.SESSION_ATTRIBUTE_NAME));
  		int userId;
    String userName;
		if(acc == null){
			response.sendRedirect(request.getContextPath() + "/loginAndRegister.jsp");
		}else{
			
			userId = acc.getUserId();
	    	QuizDatabase db = (QuizDatabase)request.getServletContext().getAttribute(QuizDatabase.ATTRIBUTE_NAME);
	    	userName = db.getUserNameById(userId);
	    	
			
		
		
	%>
	</head>
	<body class = "bg">
		<nav class="navbar navbar-expand-lg navbar-light light-bg">
	    <div><a class="navbar-brand border border-secondary rounded non-transparent" href="#"><p class="ml-1 mr-1 mb-auto mt-auto">Quiz Website</p></a></div>
      <div class = ' ml-3'>
        <button type="button" class="btn btn-dark" data-toggle="collapse" data-target="#demo">
          Notifications 
          <span class="text-center badge badge-light badge-pill ml-1">1</span>
        </button>
        <%ArrayList<String> names = db.getQuizNames(); %>
        <%int nameNum = Math.min(5,names.size()); %>
        <div id="demo" class="collapse abs-position border border-secondary rounded col-sm-3 black-bg">
          <%for(int i=0;i<nameNum;i++){ %>
          <a href = '<%=request.getContextPath()%>/quiz-summary.jsp?id=<%=db.getQuizIdByName(names.get(i))%>'><div class = 'mt-1 mb-2 notify-item rounded p-2'>
            New Quiz Added:
            <h6><%=names.get(i) %></h6>
          </div></a>
          <%} %>
          
          <p class = 'notify-label mb-0'><a href='<%=request.getContextPath()%>/quizzes.jsp'>See More Notifications >></a> </p> 
        </div>
      </div>
      
	    <ul class="navbar-nav ml-auto">
	      <li class="nav-item hover-shadow">
	        <a class="nav-link" href="<%=request.getContextPath()%>/homepage.jsp" id = 'home'><h4 class="ml-3 mr-3 mb-auto mt-auto">Home</h4> </a>
	      </li>
	      <li class="nav-item  hover-shadow">
	        <a class="nav-link" href="<%=request.getContextPath()%>/quizzes.jsp" id = 'about'><h4 class="ml-3 mr-3 mb-auto mt-auto">Quizzes</h4> </a>
	      </li>
	      <li class="nav-item hover-shadow">
          <a class="nav-link" href="<%=request.getContextPath()%>/create-quiz.jsp" id = 'home'><h4 class="ml-3 mr-3 mb-auto mt-auto">Create Quiz</h4> </a>
        </li>
	      <li class="nav-item  hover-shadow">
	        <a class="nav-link" href="<%=request.getContextPath()%>/user-profile.jsp?id=<%=userId %>"><h4 class="ml-3 mr-3 mb-auto mt-auto h"><%=userName %></h4></a>
	      </li>
	      <li class="nav-item  hover-shadow">
	        <a class="nav-link" href="LogoutServlet?method=get" id = 'logout'><h5 class="ml-3 mr-3 mb-auto mt-auto">Log Out</h5> </a>
	      </li>
      </ul>
    </nav>
	  	
    <div class="container-fluid mt-3">
      <div class = 'row justify-content-center '>
        
        <div class = 'col-sm-2'>
         
          
          <div class = 'rounded lighter-bg mt-4 border'>
            
              <table class = 'table rounded'>
                <thead class= 'text-center'>
                  <tr class= 'text-center'><div class = 'text-center'><h4>Recently Uploaded Quizes</h4></div></tr>
                </thead>    
                 
                <tbody class = ''>
                <%ArrayList<String> quizNames = db.getQuizNames(); %>
                <%int quantity = Math.min(quizNames.size(), 5); %>
                <%for(int i=0;i<quantity;i++){ %>
                  <tr class ='lighter-bg quizz-list-item'>
                    <td><h6><%=quizNames.get(i)%></h6></td>
                    <td><span class="text-center badge badge-secondary badge-pill">1 day</span></td>
                  </tr>
                <%} %>         
                </tbody>
              </table>
              
              
            
          </div>
        
        </div>
        
        
        
        <div class="col-sm-8">
        
	        <div class = "m-3 light-bg border rounded">
	          <div class = 'm-1'>
		          <h1 class ='display-4'>This is The Quiz Website</h1>
		          <p>some news text or smth</p>
		          <button type="button" class="btn border border-secondary hover-button">Learn More >></button>
		        </div>
	        </div>
	        
	        <div class = "m-3 light-bg border rounded">
            <div class = 'm-1'>
              <h1 class ='display-4'>This Is a Quiz Website</h1>
              <p>some news text or smth</p>
              <button type="button" class="btn border border-secondary hover-button">Learn More >></button>
            </div>
          </div>
          
        </div>
        
        <div class = 'col-sm-2 '>
         
            
            
            
          <div class = 'lighter-bg border rounded'>
            
              <table class = 'table rounded mb-0'>
                <thead class= 'text-center'>
                  <tr class= 'text-center'><div class = 'text-center'><h4>Friends Activities</h4></div></tr>
                </thead>    
                 
                <tbody class = ''>
                <%ArrayList<StrPair> list = db.getParticipations(1,1,true); %>
                <%quantity = Math.min(5, list.size());%>
                  <%for(int i=0;i<quantity;i++){ %>
                  <%String strId = list.get(i).getFirst(); %>
                  <%int intId = Integer.parseInt(strId); %>
                  <tr class ='lighter-bg quizz-list-item'>
                    <td>
                      <h6><%=db.getUserNameById(intId)%></h6>
                      <p class = 'm-0 text-secondary'>scored <span class="badge badge-info"><%=list.get(i).getSecond() %>0</span> points in a quiz</p>
                    </td>
                  </tr>
                  <%} %>
                          
                </tbody>
              </table>
              
            </div>
        
        </div>
      
      </div>
    </div>
    	
    	
    	
	</body>
</html>
<%}%>