var map;

$(document).ready(function() { 
	
	$("#map-link").addClass("active");
	$("#breadcrumb-title").text("Mapa");
	console.log("teste");
});


function initMap() {
  map = new google.maps.Map(document.getElementById('map'), {
    center: {
    	lat: -23.9879366, 
    	lng: -46.2527408
    	},
    zoom: 12
  });
  
  var myLatLng = {lat: -23.9879366, lng: -46.2527408};
  
//  var marker = new google.maps.Marker({
//	    position: myLatLng,
//	    map: map,
//	    title: 'Hello World!'
//  });
  
  $.ajax({
		url:"positions",
		data:{"poll":"1"},
		async:true,
		dataType:"json",
		method:"post",
		success: function(resp){
			$.each(resp, function(index,v){
				var lat = Number(v[0]);
				var lng = Number(v[1])
				var marker = new google.maps.Marker({
				      position: { lat: lat, lng: lng },
				      map: map
				    });

			});
		},
		error: function (request, status, error) {
			alert(request.responseText);
		}
	});
  
  map.addListener('click', function(event) {
	    console.log(event.latLng.lat());
	    console.log(event.latLng.lng());
  });

}