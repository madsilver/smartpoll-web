<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<div class="side-menu sidebar-inverse">
	<nav class="navbar navbar-default" role="navigation">
		<div class="side-menu-container">
			<div class="navbar-header">
				<div class="navbar-brand">
					<div class="icon fa fa-commenting-o"></div>
					<div class="title">SmartPoll</div>
				</div>
               	<button type="button" class="navbar-expand-toggle pull-right visible-xs">
           			<i class="fa fa-times icon"></i>
          		</button>
 			</div>
			<ul class="nav navbar-nav">
				<!-- dashboard -->
   				<li id="dashboard-link">
					<a href="${pageContext.request.contextPath}/dashboard/">
						<span class="icon fa fa-tv"></span><span class="title">Dashboard</span>
					</a>
				</li>
				<!-- charts -->
				<li id="charts-link">
					<a href="${pageContext.request.contextPath}/charts/">
						<span class="icon fa fa-bar-chart"></span><span class="title">Gráficos</span>
					</a>
				</li>
				<!-- maps -->
				<li id="map-link">
					<a href="${pageContext.request.contextPath}/map/">
						<span class="icon fa fa-map-marker"></span><span class="title">Mapa</span>
					</a>
				</li>
				<!-- setup -->
				<li id="setup-link" class="panel panel-default dropdown">
                  	<a aria-expanded="false" class="collapsed" data-toggle="collapse" href="#dropdown-icon">
            			<span class="icon fa fa-tasks"></span><span class="title">Configurações</span>
 					</a>
            		<div aria-expanded="false" id="dropdown-icon" class="panel-collapse collapse">
                   		<div class="panel-body">
                        	<ul class="nav navbar-nav">
                            	<li><a href="${pageContext.request.contextPath}/setup-poll/">Pesquisa</a></li>
                           		<li><a href="${pageContext.request.contextPath}/setup-question/">Questões</a></li>
                           		<li><a href="${pageContext.request.contextPath}/setup-user-mobile/">Usuários Mobile</a></li>
                         	</ul>
                       	</div>
               		</div>
               	</li>
			</ul>
		</div>
	</nav>
</div>