<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="row">
	<div class="col-md-4">
		<div class="thumbnail no-margin-bottom">
			<img src="${pageContext.request.contextPath}/resources/img/new_user.jpeg" class="img-responsive">
			<div class="caption">
				<h3 id="thumbnail-label">Quase pronto!<a class="anchorjs-link" href="#thumbnail-label"><span class="anchorjs-icon"></span></a></h3>
				<p>
				 	Uma mensagem foi enviada para o e-mail informado no cadastro. Nela encontra-se uma chave que deverá ser
					inserida no campo ao lado para ativar a sua conta.
				</p>
			</div>
		</div>
	</div>
	
	<!-- confirmation panel -->
	<div class="col-md-8">
		<div class="sub-title">Formulário de Confirmação</div>
		<form class="form-horizontal">
			<div class="form-group" style="padding-top:30px">
				<label for="email" class="col-sm-2 control-label">Chave</label>
				<div class="col-sm-6">
					<input class="form-control" id="key-confirm" type="text">
    			</div>
    			<div class="col-sm-4">
    				<button type="button" class="btn btn-success">Ativar</button>
    			</div>
			</div>
		</form>
	</div>
	<!-- end confirmation panel -->	
	
</div>