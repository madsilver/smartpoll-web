<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
<link href='${pageContext.request.contextPath}/resources/css/themes/flat-blue.css' rel='stylesheet' type='text/css'>
<link href="${pageContext.request.contextPath}/resources/img/favicon.ico" rel="icon" type="image/x-icon">
<style>
table > thead > tr > th, .table > thead > tr > th, table > tbody > tr > th, .table > tbody > tr > th, table > tfoot > tr > th, .table > tfoot > tr > th, table > thead > tr > td, .table > thead > tr > td, table > tbody > tr > td, .table > tbody > tr > td, table > tfoot > tr > td, .table > tfoot > tr > td {
    border-top: 1px solid #ecf0f1;
}
#body-table .btn{
	margin-left:3px;
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
            		<div class="col-md-6">
            			<div id="div-form" class="card">
            				<!-- loading -->
            				<div class="loader-container text-center color-white">
                            	<div><i class="fa fa-spinner fa-pulse fa-3x"></i></div>
                                <div>Loading</div>
                          	</div>
                         	<div class="card-header">
                        		<div class="card-title">
                   					<div class="title">Pesquisa</div>
                              	</div>
                          	</div>
                           	<div class="card-body">
            					<form:form method="post" action="save-poll" commandName="poll">
									<input type="hidden" id="id" name="id" value="0"/>
            						
                                	<div class="form-group">
                              			<label for="description">Decrição</label>
                                    	<input class="form-control" id="description" name="description" placeholder="Descrição" type="text" required>
                              		</div>
                                    <button type="submit" class="btn btn-success">Salvar</button>
                                    <button type="button" class="btn btn-warning" id="btnClear">Limpar</button>
                              	</form:form>
                        	</div>
                      	</div>  
            		</div>
            		<!-- table -->
            		<div class="col-md-6">
            			<div id="div-table" class="card">
            				<!-- loading -->
            				<div class="loader-container text-center color-white">
                            	<div><i class="fa fa-spinner fa-pulse fa-3x"></i></div>
                                <div>Loading</div>
                          	</div>
                         	<div class="card-header">
                        		<div class="card-title">
                   					<div class="title">Tabela Pesquisa</div>
                              	</div>
                          	</div>
                           	<div class="card-body">
								<table class="table table-hover">
                                 	<thead>
                                   		<tr>
                                            <th>Descrição</th>
                                            <th></th>
                                    	</tr>
                                	</thead>
                               		<tbody id="body-table">
<%--                                		<c:if test="${not empty listPoll}">
                               			<c:forEach items="${listPoll}" var="poll">
                               			<tr>
                                           	<td>${poll.description}</td>
                                            <td>
                                            	<button type="button" class="btn btn-xs btn-primary" onclick="fillForm(${poll.id},'${poll.description}')">editar</button>
                                            	<button type="button" class="btn btn-xs btn-warning" onclick="deletPoll(${poll.id})">apagar</button>
											</td>
										</tr>
                               			</c:forEach>
                               		</c:if>	 --%>
									</tbody>
								</table>
                        	</div>
                      	</div>  
            		</div>
            		<!-- end table -->
     			</div>
			</div>
			<footer class="app-footer">
    			<div class="wrapper">
    				<span class="pull-right">Top <a href="#"><i class="fa fa-long-arrow-up"></i></a></span> © 2015 Copyright.
   				</div>
  			</footer> 
		</div> 
	</div>  
	
	<input type="hidden" id="url" value="${pageContext.request.contextPath}/"/>
	
	<script src="${pageContext.request.contextPath}/resources/js/libs/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/libs/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/libs/eModal.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/libs/app.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/setup-poll.js"></script>

</body>
</html>