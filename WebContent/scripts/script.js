function titleChecker(x){

	if(x == true){
		var input = $('#input-quizname').val();
		var i;
		var count = 0;
		for(i=0;i<input.length;i++){
			var char = input.charAt(i);
			if(char >= 'a' && char <= 'z' || char >= 'A' && char <='Z'){
				count++;
			}
		}

		if(count < 8){
			$('#min-limit').fadeIn();
			$('#input-quizname').addClass('warning');
			$('#continue-btn').prop('disabled',true);
		}else{
			$('#min-limit').fadeOut();
			$('#input-quizname').removeClass('warning');
			$('#continue-btn').prop('disabled',false);
		}
	}
	
}

var numQuestions;
var answer;



$(document).ready(function(){



	var tried = false;

	$('#continue-btn').click(function(){
		tried = true;
		titleChecker(tried);
	});
	
	$('#input-quizname').keyup(function(){
		titleChecker(tried);
	});

	$('#plus-btn').click(function(){

		if($(this).parent().siblings('#answer2').hasClass('displayed')){
			$(this).parent().siblings('#answer3').fadeIn();
			$(this).parent().siblings('#answer3').addClass('displayed');
		
		}else{
			$(this).parent().siblings('#answer2').fadeIn();
			$(this).parent().siblings('#answer2').addClass('displayed');
		}
		if($(this).parent().siblings('#answer3').hasClass('displayed') && $(this).parent().siblings('#answer2').hasClass('displayed')){
			$(this).prop('disabled',true);
		}
		

	});

	$('.minus-btn').click(function(){
		$(this).parent().fadeOut();
		$(this).parent().parent().parent().find('#plus-btn').prop('disabled',false);
		$(this).parent().removeClass('displayed');

	});
 
	
	$('#select').change(function(){
		var selectedValue = $(this).find(':selected').val();
		var displayed =  $(this).siblings('.displayed');
		//alert($(this).parent().attr('id'));
		if(selectedValue == 0){
			displayed.find('input').prop('disabled',true);
			displayed.fadeOut();
		}else{
			if(displayed.length != 0){
				displayed.removeClass('displayed');
				displayed.find('input').prop('disabled',true);
				displayed.fadeOut(function(){
					displayed = $(this).siblings(selectedValue);
					displayed.fadeIn();
					displayed.addClass('displayed');
					displayed.find('input').prop('disabled',false);
				});
			}else{
				displayed = $(this).siblings(selectedValue);
				displayed.fadeIn();
				displayed.addClass('displayed');
				displayed.find('input').prop('disabled',false);
			}	

			
		}

	});
	

	
	var question = $('#question1').clone(true);
	var questionNum = 1;
	$('#add-question').click(function(){

		var newQuestion = question.clone(true);
		$(this).before(newQuestion);
		questionNum++;
		newQuestion.attr('id','#question' + questionNum);
		newQuestion.find('h3').html('Question ' + questionNum +':');
		newQuestion.find('[name]').each(function(){
			
			var name = this.name.substring(0, this.name.length-1);
			$(this).attr('name', name + questionNum);
			
		});
		$('#questionNum').attr('value',questionNum);
		
	});

	

});