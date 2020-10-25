<%-- 
    Document   : consultaEnderecoCliente
    Created on : 23/10/2020, 18:20:42
    Author     : Fabio 
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="${pageContext.request.contextPath}/JSP-STYLES/IMAGES/LANDING-PAGE/logo-colorido.png" type="image/ico" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consulta de Enderecos</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/JSP-STYLES/CSS/style.css"/>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/JSP-STYLES/CSS/swiper.min.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <style type="text/css">

    </style>

    <jsp:include page="../navbar.jsp"/>

    <body onload="mensagemCadastro()">

        <div class="heading-bar"></div>
        <div class="clear"></div>
        <!-- INICIO DO BODY -->
        <div id="" class="text-center" style="margin-top: 20px;">
            <div id="FadeForm" class="form-type" 
                 action="${pageContext.request.contextPath}/consultaEnderecoServlet" method = "post" accept-charset="UTF-8"
                 style="max-width: 1300px; height:auto; max-height: 800px; background-color:white; color:black;">
                <input type="hidden" value="${endereco.getID()}" name="ID">
                <!-- ALERTA DE SUCESSO OU FALHA -->
                <div class="alert alert-success" role="alert" style="display:none;" id='RespostaSucesso'>
                    Atualizado com Sucesso!!
                </div>
                <div class="alert alert-danger" role="alert" style="display:none;" id='RespostaFalha'>
                    Ocorreu uma falha ao atualizar produto!
                </div>
                <input id="alertaR" type="hidden" value="${alertaResposta}">

                <!-- TABELA DE CONSULTA -->
                <div class="row justify-content-center">
                    <h3>Meus Endereços</h3>
                </div>
                <br>
                <div class="row justify-content-center">
                    <div class="form-group col-12">
                        <div class="table-wrapper-scroll-y my-custom-scrollbar" id="style-1" style="min-height:200px ;max-height:800px;">
                            <table class="table">
                                <thead>
                                    <tr>
                                        
                                        <th scope="col">CEP</th>
                                        <th scope="col">Endereço</th>
                                        <th scope="col">Cidade</th>
                                        <th scope="col">Estado</th>
                                        <th scope="col">Complemento</th>
                                        <th scope="col">Opções</th>
                                        <!-- MODAL DE CADASTRO DE ENDEREÇO -->
                                        <th>
                                            <button style="width:50px; height:40px;" class="btn-form-button"  data-toggle="modal" data-target="#modalAdicionar" id="btn-form-search" alt="Adicionar Produto"><i class="fas fa-plus-circle"></i> </button>
                                            <div class="modal fade" id="modalAdicionar" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true"
                                                 onload="masks()">
                                                <div class="modal-dialog modal-dialog-centered-lg" role="document" style="color: black;">
                                                    <div class="modal-content" style="background: transparent; border:none; width:600px; height:450px; margin-top:120px;">

                                                        <form id="fadeForm" class="form-type needs-validation col" 
                                                              method="post" action="${pageContext.request.contextPath}/cadastrarEnderecoServlet" 
                                                              accept-charset="UTF-8" name="usuarioForm" style="margin: 1%; background-color:white; width:98%;color:black;">

                                                            <div class="alert alert-success" role="alert" style="display:none;" id='RespostaSucesso'>
                                                                Cadastrado com Sucesso!!
                                                            </div>
                                                            <div class="alert alert-danger" role="alert" style="display:none;" id='RespostaFalha'>
                                                                Ocorreu uma falha ao cadastrar usuario!
                                                            </div>
                                                            <input id="alertaR" type="hidden" value="${alertaResposta}">
                                                            <!-- INICIO CADASTRO DE USUARIO -->
                                                            <div class="row justify-content-center">
                                                                <div class="form-group col-4">
                                                                    <input type="hidden" value="${IDUsuario}" name="ID"> 
                                                                    <input type="hidden" value="visualizarEnderecos" name="frontEnd"> 
                                                                    <h3>Endereço</h3>
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
                                                                    <input type="text" class="form-control" placeholder="São Paulo" required name="cidade" id="cidade" maxlength="255">
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
                                                                <div class="form-group col-12 ">
                                                                    <label> Endereço: </label>
                                                                    <input type="text" class="form-control" placeholder="1234 Main St" name="endereco" id="endereco" required maxlength="255">
                                                                </div>
                                                            </div>
                                                            <div class="row justify-content-center">
                                                                <div class="form-group col-12">
                                                                    <label> Complemento: </label>
                                                                    <input type="text" class="form-control" placeholder="Apartament" name="complemento" id="complemento"  maxlength="20">
                                                                </div>
                                                            </div>
                                                            <div class="row justify-content-center">
                                                                <div class ="form group col-3 ">
                                                                    <button type="reset" class="btn btn-primary" id="btn-form" data-dismiss="modal"> Cancelar </button>
                                                                </div>
                                                                <div class ="form group   col-3">
                                                                    <button type="submit" class="btn btn-primary btn-confirmar-cliente" id="btn-form" > Confirmar </button>
                                                                </div>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </th>
                                        <!-- FIM MODAL DE CADASTRO DE ENDEREÇO -->
                                    </tr>
                                </thead>
                                <tbody>
                                    <%-- ESSE FORM É UM FORM QUE QUEBRA PARA RESOLVER UM BUG! --%>
                                <form></form>
                                <%-- FIM --%>
                                <c:forEach items ="${listaEndereco}" var="endereco">
                                    <tr>
                                        
                                        <td><c:out value="${endereco.getCEP()}"/></td>
                                        <td style="max-width:250px;"><c:out value="${endereco.getEndereco()}"/></td>
                                        <td><c:out value="${endereco.getCidade()}"/></td>
                                        <td><c:out value="${endereco.getEstado()}"/></td>
                                        <td><c:out value="${endereco.getComplemento()}"/></td>


                                        <!-- TD DE EDIÇÃO DE ENDERECO -->
                                        <td>
                                            <button style="width:50px; height:40px;" class="btn-form-button"  data-toggle="modal" data-target="#modalEditar${endereco.getID()}" id="btn-form-search" alt="Editar Endereço"><i class="fa fa-edit"></i> </button>
                                            <div class="modal fade" id="modalEditar${endereco.getID()}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true"
                                                 onload="masks()">
                                                <div class="modal-dialog modal-dialog-centered-lg" role="document" style="color: black;">
                                                    <div class="modal-content" style="background: transparent; border:none; width:600px; height:450px; margin-top:120px;">

                                                        <form id="fadeForm" class="form-type needs-validation" 
                                                              method="post" action="${pageContext.request.contextPath}/editarEnderecoServlet" 
                                                              accept-charset="UTF-8" name="usuarioForm" style="margin: 1%; background-color:white; width:98%;color:black;">

                                                            <div class="alert alert-success" role="alert" style="display:none;" id='RespostaSucesso'>
                                                                Cadastrado com Sucesso!!
                                                            </div>
                                                            <div class="alert alert-danger" role="alert" style="display:none;" id='RespostaFalha'>
                                                                Ocorreu uma falha ao cadastrar usuario!
                                                            </div>
                                                            <input id="alertaR" type="hidden" value="${alertaResposta}">
                                                            <!-- INICIO EDIÇÃO DE ENDEREÇO -->
                                                            <div class="row justify-content-center">
                                                                <div class="form-group col-4">
                                                                    <input type="hidden" value="${endereco.getID()}" name="ID">  
                                                                    <input type="hidden" value="visualizarEnderecos" name="frontEnd"> 
                                                                    <h3>Endereço</h3>
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
                                                                <div class="form-group col-12 ">
                                                                    <label> Endereço: </label>
                                                                    <input type="text" class="form-control" placeholder="1234 Main St" name="endereco" 
                                                                           id="endereco" required maxlength="255" value="${endereco.getEndereco()}">
                                                                </div>

                                                            </div>
                                                            <div class="row justify-content-center">
                                                                <div class="form-group col-12">
                                                                    <label> Complemento: </label>
                                                                    <input type="text" class="form-control" placeholder="Apartament" name="complemento" 
                                                                           id="complemento" required maxlength="20" value="${endereco.getComplemento()}">
                                                                </div>
                                                            </div>
                                                            <div class="row justify-content-center">
                                                                <div class ="form group col-3 ">
                                                                    <button type="reset" class="btn btn-primary" id="btn-form" data-dismiss="modal"> Cancelar </button>
                                                                </div>
                                                                <div class ="form group   col-3">
                                                                    <button type="submit" class="btn btn-primary btn-confirmar-cliente" id="btn-form" > Confirmar </button>
                                                                </div>
                                                            </div>

                                                        </form>
                                                    </div>
                                                </div>
                                            </div>

                                        </td> 
                                        <!-- TD DE EXCLUSAO DE ENDERECO -->
                                        <td >
                                            <form  method="post" action="${pageContext.request.contextPath}/deletarEnderecoServlet">
                                                <input type="hidden" value="${endereco.getID()}" name="ID">
                                                <input type="hidden" value="visualizarEnderecos" name="frontEnd">
                                                <input type="hidden" value="visualizarEnderecos" name="finalizarCompra">
                                                <!-- Button trigger modal -->
                                                <button style="width:50px; height:40px;" type="button" class="btn-form-button" data-toggle="modal" data-target="#modalExclusao${endereco.getID()}" id="btn-form-search"> 
                                                    <i class="fa fa-times"></i>
                                                </button>

                                                <!-- MODAL CONFIRMAR EXCLUSÃO-->
                                                <div class="modal fade" id="modalExclusao${endereco.getID()}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                                    <div class="modal-dialog modal-dialog-centered" role="document" style="color: black;">
                                                        <div class="modal-content">
                                                            <input type="hidden" value="${endereco.getID()}" name="ID">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="exampleModalLongTitle">Deletar Endereço</h5>
                                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                    <span aria-hidden="true">&times;</span>
                                                                </button>
                                                            </div>
                                                            <div class="modal-body">
                                                                Tem certeza que deseja deletar o Endereço: ${endereco.getEndereco()}?
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                                                                <button type="submit" class="btn btn-warning">Confirmar</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- FIM MODAL -->
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

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
        <script type="text/javascript">

        </script>
    </body>
</html>

