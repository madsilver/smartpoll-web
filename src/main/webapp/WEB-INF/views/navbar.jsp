<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<link href='${pageContext.request.contextPath}/resources/css/animate.min.css' rel='stylesheet' type='text/css'>
<nav class="navbar navbar-default navbar-fixed-top navbar-top">
 	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-expand-toggle">
				<i class="fa fa-bars icon"></i>
			</button>
			<ol class="breadcrumb navbar-breadcrumb">
				<li class="active" id="breadcrumb-title"></li>
			</ol>
            <button type="button" class="navbar-right-expand-toggle pull-right visible-xs">
             	<i class="fa fa-th icon"></i>
           	</button>
     	</div>
		<ul class="nav navbar-nav navbar-right">
       		<button type="button" class="navbar-right-expand-toggle pull-right visible-xs fa-rotate-90">
              	<i class="fa fa-times icon"></i>
      		</button>
           	<li class="dropdown profile">
           		<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Usuario admin <span class="caret"></span></a>
              	<ul class="dropdown-menu animated fadeInDown">
                 	<li class="profile-img">
                        <img src="${pageContext.request.contextPath}/resources/img/user.png" class="profile-img">
           			</li>
                  	<li>
               			<div class="profile-info">
                        	<h4 class="username">Usuario admin</h4>
                            <p>admin@smartpoll.com.br</p>
                          	<div class="btn-group margin-bottom-2x" role="group">
                            	<button type="button" class="btn btn-primary"><i class="fa fa-user"></i> Profile</button>
                            	<button type="button" class="btn btn-danger" onclick="window.location='${pageContext.request.contextPath}/'"><i class="fa fa-sign-out"></i> Logout</button>
                     		</div>
               			</div>
               		</li>
        		</ul>
        	</li>
      	</ul>
 	</div>               
</nav>