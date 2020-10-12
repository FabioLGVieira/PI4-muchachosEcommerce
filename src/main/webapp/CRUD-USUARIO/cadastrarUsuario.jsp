<%-- 
    Document   : cadastrarUsuario
    Created on : 12/10/2020, 08:00:38
    Author     : Diego Queiroz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="${pageContext.request.contextPath}/JSP-STYLES/IMAGES/LANDING-PAGE/logo-colorido.png" type="image/ico" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Usuário</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/JSP-STYLES/CSS/style.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/JSP-STYLES/CSS/swiper.min.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/JSP-STYLES/CSS/jquery-ui.css"/>

    </head>
    <jsp:include page="../navbar.jsp"/>

    <body onload="mensagemCadastro()">

        <div class="heading-bar"></div>

        <!-- INICIO DO BODY -->

        <div id="body-changes" class="text-center">

            <form id="fadeForm" class="form-type needs-validation" 
                  method="post" action="${pageContext.request.contextPath}/cadastrarUsuarioSistemaServlet" 
                  accept-charset="UTF-8" name="usuarioForm">

                <div class="alert alert-success" role="alert" style="display:none;" id='RespostaSucesso'>
                    Cadastrado com Sucesso!!
                </div>
                <div class="alert alert-danger" role="alert" style="display:none;" id='RespostaFalha'>
                    Ocorreu uma falha ao cadastrar usuario!
                </div>
                <input id="alertaR" type="hidden" value="${alertaResposta}">
                <!-- INICIO CADASTRO DE USUARIO -->
                <div class="row justify-content-center">
                    <div class="form-group col-6">
                        <h2>Usuário</h2>
                    </div>
                </div>
                <div id="erro" class="alert alert-danger" role="alert" style='display:none'>
                    <span id='mensagemVal'></span> invalido!
                </div>
                <div class="row justify-content-center">
                    <div class="form-group col-4">
                        <label> Nome Completo: </label>
                        <input type="text" class="form-control" placeholder="Nome" required name="nome" id="nome"
                               minlength="5">
                    </div>
                    <div class="form-group col-4 ">
                        <label> CPF: </label>
                        <input type="text" class="form-control" placeholder="###.###.###-##" required name="CPF" id="cpf"
                               minlength="" onfocus="validaCPF()">
                    </div>
                    <div class="form-group col-4">
                        <label> Data de Nascimento: </label>
                        <input type="text" class="form-control" placeholder="00/00/0000" required name="dataNascimento"
                               id="data" maxlength="10" onfocus="">
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="form-group col-4 ">
                        <label> Celular: </label>
                        <input type="text" class="form-control" placeholder="(00)0000-0000" required
                               id="celular" name="celular" id="celular" maxlength="15">
                    </div>
                    <div class="form-group col-4 ">
                        <label> Email: </label>
                        <input id="email" type="text" class="form-control" placeholder="exemplo@email.com" name="email"
                               onblur="checarEmail('usuarioForm', 'email')" required >
                    </div>
                    <div class=" form-group col-4 ">
                        <label> Cargo: </label>
                        <select class="form-control" name="cargo" id="cargo" required >
                            <option selected>Escolha...</option>
                            <c:forEach  var="cargo" begin="0">
                                <option  value="administrador">Administrador</option>
                                <option  value="estoquista">Estoquista</option>
                                <option  value="cliente">Cliente</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="form-group col-4 ">
                        <label> Usuário: </label>
                        <input type="text" class="form-control" placeholder="Username/Login" required name="usuario" id="usuario">
                    </div>
                    <div class="form-group col-4 ">
                        <label> Senha: </label>
                        <input type="password" class=" form-control" placeholder="*********" required name="senha" id="senha">
                    </div>
                    <div class="form-group col-4 ">
                        <label> Confirmar Senha: </label>
                        <input type="password" class=" form-control" placeholder="*********" required name="confirmaSenha" 
                               id="confirmaSenha" onblur="checarSenha('usuarioForm', 'senha', 'confirmaSenha')">
                    </div>

                </div>    
                <div class="row ">
                    <div class ="form group col-9 ">
                    </div>
                    <div class ="form group   col-sm-3 ">
                        <button type="reset" class="btn btn-primary" id="btn-form"> Cancelar </button>
                        <button type="submit" class="btn btn-primary btn-confirmar" id="btn-form" > Confirmar </button>
                    </div>
                </div>

            </form>
        </div>
        <!-- FIM FORM CADASTRO DE USUARIO -->


        <!-- FIM DO BODY -->

        <script type="text/javascript" src="${pageContext.request.contextPath}/JSP-STYLES/JS/swiper.min.js"></script>
        <script src="${pageContext.request.contextPath}/JSP-STYLES/JS/script.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/JSP-STYLES/JS/jquery-3.4.1.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/JSP-STYLES/JS/jquery.mask.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/JSP-STYLES/JS/jquery-ui.js"></script>
        <script type="text/javascript">
                                   $(document).ready(function () {
                                       var campoCPF = $("#cpf");
                                       
                                       campoCPF.mask('000.000.000-00', {reverse: true});
                                       var campoData = $("#data");
                                       campoData.mask('99/99/9999');
                                       var campoCelular = $("#celular");
                                       campoCelular.mask('(99)999999999');
                                   });



        </script>
    </body>
</html>
