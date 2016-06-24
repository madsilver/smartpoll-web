<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>SmartPoll</title>
<link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:300,400' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Lato:300,400,700,900' rel='stylesheet' type='text/css'>
<link href='${pageContext.request.contextPath}/resources/css/bootstrap.min.css' rel='stylesheet' type='text/css'>
<link href='${pageContext.request.contextPath}/resources/css/font-awesome.min.css' rel='stylesheet' type='text/css'>
<link href='${pageContext.request.contextPath}/resources/css/style.css' rel='stylesheet' type='text/css'>
<link href='${pageContext.request.contextPath}/resources/css/style-form.css' rel='stylesheet' type='text/css'>
<link href='${pageContext.request.contextPath}/resources/css/themes/flat-blue.css' rel='stylesheet' type='text/css'>
<link href="${pageContext.request.contextPath}/resources/img/favicon.ico" rel="icon" type="image/x-icon">
<style>
body{padding: 20px 40px 0 40px;}
.tab-content{ padding: 40px;}
</style>
</head>
<body class="flat-blue">

    <div class="app-container">
		<div class="row content-container">
			<!-- main content -->
			<div class="container-fluid">
                <div class="row">
	
                	<!-- main -->
                	<div class="col-xs-12">
                            	<div class="card">
                                	<div class="card-header">
                                    	<div class="card-title">
                                        	<div class="title">Bem Vindo! Faça o seu cadastro</div>
                                    	</div>
                                	</div>
                                	<div class="card-body">
                                    	<div class="step">
                                        	<ul class="nav nav-tabs nav-justified" role="tablist">
                                            	<li role="step" class="step-success active">
                                                	<a href="#step1" id="step1-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">
                                                    	<div class="icon fa fa-user"></div>
                                                    	<div class="step-title">
                                                        	<div class="title">Novo Usuário</div>
                                                        	<div class="description">Informe seus dados</div>
                                                    	</div>
                                                	</a>
                                            	</li>
                                            	<li role="step">
                                                	<a href="#step2" role="tab" id="step2-tab" data-toggle="tab" aria-controls="profile">
                                                    	<div class="icon fa fa-check-circle-o"></div>
                                                    	<div class="step-title">
                                                        	<div class="title">Confirmação</div>
                                                        	<div class="description"></div>
                                                    	</div>
                                                	</a>
                                            	</li>
                                            	<li role="step">
                                                	<a href="#step3" role="tab" id="step3-tab" data-toggle="tab" aria-controls="profile">
                                                    	<div class="icon fa fa-credit-card"></div>
                                                    	<div class="step-title">
                                                        	<div class="title">Planos</div>
                                                        	<div class="description">Planos/Pagamentos</div>
                                                    	</div>
                                                	</a>
                                            	</li>
                                        	</ul>
                                        	<div class="tab-content">
                                            	<div role="tabpanel" class="tab-pane fade in active" id="step1" aria-labelledby="home-tab">
                                                	<%@ include file="tabs/tab-new-user.jsp" %>
                                            	</div>
                                            	<div role="tabpanel" class="tab-pane fade" id="step2" aria-labelledby="profile-tab">
                                                	<%@ include file="tabs/tab-confirmation.jsp" %>
                                            	</div>
                                            	<div role="tabpanel" class="tab-pane fade" id="step3" aria-labelledby="dropdown1-tab">
                                                	<%@ include file="tabs/tab-payment.jsp" %>
                                            	</div>
                                        	</div>
                                    	</div>
                                	</div>
                            	</div>
                        	</div>
                	<!-- end main -->
				</div>
			</div>
			<!-- end main content -->
       </div>
    </div>
    
    <!-- jQuery -->
    <script src="${pageContext.request.contextPath}/resources/js/libs/jquery.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/js/libs/bootstrap.min.js"></script>
    <!-- PagSeguro -->
    <script type="text/javascript" src="https://stc.pagseguro.uol.com.br/pagseguro/api/v2/checkout/pagseguro.lightbox.js"></script>
    <!-- Contact Form JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/js/libs/jqBootstrapValidation.js"></script>
    
    <script src="${pageContext.request.contextPath}/resources/js/libs/bootstrap-multiselect.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/libs/eModal.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/libs/app.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/register-user.js"></script>

</body>
</html>