<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<style>
#map { height: 500px; }
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
                	<!-- map -->
					<div id="map"></div>
					<!-- end map -->
				</div>
			</div>
			<!-- end main content -->
		
			<footer class="app-footer">
    			<div class="wrapper">
    				<span class="pull-right">2.1 <a href="#"><i class="fa fa-long-arrow-up"></i></a></span> © 2015 Copyright.
   				</div>
  			</footer>  
		</div>  
	</div>
	
	<script src="${pageContext.request.contextPath}/resources/js/libs/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/libs/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/libs/app.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/map.js"></script>
	
	<script async defer
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyByqTZU6igOAQaqkgX5M0zRIMR4GuuVM98&callback=initMap">
    </script>

</body>
</html>