var colors = ["#81acd9","#97DB67","#FF4444","#AC95BC","#FF9E01","#7f8da9","#db4c3c","#F8FF01"];

$( document ).ready(function() {
	
	$("#charts-link").addClass("active");
	$("#breadcrumb-title").text("Graficos");
	
	$('#poll').multiselect({
        maxHeight: 160,
        buttonWidth: '100%'
    });
	
	fillSelectPoll();
	
	$('#user-mobile').multiselect({
        maxHeight: 160,
        buttonWidth: '100%'
    });
	
	$("#build-graph").click(function(){
		var poll = $("#poll").val();
		if(poll > 0){
			$('#content').empty();
			//setInterval(ajaxMultiQuestion(), 60000);
			ajaxMultiQuestion();
			//ajaxSingleQuestion();
		} else {
			SpAlert("Selecione a pesquisa");
		}
	
	});
    
});

/**
 * Preenche o select pesquisas
 */
function fillSelectPoll(poll){
	var url = $("#url").val()+"setup-poll/table";
	var options = [{label: 'Selecione a pesquisa', title: 'Selecione a pesquisa', value: '0'}];
	$.ajax({
		url:url,
		method: "post",
		dataType:"json",
		data:{poll:poll},
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
 * Consulta que retorna os dados das questões múltiplas
 */
function ajaxMultiQuestion(){
	$.ajax({
		url:"multi-question",
		data:{"poll":"1"},
		async:true,
		dataType:"json",
		method:"post",
		beforeSend: function(){
			$("#div-form").addClass("loader");
		},
		success: function(resp){
			processChart(resp);
		},
		error: function (request, status, error) {
			alert(request.responseText);
		},
		complete: function(){
			$("#div-form").removeClass("loader");
			ajaxSingleQuestion();
		}
	});
}

/**
 * Consulta que retorna os dados das questões múltiplas
 */
function ajaxSingleQuestion(){
	$.ajax({
		url:"single-question",
		data:{"poll":"1"},
		async:true,
		dataType:"json",
		method:"post",
		beforeSend: function(){
			$("#div-form").addClass("loader");
		},
		success: function(resp){
			processList(resp);
		},
		error: function (request, status, error) {
			alert(request.responseText);
		},
		complete: function(){
			$("#div-form").removeClass("loader");
		}
	});
}

/**
 * Processa e desenha o gráfico
 * @param data
 */
function processChart(data){
	var idDiv = 0, sumPoll = 0;
	
	$.each(data, function(index,v){
		var sum = 0, 
			sumLength = 0,
			chartData = [],
			graphs = [];
		
		for(i=0; i< v.length; i++){
			var axis = v[i][0];
			var axisValue = v[i][1];
			sum += axisValue;
			if(sumLength < 20) sumLength = axis.length;
			var jChart = {};
			jChart["eixo"] = axis;
			jChart[axis] = axisValue;
			chartData[i] = jChart;
			
			graphs[i] = {
                    title: axis,
	                valueField: axis,
	                labelText: "[[share]]%",
	                type: "column",
	                lineAlpha: 0,
	                fillAlphas: 1,
	                fillColors: colors[i],
	                valueAxis: "defaultAxis"
                };
		}
		//Calcula a porcentagem
		for (var x in chartData) {
			var key = chartData[x].eixo;
			var v = chartData[x][key];
		    chartData[x].share = Math.round(v / sum * 100);
		    sumPoll = sum;
		}
		
		var rotate = sumLength > 20 ? true : false;
		var id = 'chartdiv_' + idDiv++;

//		$('<div/>',{class:'alert fresh-color alert-success'}).text(index).appendTo('#content');
//		$('<div/>',{id : id, class:'chartdiv' }).appendTo('#content');
		
		var div = "<div class='col-md-6'><div class='panel fresh-color panel-primary'>";
		div += "<div class='panel-heading'><h4>"+index+"</h4></div>";
		div += "<div class='panel-body'>";
		div += "<div id='"+id+"' class='chartdiv'></div>";
		div += "</div></div></div>";
		$('#content').append(div);
		
		columnChart(chartData, graphs, id, rotate);
	});		
}

/**
 * Column Chart
 * @param chartData
 * @param graphs
 * @param div
 * @param rotate
 */
function columnChart(chartData, graphs, div, rotate){
	
	var chart = AmCharts.makeChart(div, {
        type: "serial",
        dataProvider: chartData,
        categoryField: "eixo",
        startDuration: 1,
        plotAreaBorderColor: "#DADADA",
        plotAreaBorderAlpha: 1,
        rotate: rotate,
        legend: { position: "top" },
        valueAxes: [{ id: "defaultAxis",  stackType: "regular" }],
        graphs: graphs
    });
}

/**
 * Pie Chart
 */
function pieChart(chartData, div, field){

    chart = new AmCharts.AmPieChart();
    chart.dataProvider = chartData;
    chart.titleField = "eixo";
    chart.valueField = field;
    chart.outlineColor = "#FFFFFF";
    chart.outlineAlpha = 0.8;
    chart.outlineThickness = 2;

    chart.write(div);
}

function processList(data){
	
	$.each(data, function(index,v){
		
		var ul = "<ul class='list-group'>";
		
		for(i=0; i< v.length; i++){
			ul += "<li class='list-group-item'><span class='badge'>"+v[i][1]+"</span>"+v[i][0]+"</li>";
		}
		ul += "</ul>";
		
		var div = "<div class='col-md-6'><div class='panel fresh-color panel-primary'>";
		div += "<div class='panel-heading'><h4>"+index+"</h4></div>";
		div += "<div class='panel-body' style='overflow-y: auto;'>";
		div += "<div class='chartdiv'>"+ul+"</div>";
		div += "</div></div></div>";
		$('#content').append(div);
	
	
	});

	
	
	
}