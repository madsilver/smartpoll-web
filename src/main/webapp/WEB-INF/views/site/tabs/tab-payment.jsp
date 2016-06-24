<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="row">
	<div class="col-md-4">
		<div class="thumbnail no-margin-bottom">
			<img src="${pageContext.request.contextPath}/resources/img/new-user3.jpg" class="img-responsive">
			<div class="caption">
				<h3 id="thumbnail-label">Planos SmartPoll<a class="anchorjs-link" href="#thumbnail-label"><span class="anchorjs-icon"></span></a></h3>
				<p>
				 	Os planos são estruturados pensando na melhor forma de atendê-lo. Caso tenha alguma necessidade específica
				 	não hesite em entrar em contato.
				</p>
			</div>
		</div>
	</div>
	
	<div class="col-md-8">
		<div class="sub-title">Escolha o seu plano</div>
		
		<!-- payment panel -->
<div class="step tabs-left card-no-padding">
	<ul class="nav nav-tabs" role="tablist">
		<li role="step" class="active">
			<a href="#stepv1" id="step1-vtab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">
				<div class="icon fa fa-hand-paper-o"></div>
				<div class="step-title">
					<div class="title">Gratuito</div>
					<div class="description">R$  0</div>
				</div>
			</a>
		</li>
		<li class="" role="step">
			<a aria-expanded="false" href="#stepv2" role="tab" id="step2-vtab" data-toggle="tab" aria-controls="profile">
				<div class="icon fa fa-credit-card"></div>
				<div class="step-title">
					<div class="title">Standard</div>
					<div class="description">R$ 100</div>
				</div>
			</a>
		</li>
		<li class="" role="step">
 			<a aria-expanded="false" href="#stepv3" role="tab" id="step3-vtab" data-toggle="tab" aria-controls="profile">
				<div class="icon fa fa-credit-card"></div>
				<div class="step-title">
					<div class="title">Advanced</div>
					<div class="description">R$ 200</div>
				</div>
			</a>
		</li>
	</ul>
	<div class="tab-content">
		<div role="tabpanel" class="tab-pane fade active in" id="stepv1" aria-labelledby="home-tab">
			<p>
				<ul class="plan-detail">
           			<li>1 Pesquisa</li>
                    <li>2 Usuários Mobile</li>
                   	<li>1 mês de acesso aos dados</li>
     			</ul>
				<button type="button" class="btn btn-success">Contrate</button>
			</p>
		</div>
		<div role="tabpanel" class="tab-pane fade" id="stepv2" aria-labelledby="profile-tab">
			<p>
			<ul class="plan-detail">
                                  						<li>5 Pesquisas</li>
                                    					<li>5 Usuários Mobile</li>
                                    					<li>3 meses de acesso aos dados</li>
                                					</ul>
			<!-- INICIO FORMULARIO BOTAO PAGSEGURO -->
													<form action="https://pagseguro.uol.com.br/checkout/v2/payment.html" method="post" onsubmit="PagSeguroLightbox(this); return false;">
														<input type="hidden" name="code" value="786520208080CD9114973F91361F05F6" />
														<input type="image" src="https://p.simg.uol.com.br/out/pagseguro/i/botoes/pagamentos/120x53-pagar-azul.gif" name="submit" alt="Pague com PagSeguro - é rápido, grátis e seguro!" />
													</form>
													<!-- FINAL FORMULARIO BOTAO PAGSEGURO -->
			</p>
		</div>
		<div role="tabpanel" class="tab-pane fade" id="stepv3" aria-labelledby="dropdown1-tab">
			<p>
				<ul class="plan-detail">
                                    					<li>Pesquisas ilimitadas</li>
                                    					<li>15 Usuários Mobile</li>
                                    					<li>6 meses de acesso aos dados</li>
                </ul>
			<!-- INICIO FORMULARIO BOTAO PAGSEGURO -->
													<form action="https://pagseguro.uol.com.br/checkout/v2/payment.html" method="post" onsubmit="PagSeguroLightbox(this); return false;">
														<input type="hidden" name="code" value="797441DF3F3F8F2FF4EA3FAC5540B16B" />
														<input type="image" src="https://p.simg.uol.com.br/out/pagseguro/i/botoes/pagamentos/120x53-pagar-laranja.gif" name="submit" alt="Pague com PagSeguro - é rápido, grátis e seguro!" />
													</form>
													<!-- FINAL FORMULARIO BOTAO PAGSEGURO -->
			</p>
		</div>
		<div role="tabpanel" class="tab-pane fade" id="dropdown2" aria-labelledby="dropdown2-tab">
			<p>
			
			</p>
		</div>
	</div>
</div>
<!-- end payment panel -->
	</div>	

</div>