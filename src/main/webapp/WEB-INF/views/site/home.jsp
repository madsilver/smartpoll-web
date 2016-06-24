<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>SmartPoll- Pesquisa Inteligente</title>
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/style-home.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/themes/flat-blue.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/img/favicon.ico" rel="icon" type="image/x-icon">
    <!-- Custom Fonts -->
    <link href="${pageContext.request.contextPath}/resources/fonts/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body id="page-top" class="index">

    <!-- Navigation -->
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#page-top">SmartPoll</a>
            </div>

            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    <li class="page-scroll">
                        <a href="#about">Sobre</a>
                    </li>
                     <li class="page-scroll">
                        <a href="#plan">Planos</a>
                    </li>
                    <li class="page-scroll">
                        <a href="#contact">Contato</a>
                    </li>
                    <li class="page-scroll">
                        <a href="login/">Login</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Header -->
    <header>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/smartpoll_logo.png" alt="">
                    <div class="intro-text">
                        <span class="name">Procurando uma ferramenta de pesquisa eficiente? Achou!</span>
                        <span class="skills">Use SmartPoll, a ferramenta de pesquisa inteligente</span>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <!-- Sobre Section -->
    <section class="success" id="about">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2>Sobre</h2>
                    <hr class="star-light">
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-lg-offset-2">
                    <p>
                    Smartpoll é uma plataforma para criação de pesquisas. Basta criar uma conta e você terá acesso a 
                    um sistema inteligente onde você poderá criar suas próprias pesquisas com perguntas e respostas configuradas 
                    como você escolher. Você pode optar pelo plano gratuito ou adquirir um plano com mais recursos que atenda as 
                    suas necessidades.
                    </p>
                </div>
                <div class="col-lg-4">
                </div>
                <div class="col-lg-4">
                    <p>
                    Acessando o seu painel você terá acesso a toda informação da pesquisa com gráficos, tabelas e mapas para você 
                    controlar os locais onde as pesquisas foram feitas. 
                    Baixe o nosso aplicativo no Google Play e envie as pesquisas automaticamente, os dados são visualizados em tempo real.
					</p>
                </div>
                <div class="col-lg-8 col-lg-offset-2 text-center">
                    <a href="https://play.google.com/store/apps/details?id=br.com.silver.poll" target="_blank" class="btn btn-lg btn-outline">
                        <i class="fa fa-download"></i> Baixe o aplicativo
                    </a>
                </div>
            </div>
            <div class="row thumbs">
            <div class="col-lg-8 col-lg-offset-1" style="padding-left: 52px;">
            	<ul class="rslides" id="slider1" style="margin-top:30px;">
     					<li><img src="${pageContext.request.contextPath}/resources/img/screenshots/ssm01.png" alt=""></li>
      					<li><img src="${pageContext.request.contextPath}/resources/img/screenshots/ssm02.png" alt=""></li>
    				</ul>
    				</div>
            </div>
        </div>
    </section>

        <!-- Planos Grid Section -->
    <section id="plan">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2>Planos</h2>
                    <hr class="star-primary">
                </div>
            </div>
            <div class="row">
            <!-- row -->
            	<div class="row no-margin no-gap">
            		<!-- Plano Gratuito -->
                 	<div class="col-sm-4">
                        <div class="pricing-table green">
                            <div class="pt-header">
                                <div class="plan-pricing">
                                    <div class="pricing">Gratuito</div>
                                    <div class="pricing-type">1 pesquisa</div>
                                </div>
                            </div>
                            <div class="pt-body">
                                <h4>Plano Free</h4>
                                <ul class="plan-detail">
                                  	<li>1 Pesquisa</li>
                                    <li>2 Usuários Mobile</li>
                                    <li>1 mês de acesso aos dados</li>
                                </ul>
                            </div>
                      		<div class="pt-footer">
                    			<button type="button" class="btn btn-success" onclick="javascript:location.href='${pageContext.request.contextPath}/register-user/'">Contrate</button>
          					</div>
            			</div>
           			</div>
           			<!-- Plano Standard -->
                 	<div class="col-sm-4">
                        <div class="pricing-table blue">
                            <div class="pt-header">
                                <div class="plan-pricing">
                                    <div class="pricing">R$100</div>
                                    <div class="pricing-type">5 pesquisas</div>
                                </div>
                            </div>
                            <div class="pt-body">
                                <h4>Plano Standard</h4>
                                <ul class="plan-detail">
                                  	<li>5 Pesquisas</li>
                                    <li>5 Usuários Mobile</li>
                                    <li>3 meses de acesso aos dados</li>
                                </ul>
                            </div>
                      		<div class="pt-footer">
								<button type="button" class="btn btn-primary" onclick="javascript:location.href='${pageContext.request.contextPath}/register-user/'">Contrate</button>
          					</div>
            			</div>
           			</div>
					<!-- Plano Advanced -->
                    <div class="col-sm-4">
                        <div class="pricing-table yellow">
                            <div class="pt-header">
                                <div class="plan-pricing">
                                    <div class="pricing">R$200</div>
                                    <div class="pricing-type">Pesquisas ilimitadas</div>
                                </div>
                            </div>
                            <div class="pt-body">
                                <h4>Plano Advanced</h4>
                                <ul class="plan-detail">
                                    <li>Pesquisas ilimitadas</li>
                                    <li>15 Usuários Mobile</li>
                                    <li>6 meses de acesso aos dados</li>
                                </ul>
                            </div>
                            <div class="pt-footer">
                                 <button type="button" class="btn btn-warning" onclick="javascript:location.href='${pageContext.request.contextPath}/register-user/'">Contrate</button>
                            </div>
                        </div>
                    </div>                     
                </div>
            <!-- end row -->		
            </div>
        </div>
    </section>

    <!-- Contato Section -->
    <section id="contact">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2>Contato</h2>
                    <hr class="star-primary star-contact">
                </div>
            </div>
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2">
                    <!-- To configure the contact form email address, go to mail/contact_me.php and update the email address in the PHP file on line 19. -->
                    <!-- The form should work on most web servers, but if the form is not working you may need to configure your web server differently. -->
                    <form name="sentMessage" id="contactForm" novalidate>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Nome</label>
                                <input type="text" class="form-control" placeholder="Name" id="name" required data-validation-required-message="Please enter your name.">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Email</label>
                                <input type="email" class="form-control" placeholder="Email Address" id="email" required data-validation-required-message="Please enter your email address.">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Telefone</label>
                                <input type="tel" class="form-control" placeholder="Phone Number" id="phone" required data-validation-required-message="Please enter your phone number.">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Mensagem</label>
                                <textarea rows="5" class="form-control" placeholder="Message" id="message" required data-validation-required-message="Please enter a message."></textarea>
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <br>
                        <div id="success"></div>
                        <div class="row">
                            <div class="form-group col-xs-12">
                                <button type="submit" class="btn btn-success btn-lg">Send</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="text-center">
        <div class="footer-above">
            <div class="container">
                <div class="row">
                    <div class="footer-col col-md-4">
                        <h3>Localização</h3>
                        <p>Av Emílio Carlos, 44<br>Guarujá, SP 11410140</p>
                    </div>
                    <div class="footer-col col-md-4">
                        <h3>Around the Web</h3>
                        <ul class="list-inline" style="line-height: 45px;">
                            <li>
                                <a href="#" class="btn-social btn-outline"><i class="fa fa-fw fa-facebook"></i></a>
                            </li>
                            <li>
                                <a href="#" class="btn-social btn-outline"><i class="fa fa-fw fa-google-plus"></i></a>
                            </li>
                            <li>
                                <a href="#" class="btn-social btn-outline"><i class="fa fa-fw fa-twitter"></i></a>
                            </li>
                            <li>
                                <a href="#" class="btn-social btn-outline"><i class="fa fa-fw fa-linkedin"></i></a>
                            </li>
                            <li>
                                <a href="#" class="btn-social btn-outline"><i class="fa fa-fw fa-dribbble"></i></a>
                            </li>
                        </ul>
                    </div>
                    <div class="footer-col col-md-4">
                        <h3>Silver Code</h3>
                        <p>Empresa de tecnologia especializada em soluções inteligentes.</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer-below">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        Copyright &copy; SmartPoll 2016
                    </div>
                </div>
            </div>
        </div>
    </footer>

    <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
    <div class="scroll-top page-scroll visible-xs visible-sm">
        <a class="btn btn-primary" href="#page-top">
            <i class="fa fa-chevron-up"></i>
        </a>
    </div>

    <!-- jQuery -->
    <script src="${pageContext.request.contextPath}/resources/js/libs/jquery.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/js/libs/bootstrap.min.js"></script>
    <!-- Plugin JavaScript -->
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/libs/classie.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/libs/cbpAnimatedHeader.js"></script>
    <!-- Contact Form JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/js/libs/jqBootstrapValidation.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/libs/contact_me.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/libs/responsiveslides.min.js"></script>
    <!-- Custom Theme JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/js/home.js"></script>

</body>

</html>
