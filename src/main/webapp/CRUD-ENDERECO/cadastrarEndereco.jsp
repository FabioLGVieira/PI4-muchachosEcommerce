<%-- 
    Document   : cadastrarEndereco
    Created on : 19/09/2020, 17:32:09
    Author     : Fabio 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="${pageContext.request.contextPath}/JSP-STYLES/IMAGES/LANDING-PAGE/logo-colorido.png" type="image/ico" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Endereço</title>
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
                  method="post" action="${pageContext.request.contextPath}/cadastrarEnderecoServlet" 
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
                        <input type="hidden" value="${IDEndereco}" name="ID">
                        <h2>Endereço</h2>
                    </div>
                </div>
                <div id="erro" class="alert alert-danger" role="alert" style='display:none'>
                    <span id='mensagemVal'></span> invalido!
                </div>
                <div class="row justify-content-center">
                    <div class="form-group col-4 ">
                        <label> CEP: </label>
                        <input type="text" class="form-control" placeholder="00000-000" required name="cep" id="cep" maxlength="10" onkeypress="return onlynumber();" onkeyup="mascara('#####-###', this, event)">
                    </div>
                    <div class="form-group col-4 ">
                        <label> Cidade: </label>
                        <input type="text" class="form-control" placeholder="Chicago" required name="cidade" id="cidade" maxlength="255">
                    </div>
                    <div class="form-group col-4">
                        <label> Estado: </label>
                        <select class="form-control" name="estado" id="estado" required >
                            <option selected>Escolha...</option>
                            <option value="AC">Acre</option>
                            <option value="AL">Alagoas</option>
                            <option value="AP">Amapá</option>
                            <option value="AM">Amazonas</option>
                            <option value="BA">Bahia</option>
                            <option value="CE">Ceará</option>
                            <option value="DF">Distrito Federal</option>
                            <option value="ES">Espírito Santo</option>
                            <option value="GO">Goiás</option>
                            <option value="MA">Maranhão</option>
                            <option value="MT">Mato Grosso</option>
                            <option value="MS">Mato Grosso do Sul</option>
                            <option value="MG">Minas Gerais</option>
                            <option value="PA">Pará</option>
                            <option value="PB">Paraíba</option>
                            <option value="PR">Paraná</option>
                            <option value="PE">Pernambuco</option>
                            <option value="PI">Piauí</option>
                            <option value="RJ">Rio de Janeiro</option>
                            <option value="RN">Rio Grande do Norte</option>
                            <option value="RS">Rio Grande do Sul</option>
                            <option value="RO">Rondônia</option>
                            <option value="RR">Roraima</option>
                            <option value="SC">Santa Catarina</option>
                            <option value="SP">São Paulo</option>
                            <option value="SE">Sergipe</option>
                            <option value="TO">Tocantins</option>
                        </select>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="form-group col-8 ">
                        <label> Endereço: </label>
                        <input type="text" class="form-control" placeholder="1234 Main St" name="endereco" id="endereco" required maxlength="255">
                    </div>
                    <div class="form-group col-4">
                        <label> Complemento: </label>
                        <input type="text" class="form-control" placeholder="Apartament" name="complemento" id="complemento" required maxlength="20">
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
