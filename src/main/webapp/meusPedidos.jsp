<%-- 
    Document   : meusPedidos
    Created on : 13/11/2020
    Author     : Ramses Souza
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <link rel="icon" href="${pageContext.request.contextPath}/JSP-STYLES/IMAGES/LANDING-PAGE/booksicon.ico" type="image/ico" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Meus Pedidos</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/JSP-STYLES/CSS/style.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/JSP-STYLES/CSS/swiper.min.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <style type="text/css">
        #body-details {
            margin:20px;
            max-height: 650px;
            max-width: 1280px;
            width:100%;
            font-family: HomepageBaukasten-Book;
        }
    </style>

    <jsp:include page="navbar.jsp"/>

    <body>
        <div class="heading-bar"></div>
        <!-- INICIO DO BODY DA PÁGINA -->
        <div>
            <div class="form-type col" id="FadeForm" style="margin: 1%; background-color:white; width:98%;">

                <div class="row align-items-center" style="padding:3%;">
                    <div class="col" style="">

                        <h3>Meus Pedidos</h3>
                        <p style="color:black;">Lista de Pedidos</p>

                        <!-- ------------ALERTA----------- -->
                        <div class="alert alert-success" role="alert" style="display:none;" id='RespostaSucesso'>
                            ${msgResposta}
                        </div>
                        <div class="alert alert-danger" role="alert" style="display:none;" id='RespostaFalha'>
                            ${msgResposta}
                        </div>
                        <input id="alertaR" type="hidden" value="${alertaResposta}">
                        <!-- ------------ FIM ALERTA----------- -->

                        <div class="table-wrapper-scroll-y my-custom-scrollbar col-12" id="style-1" style="min-height:700px ;max-height:800px;">
                            <table class="table">
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
                                                <h3>Código do Pedido: <c:out value="${pedido.getID()}"/></h3>
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
                                        <form method="post" action="${pageContext.request.contextPath}/detalhesPedidoServlet">
                                            <c:out value="${pedido.getStatus()}"/>
                                            <input type="hidden" value="${pedido.getID()}" name="ID">
                                            <input type="hidden" value="${pedido.getIDEndereco()}" name="IDEndereco">
                                            <button type="submit" id="primaryButton${pedido.getID()}" style="display:none;"/>
                                        </form>
                                    </td>
                                    <td>
                                        <button onclick="document.getElementById('primaryButton${pedido.getID()}').click()" class="btn-form-button edit-button" id="btn-form-search"  type="button" alt="Detalhes do Pedido">Ver Detalhes</button>
                                    </td>   
                                    <!-- FIM TD DE DETALHES DE PEDIDO -->
                                    </tr>
                                </c:forEach>
                                </tbody> 
                            </table>
                        </div>

                    </div>

                </div>
            </div>

            <!-- FIM DO BODY DA PÁGINA -->
            <!--FOOTER -->
            <div class="footer-bar"></div>
        </div>
        <script type="text/javascript" src="${pageContext.request.contextPath}/JSP-STYLES/JS/swiper.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/JSP-STYLES/JS/script.js"></script>
        <script type="text/javascript">
                                            $(document).ready(function () {

                                                if ($('#alertaR').val() === "sucesso") {
                                                    $('#RespostaSucesso').css("display", "block");
                                                    setTimeout(function () {
                                                        $('#RespostaSucesso').css("display", "none");
                                                    }, 5000);
                                                } else if ($('#alertaR').val() === "falha") {
                                                    if ($('#alertaR').val() === "sucesso") {
                                                        $('#RespostaFalha').css("display", "block");
                                                        setTimeout(function () {
                                                            $('#RespostaFalha').css("display", "none");
                                                        }, 5000);
                                                    } else {
                                                    }
                                                    ;
                                                }
                                                ;
                                            });

                                            function testaStatus() {
                                                if ($('#loginStatus').val() === 'deslogado') {
                                                    $("#loginButton").trigger('click');
                                                } else {
                                                    $('#fecharPedidoForm').submit();
                                                }
                                            }
                                            ;




        </script>
    </body>
</html>