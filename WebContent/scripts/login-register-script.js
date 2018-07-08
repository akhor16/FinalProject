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
			alert("Error");
		},
		
		success: function(data) {
			if(data === "true"){
				$("#loginButton").hide();
			} else {
				$("#wrongLogin").fadeIn();
			}
		}
	});
}


$(document).ready(function(){
	
	$('#loginButton').click(loginFunction);
});