/**
 * 
 */

function loginFunction (){
	$.ajax({
		type: "GET",
		url: "LoginRegisterServlet",
		data: {
			userNameLogin: $("#userNameLogin").val(),
			passwordLogin: $("#passwordLogin").val()
		},
		
		error: function(){
			alert("Error Login");
		},
		
		success: function(data) {
			if(data === "true"){
				location.replace("homepage.jsp");
			} else {
				$("#wrongLogin").fadeIn();
			}
		}
	});
}

function checkRegisterInput(){
	if($("#nameRegister").val().length === 0 
			|| $("#lastNameRegister").val().length === 0 
			|| $("#userNameRegister").val().length === 0
			|| $("#passwordRegister").val().length === 0
			|| $("#passwordRegisterConfirm").val().length === 0) {
		$("#fillAllFieldsRegister").fadeIn();
		return false;
	}
	if($("#passwordRegister").val() != $("#passwordRegisterConfirm").val()){
		$("#passDidntMatch").fadeIn();
		return false;
	}
	if($("#passwordRegister").val().length < 6) {
		$("#passMinLen").fadeIn();
		return false;
	}
	return true;
}

function registerFunction (){
	if(checkRegisterInput()){
		$.ajax({
			type: "POST",
			url: "LoginRegisterServlet",
			data: {
				nameRegister: $("#nameRegister").val(),
				lastNameRegister: $("#lastNameRegister").val(),
				userNameRegister: $("#userNameRegister").val(),
				passwordRegister: $("#passwordRegister").val(),
				passwordRegisterConfirm: $("#passwordRegisterConfirm").val()
			},
			
			error: function(){
				alert("Error Register");
			},
			
			success: function(data) {
				if(data === "true"){
					location.replace("homepage.jsp");
				} else {
					$("#wrongRegister").fadeIn();
				}
			}
		});
		
	}
}



function fadeOutRedTexts(){
	$("#fillAllFieldsRegister").fadeOut();
	$("#passDidntMatch").fadeOut();
	$("#passMinLen").fadeOut();
	$("#wrongRegister").fadeOut();
}


$(document).ready(function(){
	$('#loginButton').click(loginFunction);
	$('#registerButton').click(registerFunction);
	//$('#passwordLogin').keyup(enterBtnLogin(event));
	document.querySelector('#passwordLogin').addEventListener('keypress', function (e) {
	    var key = e.which || e.keyCode;
	    if (key === 13) { // 13 is enter
	      loginFunction();
	    }
	});
	document.querySelector('#userNameLogin').addEventListener('keypress', function (e) {
	    var key = e.which || e.keyCode;
	    if (key === 13) { // 13 is enter
	      loginFunction();
	    }
	});
	
	
	//registration
	document.querySelector('#passwordRegister').addEventListener('keypress', function (e) {
	    var key = e.which || e.keyCode;
	    if (key === 13) { // 13 is enter
	      registerFunction();
	    }
	});
	document.querySelector('#passwordRegisterConfirm').addEventListener('keypress', function (e) {
	    var key = e.which || e.keyCode;
	    if (key === 13) { // 13 is enter
	    	registerFunction();
	    }
	});
	
	document.querySelector('#userNameRegister').addEventListener('keypress', function (e) {
	    var key = e.which || e.keyCode;
	    if (key === 13) { // 13 is enter
	    	registerFunction();
	    }
	});
	
	document.querySelector('#nameRegister').addEventListener('keypress', function (e) {
	    var key = e.which || e.keyCode;
	    if (key === 13) { // 13 is enter
	    	registerFunction();
	    }
	});
	
	document.querySelector('#lastNameRegister').addEventListener('keypress', function (e) {
	    var key = e.which || e.keyCode;
	    if (key === 13) { // 13 is enter
	    	registerFunction();
	    }
	});
});