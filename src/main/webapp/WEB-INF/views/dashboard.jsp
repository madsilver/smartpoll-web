<%@ page language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
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
                	<!--  row 1 -->
                	<div class="row">
                        <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                            <a href="#">
                                <div class="card red summary-inline">
                                    <div class="card-body">
                                        <i class="icon fa fa-comments fa-4x"></i>
                                        <div class="content">
                                            <div class="title" id="total-poll">${count}</div>
                                            <div class="sub-title">Pessoas entrevistadas</div>
                                        </div>
                                        <div class="clear-both"></div>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                            <a href="#">
                                <div class="card yellow summary-inline">
                                    <div class="card-body">
                                        <i class="icon fa fa-calendar-check-o fa-4x"></i>
                                        <div class="content">
                                            <div class="title" id="total-days">${days}</div>
                                            <div class="sub-title">Dias de pesquisa</div>
                                        </div>
                                        <div class="clear-both"></div>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                            <a href="#">
                                <div class="card green summary-inline">
                                    <div class="card-body">
                                        <i class="icon fa fa-tablet fa-4x"></i>
                                        <div class="content">
                                            <div class="title">2</div>
                                            <div class="sub-title">Usuários Mobile</div>
                                        </div>
                                        <div class="clear-both"></div>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                            <a href="#">
                                <div class="card blue summary-inline">
                                    <div class="card-body">
                                        <i class="icon fa fa-file-text-o fa-4x"></i>
                                        <div class="content">
                                            <div class="title">1</div>
                                            <div class="sub-title">Pesquisas criadas</div>
                                        </div>
                                        <div class="clear-both"></div>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                	<!-- end row 1 -->
                	<!-- row 2 -->
               		<div class="row">
               			<!-- graph -->
               			<div class="col-md-6">
                            <div class="card primary">
                          		<div class="card-jumbotron no-padding">
                                     <canvas id="jumbotron-line-2-chart" class="chart no-padding" width="285" height="142" style="width: 285px; height: 142px;"></canvas>
                              	</div>
                                <div class="card-body half-padding">
                                   	<h4 class="float-left no-margin font-weight-300">Comunicação Mobile</h4>
                                    <div class="clear-both"></div>
                                </div>
                        	</div>
                       	</div>
                		
                    </div>
                    <!-- end row 2 -->
                </div>
			</div>
		
			<footer class="app-footer">
    			<div class="wrapper">
    				<span class="pull-right">Top <a href="#"><i class="fa fa-long-arrow-up"></i></a></span> © 2015 Copyright.
   				</div>
  			</footer>  
		</div>  
	</div>
	
	<script src="${pageContext.request.contextPath}/resources/js/libs/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/libs/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/libs/Chart.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/libs/app.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/dashboard.js"></script>

</body>
</html>

