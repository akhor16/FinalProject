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

function registerFunction (){
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


$(document).ready(function(){
	$('#loginButton').click(loginFunction);
	$('#registerButton').click(registerFunction);
});