$(function() {
  $(".navbar-expand-toggle").click(function() {
    $(".app-container").toggleClass("expanded");
    return $(".navbar-expand-toggle").toggleClass("fa-rotate-90");
  });
  return $(".navbar-right-expand-toggle").click(function() {
    $(".navbar-right").toggleClass("expanded");
    return $(".navbar-right-expand-toggle").toggleClass("fa-rotate-90");
  });
});


$(function() {
  return $(".side-menu .nav .dropdown").on('show.bs.collapse', function() {
    return $(".side-menu .nav .dropdown .collapse").collapse('hide');
  });
});

function SpAlert(message){
	var options = {
	        message: message,
	        title: 'Mensagem',
	        subtitle: '',
	        label: 'OK'
	    };
	
	eModal.alert(options);
}

function SpConfirm(message, callback,arg){
	var options = {
	        message: message,
	        title: 'Confirmação',
	        subtitle: '',
	        label: 'Yes' | 'True'| 'OK'
	    };
	
	eModal.confirm(options, null)
    .then(function(){callback(arg)});
	//.then(callback, callbackCancel);
}

function toJson(form){
	var data = {};
	for (var i = 0, ii = form.length; i < ii; ++i) {
	    var input = form[i];
	    if (input.name) {
	      data[input.name] = input.value;
	    }
	}
	return data;
}

function resetForm(form){
	for (var i = 0; i < form.length; i++) {
	    var element = form[i];
	    if(element.name){
	    	if (element.type == "radio"){
	    		element.checked = false;
	    	} else if (element.tagName == "INPUT") {
		    	element.value = '';
		    } else if (element.tagName == "SELECT"){
		    	element.selectedIndex = -1;
		    }
	    }
	}
}
