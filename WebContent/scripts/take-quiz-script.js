

function postForm(){
	
	$.post('CheckQuiz',$('form').serialize(),function(data,status){
		$('form').fadeOut(1000,function(){
			$('#result').children('h1').html('You Scored ' + data + ' points');
			$('#result').fadeIn(1000);
		});
	});
	
	
	
	
	
}


$(document).ready(function(){
	
	$('#submit').click(postForm);
	
	
});