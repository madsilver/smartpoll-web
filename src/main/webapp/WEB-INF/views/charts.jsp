<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>SmartPoll</title>
<!-- Fonts -->
<link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:300,400' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Lato:300,400,700,900' rel='stylesheet' type='text/css'>
<link href='${pageContext.request.contextPath}/resources/css/bootstrap.min.css' rel='stylesheet' type='text/css'>
<link href='${pageContext.request.contextPath}/resources/css/font-awesome.min.css' rel='stylesheet' type='text/css'>
<link href='${pageContext.request.contextPath}/resources/css/style.css' rel='stylesheet' type='text/css'>
<link href='${pageContext.request.contextPath}/resources/css/themes/flat-blue.css' rel='stylesheet' type='text/css'>
<link href="${pageContext.request.contextPath}/resources/img/favicon.ico" rel="icon" type="image/x-icon">
<style>
.chartdiv{
  	width:100%; 
  	height:400px;
  	float:left;
  	margin-bottom:30px;
}
.badge {
	background-color: #EA9100;
	border-radius: 10px !important;
}
.amcharts-chart-div a {
    display: none !important;
}
.flat-blue .btn.btn-default {
    background-color: #FFF;
    border-color: none;
    color: #555;
}
.radio input[type="radio"], .radio-inline input[type="radio"], .checkbox input[type="checkbox"], .checkbox-inline input[type="checkbox"] {
    display: none;
}
</style>
</head>
<body class="flat-blue">
	<div class="app-container">
		<div class="row content-container">
			<!-- navbar -->
			<%@ include file="navbar.jsp" %>
			<!-- menu -->
			<%@ include file="menu.jsp" %>
			<!-- main content -->
			<div class="container-fluid">
            	<div class="side-body padding-top">
            	
            		<!-- form -->
					<div class="col-md-12" style="margin-bottom: 12px;">	
            			<div id="div-form" class="card">
            				<!-- loading -->
            				<div class="loader-container text-center color-white">
                            	<div><i class="fa fa-spinner fa-pulse fa-3x"></i></div>
                                <div>Loading</div>
                          	</div>
                         	<div class="card-header">
                        		<div class="card-title">
                   					<div class="title">Filtros</div>
                              	</div>
                          	</div>
                           	<div class="card-body">
            					<form>
                              		<div class="form-group col-md-3">
                              			<label for="poll">Pesquisa</label>
                                    	<select id="poll" name="poll">
                                    		<option value="0">Selecione a pesquisa</option>
                                    	</select>
                              		</div>
                              		<div class="form-group col-md-3">
                              			<label for="poll">Usuário Mobile</label>
                                    	<select id="user-mobile" name="user-mobile">
                                    		<option value="0">Selecione o usuário</option>
                                    	</select>
                              		</div>
                              		<div class="form-group col-md-2">
                              			<button type="button" class="btn btn-success" id="build-graph" style="margin-top: 23px;">Gerar gráficos</button>
                              		</div>
                                    
                              	</form>
                              	<div class="clear-both"></div>
                        	</div>
                      	</div>
            		</div>
            		<!-- end form -->  
            		
					<!-- graphs -->            	
            		<div id="content"></div>
            		<!--  end graphs -->
     			</div>
			</div>		
		</div>
		<footer class="app-footer">
    		<div class="wrapper">
    			<span class="pull-right">Top <a href="#"><i class="fa fa-long-arrow-up"></i></a></span> © 2015 Copyright.
   			</div>
  		</footer>  
	</div>  
	
	<input type="hidden" id="url" value="${pageContext.request.contextPath}/"/>
	
	<script src="${pageContext.request.contextPath}/resources/js/libs/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/libs/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/libs/eModal.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/libs/app.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/libs/bootstrap-multiselect.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/libs/amcharts.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/libs/serial.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/charts.js"></script>

</body>
</html>