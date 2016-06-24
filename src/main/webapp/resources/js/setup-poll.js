$( document ).ready(function() {
	
	$("#setup-link").addClass("active");
	$("#breadcrumb-title").text("Configurações > Pesquisas");
	
	$('form').submit(function(e){
		e.preventDefault();
		savePoll(this);
	});
	
	$("#btnClear").click(function(){
		resetForm($('form')[0]);
	});
	
	fillTable();	
});

/**
 * 
 * @param form
 */
function savePoll(form){
	var url = $("#url").val()+"setup-poll/save-poll";
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
				SpAlert("Ops, sua operação não pode ser executada :(");
			}
		},
		complete:function(){
			$("#div-form").removeClass("loader");
		},
		error:function(e){
			SpAlert("Ops, sua operação não pode ser executada :(\n"+e.responseText);
		}
	});
}

/**
 * 
 * @param id
 * @param description
 */
function fillForm(id, description){
	$("#id").val(id);
	$("#description").val(description);
}

/**
 * 
 * @param id
 */
function confirmDelete(id){
	SpConfirm("Deseja mesmo deletar esta pesquisa?",deletePoll,id);
}

/**
 * 
 * @param id
 */
function deletePoll(id){
	var url = $("#url").val()+"setup-poll/delete";
	$.ajax({
		url:url,
		method: "post",
		data:{poll:id},
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

/**
 * 
 */
function fillTable(){
	var url = $("#url").val()+"setup-poll/table";
	
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
				td += "<tr id='"+v.id+"'>";
				td += "<td>"+v.description+"</td>";
				td += "<td class='text-right'>";
				td += "<button type=\"button\" class=\"btn btn-xs btn-primary\" onclick=\"fillForm("+v.id+",'"+v.description+"')\">editar</button>";
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


