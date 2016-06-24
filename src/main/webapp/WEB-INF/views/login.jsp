<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SmartPoll</title>
<link href="${pageContext.request.contextPath}/resources/img/favicon.ico" rel="icon" type="image/x-icon">
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet" />
<style>
body{
	padding-top: 80px;
    padding-bottom: 40px;
    background-image: url("${pageContext.request.contextPath}/resources/img/bg-home.jpg");
    background-repeat: no-repeat;
	background-position: center;
}
.container img{
	margin-bottom:10px;
}
.form-signin .col-md-8, .col-md-4{
	margin-top: 6px;
}
.nopadding {
   padding: 0 !important;
}
</style>   
</head>
<body>
<div class="container">
	<div class="col-md-4"></div>
	<div class="col-md-4" style="width:326px;">
		<img src="${pageContext.request.contextPath}/resources/img/smartpoll_logo.png">
		<form class="form-signin" method="post" action="auth">
        	<input type="text" name="username" class="form-control" placeholder="Username" required autofocus>
        	<div class="col-md-8 nopadding">
        		<input type="password" name="password" class="form-control" placeholder="Password" required>
        	</div>
        	<div class="col-md-4">
        		<button class="btn btn-primary" type="submit">Entrar</button>
        	</div>
        	<div class="col-md-12">
        		<div class="checkbox">
          			<label>
            			<input type="checkbox" value="remember-me"> Remember me
          			</label>
        		</div>
        	</div>
 		</form>
	</div>
	<div class="col-md-4"></div>
</div> <!-- /container -->

<script src="${pageContext.request.contextPath}/resources/js/libs/jquery-1.11.3.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/libs/bootstrap-3.1.1.min.js"></script>

</body>
</html>




