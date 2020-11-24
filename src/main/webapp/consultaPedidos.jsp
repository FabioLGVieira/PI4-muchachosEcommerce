<%-- 
    Document   : consultaPedidos
    Created on : 23/11/2020, 20:17:54
    Author     : Diego Queiroz 
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="${pageContext.request.contextPath}/JSP-STYLES/IMAGES/LANDING-PAGE/logo-colorido.png" type="image/ico" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consulta de Pedidos</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/JSP-STYLES/CSS/style.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/JSP-STYLES/CSS/swiper.min.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/JSP-STYLES/CSS/jquery-ui.css"/>
    </head>
    <style type="text/css">

    </style>

    <jsp:include page="navbar.jsp"/>

    <body onload="mensagemCadastro()">

        <div class="heading-bar"></div>
        <div class="clear"></div>
        <!-- INICIO DO BODY -->
        <div id="" class="text-center" style="margin-top: 20px;">
            <form id="FadeForm" class="form-type" 
                  action="${pageContext.request.contextPath}/consultaPedidosSistemaServlet" method = "post" accept-charset="UTF-8"
                  style="max-width: 1300px; height:auto; max-height: 800px;">
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
                    <h2>Consulta</h2>
                </div>
                <div class="row justify-content-center">
                    <div class="input-group col-12">
                        <input type="text" class="form-control" placeholder="O que você busca?" 
                               aria-label="Recipient's username" aria-describedby="button-addon2" name="Busca">
                        <div class="input-group-append">
                            <button class="btn btn-outline-secondary" type="submit" id="button-addon2">Pesquisar <i class="fa fa-search"></i></button>
                        </div>
                    </div>
                </div>
                <br>
                <div class="row justify-content-center">
                    <div class="form-group col-12">
                        <div class="table-wrapper-scroll-y my-custom-scrollbar col-12" id="style-1" style="min-height:700px ;max-height:800px;">
                            <table class="table" style="color:white;">
                                <thead>
                                    <tr>
                                        <th scope="col">Pedido</th>
                                        <th scope="col">Data</th>
                                        <th scope="col">Valor</th>
                                        <th scope="col">Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items ="${listaPedidos}" var="pedido">
                                        <tr>
                                            <td>

                                                <div>
                                                    <c:out value="${pedido.getID()}"/>
                                                </div>

                                            </td>
                                            <td>
                                                <p>
                                                    <c:out value="${pedido.formatarData(pedido.getDataPedido())}"/>
                                                </p>
                                            </td>
                                            <td><c:out value="${pedido.formatarValor(pedido.getValor())}"/></td>
                                            <!-- TD DE DETALHES DE PEDIDO -->
                                            <td>
                                                <c:out value="${pedido.getStatus()}"/>
                                            </td>  
                                            <!-- FIM TD DE DETALHES DE PEDIDO -->
                                            <!-- TD DE EXCLUSAO DE ENDERECO -->
                                            <td style="max-width:50px"><input type="hidden" value="${pedido.getID()}" name="ID">
                                                <form></form>
                                                <form  method="post" action="${pageContext.request.contextPath}/editarStatusPedidoServlet">

                                                    <!-- Button trigger modal -->
                                                    <button class="btn-form-button edit-button" id="btn-form-search"  type="button" 
                                                            alt="Detalhes do Pedido" data-toggle="modal" data-target="#modalEdicao${pedido.getID()}">Mudar Status</button>
                                                    <!-- MODAL CONFIRMAR EXCLUSÃO-->
                                                    <div class="modal fade" id="modalEdicao${pedido.getID()}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                                        <div class="modal-dialog modal-dialog-centered" role="document" style="color: black;">
                                                            <div class="modal-content">
                                                                <input type="hidden" value="${pedido.getID()}" name="ID">
                                                                <div class="modal-header">
                                                                    <h5 class="modal-title" id="exampleModalLongTitle">Mudar Status</h5>
                                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                        <span aria-hidden="true">&times;</span>
                                                                    </button>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <div class=" form-group col-12 ">
                                                                        <label> Status: </label>
                                                                        <select class="form-control" name="Status" id="Status" required >
                                                                            <option value="<c:out value="${pedido.getStatus()}"/>" selected><c:out value="${pedido.getStatus()}"/></option>
                                                                            <option  value="Aguardando Pagamento">Aguardando Pagamento</option>
                                                                            <option  value="Pagamento Rejeitado">Pagamento Rejeitado</option>
                                                                            <option  value="Pagamento com Sucesso">Pagamento com Sucesso</option>
                                                                            <option  value="Aguardando Retirada">Aguardando Retirada</option>
                                                                            <option  value="Em transito">Em transito</option>
                                                                            <option  value="Entregue">Entregue</option>
                                                                        </select>
                                                                    </div>
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
            </form>
        </div>

        <!-- FIM DO BODY -->
        <div class="footer-bar"></div>

        <!--FOOTER -->
        <footer>
            <div id="copyrightBox">
                <p id="copyright">
                    As ofertas são válidas por tempo determinado e/ou enquanto durarem os estoques. Nosso serviço de entregas não permite encomendas feitas com endereçamento de Caixa Postal.</p>
                <p id="copyright"> 
                    Os preços apresentados no site não são obrigatoriamente iguais aos apresentados na rede de lojas físicas do Projeto X, e somente são válidos para as compras efetuadas no ato de sua exibição.
                </p>
                <p id="copyright"> 
                    Projeto X é uma empresa do grupo Projeto X S.A., CNPJ nº 54.345.056/0054-07, Av Faria Lima, nº 15461, São Paulo – SP.
                </p>
            </div>
        </footer>
        <script type="text/javascript" src="${pageContext.request.contextPath}/JSP-STYLES/JS/swiper.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/JSP-STYLES/JS/script.js"></script> 
        <script type="text/javascript" src="${pageContext.request.contextPath}/JSP-STYLES/JS/jquery-3.4.1.min.js"></script>
    </body>
</html>