$( document ).ready(function() {
	
	$("#setup-link").addClass("active");
	$("#breadcrumb-title").text("Configurações > Questões");
	
	$('#type').multiselect({
        maxHeight: 300,
        buttonWidth: '100%'
    });
	
	$('#poll').multiselect({
        maxHeight: 160,
        buttonWidth: '100%'
    });
	
	fillSelectPoll();
	
	fillTableQuestion();
	
	$('form').submit(function(e){
		e.preventDefault();
		saveQuestion(this);

	});
	
	$("#btnClear").click(function(){
		resetForm($('form')[0]);
		$('#type').multiselect('select', -1, true);
		$("#poll").multiselect('select', 0, true);
		$("#body-table-option tr").remove();
		$('#div-new-option').remove();
	});

});

/**
 * Preenche o formulário com a opção selecionada para edição na tabela
 * @param id
 * @param description
 * @param type
 * @param poll
 */
function fillForm(id, description, type, poll){
	$("#id").val(id);
	$("#description").val(description);
	
	$('#type').multiselect('select', type, true);
	$("#poll").multiselect('select', poll, true);
	
	fillTableOption(id, type);
}

/**
 * Preenche o select com as pesquisas criadas
 */
function fillSelectPoll(){
	var url = $("#url").val()+"setup-poll/table";
	var options = [{label: 'Selecione a pesquisa', title: 'Selecione a pesquisa', value: '0'}];
	$.ajax({
		url:url,
		method: "post",
		dataType:"json",
		async:true,
		success: function(resp){
			$.each(resp, function(k,v){
				var item = {};
				item['label'] = v.description;
				item['title'] = v.description;
				item['value'] = v.id;
				options[k+1] = item;
			});
			$('#poll').multiselect('dataprovider', options);
		}
	});
}

/**
 * Preenche a tabela de questões
 */
function fillTableQuestion(){
	var url = $("#url").val()+"setup-question/table";
	
	$.ajax({
		url:url,
		method: "post",
		dataType:"json",
		data:{poll:1},
		async:true,
		beforeSend: function(){
			$("#div-table").addClass("loader");
		},
		success: function(resp){
			var td = "";
			$("#body-table tr").remove();
			$.each(resp, function(k,v){
				td += "<tr id='"+v.id+"'>";
				td += "<td style=\"width:40%\">"+v.description+"</td>";
				td += "<td>"+(v.type == 0 ? 'Múltipla':'Simples')+"</td>";
				td += "<td style=\"width:30%\">"+v.poll.description+"</td>";
				td += "<td class='text-right'>";
				td += "<button type=\"button\" class=\"btn btn-xs btn-primary\" onclick=\"fillForm("+v.id+",'"+v.description+"',"+v.type+","+v.poll.id+")\">editar</button>";
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
			SpAlert("Ops, erro ao carregar a tabela :(\n"+e.responseText);
		}
	});
}

/**
 * Preenche a tabela com as opções das questões
 * @param question
 * @param type
 */
function fillTableOption(question, type){
	var url = $("#url").val()+"setup-question/table-option";
	
	$.ajax({
		url:url,
		method: "post",
		dataType:"json",
		data:{question:question},
		async:true,
		beforeSend: function(){
			$("#div-table-option").addClass("loader");
		},
		success: function(resp){
			$("#body-table-option tr").remove();
			$('#div-new-option').remove();
			var tr = "";
			if(resp.length > 0){
				$.each(resp, function(k,v){
					tr += "<tr id='"+v.id+"'>";
					tr += "<td>"+v.description+"</td>";
					tr += "<td class='text-right'>";
	            	tr += "<button type=\"button\" class=\"btn btn-xs btn-warning\" onclick=\"confirmDeleteOpt("+v.id+")\">apagar</button>";
					tr += "</td>";
					tr += "</tr>";
				});
			}
			else{
				if(type == 0){
					tr += "<tr><td colspan='2'>Você ainda não criou as opções da questão</td></tr>";
				} else {
					tr += "<tr><td colspan='2'>Você ainda não criou as opções da questão<br>";
					tr += "<div class='alert fresh-color alert-info' role='alert'>";
					tr += "Para adicionar opções você deve alterar o tipo da questão para <strong>Múltipla</strong></div></td><tr>";
				}
				
			}
			$("#body-table-option").append(tr);
			
			if(type == 0){
				var frm = "<div class='col-md-12' id='div-new-option'>";
				frm += "<input type='text' class='form-control' id='textDescOption' placeholder='Descrição' style='margin-bottom:4px'>";
				frm += "<button class='btn btn-success' id='btnNewOption' onclick='javascript:promptNewOption("+question+")'>Salvar nova opção</button>";
				frm += "</div><div class='clear-both'></div>"
				$("#table-option").after(frm);
			}
		},
		complete:function(){
			$("#div-table-option").removeClass("loader");
		},
		error:function(e){
			SpAlert("Ops, erro ao carregar a tabela :(\n"+e.responseText);
		}
	});
}

/**
 * 
 * @param question
 * @returns
 */
function promptNewOption(question){
	
//	var options = {
//	        message: "Descrição",
//	        title: 'Criar Opção'
//	    };
//
//	return eModal.prompt(options)
//	      .then(function(input){ saveOption(input)}, null);
	
}


/**
 * 
 * @param form
 */
function saveQuestion(form){
	var url = $("#url").val()+"setup-question/save";
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
				fillTableQuestion();
				$("#btnClear").trigger( "click" );
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
 */
function confirmDelete(id){
	SpConfirm("Deseja mesmo deletar esta questão?",deleteQuestion,id);
}

/**
 * 
 * @param id
 */
function deleteQuestion(id){
	var url = $("#url").val()+"setup-question/delete";
	$.ajax({
		url:url,
		method: "post",
		data:{question:id},
		async:true,
		beforeSend: function(){
			$("#div-table").addClass("loader");
		},
		success: function(resp){
			if(resp == "ok"){
				fillTableQuestion();
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