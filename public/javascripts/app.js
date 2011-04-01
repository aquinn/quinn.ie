$(document).ready(function() {


	var options = { 
		target:        '#response',   // target element(s) to be updated with server response 
		beforeSubmit:  showRequest,  // pre-submit callback 
		success:       showResponse,  // post-submit callback 
		clearForm: true,        // clear all form fields after successful submit 
		resetForm: true,        // reset the form after successful submit 
	}; 

	$('#commentForm').submit(function() { 
		// submit the form 
		$(this).ajaxSubmit(options); 
		// return false to prevent normal browser submit and page navigation 
		return false; 
	});

	// pre-submit callback 
	function showRequest(formData, jqForm, options) { 
 
    var form = jqForm[0]; 
	    if (!form.name.value || !form.email.value || !form.comment.value) { 
	        alert('I need your name, email and a comment'); 
	        return false; 
	    } 

		$('#submit').hide();
		$('#loading').show();
		return true; 
	} 

	// post-submit callback 
	function showResponse(responseText, statusText, xhr, $form)  { 
		$('#loading').hide();
		$('#submit').show();
	} 

});  




