<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="row">
	<div class="col-md-4">
		<div class="thumbnail no-margin-bottom">
			<img src="${pageContext.request.contextPath}/resources/img/new-user.jpg" class="img-responsive">
			<div class="caption">
				<h3 id="thumbnail-label">Conta SmartPoll<a class="anchorjs-link" href="#thumbnail-label"><span class="anchorjs-icon"></span></a></h3>
				<p>
				Este será o seu usuário de acesso a sua conta. Informe um e-mail válido para enviarmos a mensagem de confirmação para você. 
				Caso escolha por um dos planos pagos informe o mesmo cpf que você utiliza no uol pagseguro. Obrigado por escolher o SmartPoll!
				</p>
			</div>
		</div>
	</div>
                                
	<div class="col-md-8">
		<div class="sub-title">Formulário de Cadastro</div>
		
		<!-- form user -->
		<div class="col-lg-8 col-lg-offset-2">
                    <!-- To configure the contact form email address, go to mail/contact_me.php and update the email address in the PHP file on line 19. -->
                    <!-- The form should work on most web servers, but if the form is not working you may need to configure your web server differently. -->
                    <form name="sentMessage" id="contactForm" novalidate>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Nome</label>
                                <input type="text" class="form-control" placeholder="Nome" id="name" required data-validation-required-message="Digite seu nome por favor.">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>CPF</label>
                                <input type="text" class="form-control" placeholder="CPF" id="document" required data-validation-required-message="Digite seu CPF por favor." maxlength=11>
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Email</label>
                                <input type="email" class="form-control" placeholder="Email" id="email" required data-validation-required-message="Digite seu email por favor.">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Senha</label>
                                <input type="password" class="form-control" placeholder="Senha" id="senha" required data-validation-required-message="Digite sua senha por favor.">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <br>
                        <div id="success"></div>
                        <div class="row">
                            <div class="form-group col-xs-12">
                                <button type="submit" class="btn btn-success">Cadastrar</button>
                            </div>
                        </div>
                    </form>
                </div>
		<!-- end form user -->
		
	</div>                                
</div>