
/*
 * Instance Variables:
 */
var questionNum = 1;
var clicked = false;

/**
 * this method checks if the field for quiz title has enough
 * alphabetic symbols in it.
 * I have access to the input field with it's ID.
 * the Minimum number of allowed characters is 8.
 * @returns boolean
 */
function titleChecker(){

	var input = $('#input-quizname').val();
	var i;
	var count = 0;
	for(i=0;i<input.length;i++){
		var char = input.charAt(i);
		if(char >= 'a' && char <= 'z' || char >= 'A' && char <='Z'){
			count++;
		}
	}
	
	if(count >= 8){
		return true;
	}
	return false;

}

/**
 * this method is almost the same as titleChecker(), but it checks input 
 * for quiz description textarea. minimum number of characters in the textarea should be eight.
 * access to the textarea is taken by it's ID.
 * @returns boolean
 */
function descriptionChecker(){
	
	var input = $('#quiz-desc').val();
	if(input.length >20){
		return true;
	}
	return false;
	
}

/**
 * this method goes through the question object and changes it's name indices according to the index 
 * given via parameters. this is used during creating the new question, because each question needs it's unique 
 * names. the names are enumerated from 1 to the question number.
 * @param index the number which we want to append to the question names
 * @param question this is the JQuery object of the whole question node which we want to change.
 * @returns void.
 */
function changeNameIndices(index,question){
	
	question.find('[name]').each(function(){
		
		var name = this.name.substring(0, this.name.length - 1);
		$(this).attr('name', name + index);
	});

	
}


/**
 * this method goes through all the questions and enumerates them from 1 to the uqestion number
 * this method is used after deleting a question.
 * the names of the question elements should be enumerated according to the question number
 * because we doesn's want the question names to be out of order.
 * @param current this is the starting question (the first node in a tree)
 * @returns void.
 */
function newEnumeration(current){
	
	var i = 1;
	while(current.length != 0){
		current.find('h3').html('Question ' + i);
		changeNameIndices(i,current);
		current = current.next();
		i++;
	}
	
}

/**
 * this method here is called after click on continue button
 * it checks if everything is all right with title and description of
 * the text and then switches to the second stage where we have creating questions.
 * else this method displays error messages to notify users about wrong input.
 * @returns void
 */
function switchStages(){
	
	clicked = true;
	if(titleChecker() && descriptionChecker()){
		$('.first-stage').fadeOut(1000,function(){
			$('.second-stage').fadeIn(1000);
		});
		
	}else{
		if(!titleChecker()){
			$('#min-limit').fadeIn();
			$('#input-quizname').addClass('warning');
		}
		if(!descriptionChecker()){
			$('#desc-limit').fadeIn();
			$('#quiz-desc').addClass('warning');
		}
		
		
	}
	
}

/**
 * 
 * @param field this is the input field on which we check correctness
 * @param checker this is the checker function for the input field
 * @returns void.
 */

function checkInput(field,checker){
	
	if(checker()){
		field.removeClass('warning');
		field.next().fadeOut();
	}else if(clicked){
		field.next().fadeIn();
		field.addClass('warning');
	}
	
}

/**
 * this method is for open ended questions to have adding multiple 
 * answer choices. 2 additional answer fields are hidden at first, but
 * after user clicks "+" button additional field appears.
 * maximum number of fields is 3.
 * @returns void.
 */
function addAnswerField(){
	
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
	
}
/**
 * this one is similar to the addAnswerFIeld(), but it
 * removes the input field. this method is called after clicking the "-" button.
 * @returns void.
 */
function removeAnswerField(){
	
	$(this).parent().fadeOut();
	$(this).parent().parent().parent().find('#plus-btn').prop('disabled',false);
	$(this).parent().removeClass('displayed');
	
}

/**
 * this method makes changes to a question node according to the selected menu changes.
 * selected menu item values are question type input ID-s in the node.
 * as each question type needs separate input fields we change it accordingly to field.
 * hidden fields are displayed so they won't be submitted to a form.
 * @returns void.
 */
function changeQuestionType(){
	
	//two variables: selected value which is ID of a question which is about to be displayed
	//				displayed this is object of selected element
	var selectedValue = $(this).find(':selected').val();
	var displayed =  $(this).siblings('.displayed');
	
	//if user chose none in question type select menu, we remove selected element.
	if(selectedValue == '0'){
		
		displayed.find('input').prop('disabled',true);
		displayed.fadeOut();
		
	}else{
		//if there are some input fields displayed when user changed select menu.
		if(displayed.length != 0){
			
			displayed.removeClass('displayed'); //this class is just used as a mark for displayed element.
			displayed.find('input').prop('disabled',true);//hidden elements should not be submitted to a form.
			displayed.fadeOut(function(){
				displayed = $(this).siblings(selectedValue);
				displayed.fadeIn();
				displayed.addClass('displayed');
				displayed.find('input').prop('disabled',false);
			});
		
		//this else branch is for when there are no displayed fields when user changes select menu.
		}else{
			
			displayed = $(this).siblings(selectedValue);
			displayed.fadeIn();
			displayed.addClass('displayed');
			displayed.find('input').prop('disabled',false);
		}	
	}
	
}

/**
 * this method removes question after clicking on the
 * "X" button in upper-right corner of the queston DIV.
 * @returns void.
 */
function removeQuestion(){
	
	var currentQuestion = $(this).parent().parent();
	var first = currentQuestion.siblings().first();
	currentQuestion.fadeOut(function(){
		
		//it is callback function that executed after question is faded out and hidden.
		$(this).remove();
		questionNum --;
		newEnumeration(first.next());//after question is removed we need new enumeration for remaining ones
		$('#questionNum').attr('value',questionNum);
		
		
	});
	
}

/**
 * this method adds questions after clicking
 * new Question DIV that has button functionality in it.
 * @returns void.
 */
function addQuestion(question){
	
	//cloning the question object with it's eventListeners.
	var newQuestion = question.clone(true);
	
	newQuestion.css('display','none');
	$('#add-question').before(newQuestion);//new question added before this button.
	newQuestion.fadeIn(1000);
	
	questionNum++;
	newQuestion.find('h3').html('Question ' + questionNum +':');
	changeNameIndices(questionNum,newQuestion);
	$('#questionNum').attr('value',questionNum);
	
}


/*
 * this function is launched after the DOM elements are loaded successfully
 * and are ready for JQuery code to change them.
 */
$(document).ready(function(){
	
	//click event for continue button.
	$('#continue-btn').click(switchStages);
	
	//key up events for quiz name input field and description textareas
	$('#input-quizname').keyup(function(){ checkInput($(this),titleChecker); });
	
	$('#quiz-desc').keyup(function(){ checkInput($(this),descriptionChecker); });	

	//add field and remove field events for plus and minus buttons in open ended questions.
	$('#plus-btn').click(addAnswerField);

	$('.minus-btn').click(removeAnswerField);
 
	//changing quiz type with select menu
	$('#select').change(changeQuestionType);
	
	//adding and removing questions:
	$('#x-button').click(removeQuestion);
	
	var question = $('#question').clone(true);//question NODE is cloned for later use.
	$('#add-question').click(function(){addQuestion(question);});
	


	

});