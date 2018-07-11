
$(document).ready(function(){
	
	$('#start').click(function(){
		
		var path = $('#start-path').val();
		window.location.replace(path);
		
	});
	
	$('#edit').click(function(){
		
		var path = $('#edit-path').val();
		window.location.replace(path);
		
	});
	
});