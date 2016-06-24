var emailError = false;

$( document ).ready(function() {
	
	$("#contactForm").submit(function(e){
		e.preventDefault;
		if(emailError != "false"){
    		messageFail("O endereço de e-mail já consta na base de dados");
    		return false;
    	} else {
    		$("#success").html("");
    	}
	});
	
	 $("a[data-toggle=\"tab\"]").click(function(e) {
		 e.preventDefault();
		 $(this).tab("show");
	 });
	    
	 $("input#email").focusout(function(){
		 emailExist($("input#email").val());
	 });

});

//When clicking on Full hide fail/success boxes
$('#name').focus(function() {
    $('#success').html('');
});

//Floating label headings for the contact form
$(function() {
    $("body").on("input propertychange", ".floating-label-form-group", function(e) {
        $(this).toggleClass("floating-label-form-group-with-value", !! $(e.target).val());
    }).on("focus", ".floating-label-form-group", function() {
        $(this).addClass("floating-label-form-group-with-focus");
    }).on("blur", ".floating-label-form-group", function() {
        $(this).removeClass("floating-label-form-group-with-focus");
    });
});

function emailExist(email){
	return $.ajax({
		url:'email-exist',
		type:'post',
		data:{email:email},
		success:function(resp){
			var p = $("input#email").next('p');
			emailError = resp;
			if(resp == "true"){
				var msg = "<ul role='alert'><li>Este email já foi cadastrado.</li></ul>";
				p.append(msg);
			} else {
				p.html("");
			}
		}
	}).responseText;
}

function messageFail(msg){
	// Fail message
    $('#success').html("<div class='alert alert-danger'>");
    $('#success > .alert-danger').html("<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;")
        .append("</button>");
    $('#success > .alert-danger').append("<strong>"+msg+"</strong>");
    $('#success > .alert-danger').append('</div>');
    //clear all fields
    //$('#contactForm').trigger("reset");
}

function messageSuccess(msg){
	// Enable button & show success message
    $("#btnSubmit").attr("disabled", false);
    $('#success').html("<div class='alert alert-success'>");
    $('#success > .alert-success').html("<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;")
        .append("</button>");
    $('#success > .alert-success')
        .append("<strong>"+msg+"</strong>");
    $('#success > .alert-success')
        .append('</div>');

    //clear all fields
    $('#contactForm').trigger("reset");
}
