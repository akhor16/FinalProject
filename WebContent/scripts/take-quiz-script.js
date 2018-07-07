

function postForm(){
	
	$.post('CheckQuiz',$('form').serialize(),function(data,status){
		alert("Data: " + data);
	});
	
}


$(document).ready(function(){
	
	$('#submit').click(postForm);
	
	
});