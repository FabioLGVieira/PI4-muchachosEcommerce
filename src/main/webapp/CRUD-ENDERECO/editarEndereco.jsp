<%-- 
    Document   : consultaEndereco
    Created on : 24/10/2020, 17:47:22
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
                  method="post" action="${pageContext.request.contextPath}/editarEnderecoServlet" 
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
                        <input type="hidden" value="${endereco.getID()}" name="ID">
                        <h2>Endereço</h2>
                    </div>
                </div>
                <div id="erro" class="alert alert-danger" role="alert" style='display:none'>
                    <span id='mensagemVal'></span> invalido!
                </div>
                <div class="row justify-content-center">
                    <div class="form-group col-4 ">
                        <label> CEP: </label>
                        <input type="text" class="form-control" placeholder="00000-000" required name="cep" id="cep" 
                               maxlength="10" onkeypress="return onlynumber();" onkeyup="mascara('#####-###', this, event)"
                               value="${endereco.getCEP()}">
                    </div>
                    <div class="form-group col-4 ">
                        <label> Cidade: </label>
                        <input type="text" class="form-control" placeholder="Chicago" required name="cidade" 
                               id="cidade" maxlength="255" value="${endereco.getCidade()}">
                    </div>
                    <div class="form-group col-4">
                        <label> Estado: </label>
                        <select class="form-control" name="estado" id="estado" required >
                            <option selected>Escolha...</option>
                            <option selected  value="${endereco.getEstado()}">${endereco.getEstado()}</option>
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
                        <label> Rua: </label>
                        <input type="text" class="form-control" placeholder="1234 Main St" name="endereco" 
                               id="endereco" required maxlength="255" value="${endereco.getEndereco()}">
                    </div>
                    <div class="form-group col-4">
                        <label> Complemento: </label>
                        <input type="text" class="form-control" placeholder="Apartament" name="complemento" 
                               id="complemento" required maxlength="20" value="${endereco.getComplemento()}">
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
        <div class="footer-bar"></div>

        <!--FOOTER -->
        <footer>
            <div class="footerBox">
                
            </div>


            <div class="footerBox">
                
            </div>

            <div class="footerBox">
                
            </div>

            <hr>

            <div id="copyrightBox">
                
            </div>
        </footer>
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
     <!-- Script API Viacep -->
        <script>
             $(document).ready(function() {

            function limpa_formulário_cep() {
                // Limpa valores do formulário de cep.
                $("#endereco").val("");
                $("#bairro").val("");
                $("#cidade").val("");
                $("#estado").val("");
                $("#ibge").val("");
            }
            
            //Quando o campo cep perde o foco.
            $("#cep").blur(function() {

                //Nova variável "cep" somente com dígitos.
                var cep = $(this).val().replace(/\D/g, '');

                //Verifica se campo cep possui valor informado.
                if (cep != "") {

                    //Expressão regular para validar o CEP.
                    var validacep = /^[0-9]{8}$/;

                    //Valida o formato do CEP.
                    if(validacep.test(cep)) {

                        //Preenche os campos com "..." enquanto consulta webservice.
                        $("#endereco").val("...");
                        $("#bairro").val("...");
                        $("#cidade").val("...");
                        $("#estado").val("...");
                        $("#ibge").val("...");

                        //Consulta o webservice viacep.com.br/
                        $.getJSON("https://viacep.com.br/ws/"+ cep +"/json/?callback=?", function(dados) {

                            if (!("erro" in dados)) {
                                //Atualiza os campos com os valores da consulta.
                                $("#endereco").val(dados.logradouro);
                                $("#bairro").val(dados.bairro);
                                $("#cidade").val(dados.localidade);
                                $("#estado").val(dados.uf);
                                $("#ibge").val(dados.ibge);
                            } //end if.
                            else {
                                //CEP pesquisado não foi encontrado.
                                limpa_formulário_cep();
                                alert("CEP não encontrado.");
                            }
                        });
                    } //end if.
                    else {
                        //cep é inválido.
                        limpa_formulário_cep();
                        alert("Formato de CEP inválido.");
                    }
                } //end if.
                else {
                    //cep sem valor, limpa formulário.
                    limpa_formulário_cep();
                }
            });
        });
        </script>
</html>
