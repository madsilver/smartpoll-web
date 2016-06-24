$( document ).ready(function() {
	
	$("#setup-link").addClass("active");
	$("#breadcrumb-title").text("Configurações > Usuários Mobiles");

	$('form').submit(function(e){
		e.preventDefault();
		saveUserMobile(this);
	});
	
	fillTable();	
	
});

/**
 * 
 * @param form
 */
function saveUserMobile(form){
	var url = "save-user";
	var data = toJson(form);
	$.ajax({
		url:url,
		method: "post",
		data: data,
		async:true,
		beforeSend: function(){
			$("#div-form").addClass("loader");
		},
		success: function(resp){
			if(resp == "ok"){
				fillTable();
				$('form')[0].reset();
				SpAlert("Operação executada com sucesso :)");
			}
			else{
				SpAlert("Ops, sua operação não pode ser executada :(<br>"+resp);
			}
		},
		complete:function(){
			$("#div-form").removeClass("loader");
		},
		error:function(e){
			SpAlert("Ops, sua operação não pode ser executada :(<br>"+e.responseText);
		}
	});
}

/**
 * 
 */
function fillTable(){
	var account = 1;
	var url = "table/"+account;
	
	$.ajax({
		url:url,
		method: "post",
		dataType:"json",
		async:true,
		beforeSend: function(){
			$("#div-table").addClass("loader");
		},
		success: function(resp){
			var td = "";
			$("#body-table tr").remove();
			$.each(resp, function(k,v){
				var imei = v.imei != null ? v.imei : "<span>Disponível</span>";
				var lastImei = v.last_imei != null ? v.last_imei : "-";
				td += "<tr id='"+v.id+"'>";
				td += "<td>"+v.username+"</td>";
				td += "<td>"+imei+"</td>";
				td += "<td>"+lastImei+"</td>";
				td += "<td>"+timestampToDate(v.last_message)+"</td>";
				td += "<td class='text-right'>";
				if(imei != "<span>Disponível</span>")
					td += "<button type=\"button\" class=\"btn btn-xs btn-primary\" onclick=\"releaseDevice("+v.id+")\">liberar</button>";
            	td += "<button type=\"button\" class=\"btn btn-xs btn-warning\" onclick=\"confirmDelete("+v.id+")\">apagar</button>";
				td += "</td>";
				td += "</tr>";
			});
			$("#body-table").append(td);
		},
		complete:function(){
			$("#div-table").removeClass("loader");
		},
		error:function(e){
			SpAlert("Ops, erro ao carregar a tabela :(");
		}
	});
}

/**
 * 
 * @param id
 */
function confirmDelete(id){
	SpConfirm("Deseja mesmo deletar esta pesquisa?",deleteUserMobile,id);
}

/**
 * 
 * @param id
 */
function deleteUserMobile(id){

	$.ajax({
		url:"delete",
		method: "post",
		data:{userMobile:id},
		async:true,
		beforeSend: function(){
			$("#div-table").addClass("loader");
		},
		success: function(resp){
			if(resp == "ok"){
				fillTable();
			} else{
				$("#div-table").removeClass("loader");
				alert(resp);
			}
		},
		complete:function(){
			$("#div-table").removeClass("loader");
		},
		error:function(e){
			alert("Ops, erro ao remover a pesquisa :(\n"+e.responseText);
		}
	});
}

function releaseDevice(id){
	$.ajax({
		url:"release-device",
		method: "post",
		data:{userMobile:id},
		async:true,
		beforeSend: function(){
			$("#div-table").addClass("loader");
		},
		success: function(resp){
			if(resp == "ok"){
				fillTable();
			} else{
				$("#div-table").removeClass("loader");
				alert(resp);
			}
		},
		complete:function(){
			$("#div-table").removeClass("loader");
		},
		error:function(e){
			alert("Ops, erro ao remover a pesquisa :(\n"+e.responseText);
		}
	});
}

function timestampToDate(ts){
	if(ts != null){
		var date = new Date(ts);
		return date.toLocaleString();
	}
	return "";
}