<%-- 
    Document   : detalhesPedido
    Created on : 13/11/2020
    Author     : Ramesses Souza 
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <link rel="icon" href="${pageContext.request.contextPath}/JSP-STYLES/IMAGES/LANDING-PAGE/booksicon.ico" type="image/ico" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detalhes do Pedido</title>
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
                    <div class="col-12" style="">

                        <h3>Detalhes do Pedido</h3>
                        <!-- ------------ALERTA----------- -->
                        <div class="alert alert-success" role="alert" style="display:none;" id='RespostaSucesso'>
                            Endereço Removido
                        </div>
                        <div class="alert alert-danger" role="alert" style="display:none;" id='RespostaFalha'>
                            Ocorreu uma falha ao remover endereço!
                        </div>
                        <input id="alertaR" type="hidden" value="${alertaResposta}">
                        <!-- ------------ FIM ALERTA----------- -->
                        <h3>Pedido</h3>
                        <div class="col-12" id="style-1" style="min-height:350px ;max-height:800px;">
                            <table class="table">
                                <tr>
                                </tr>
                                <tbody>
                                    <tr>
                                        <th scope="col"><h3>Código do Pedido: <c:out value="${Pedido.getID()}"/></h3></th>
                                    </tr>
                                    <tr>
                                        <th scope="col">Data</th>
                                        <td><p>
                                                <c:out value="${Pedido.formatarData(Pedido.getDataPedido())}"/>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="col">Valor</th>
                                        <td><c:out value="${Pedido.formatarValor(Pedido.getValor())}"/></td>
                                    </tr>
                                    <!-- TD DE DETALHES DE PEDIDO -->
                                    <tr>
                                        <th scope="col">Status</th>
                                        <td>
                                            <c:out value="${Pedido.getStatus()}"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="col">Forma de Pagamento</th>
                                        <td>
                                            <c:out value="${Pedido.getFormaDePagamento()}"/>
                                        </td>
                                    </tr>
                                    <!-- FIM TD DE DETALHES DE PEDIDO -->
                                    </tr>
                                </tbody> 
                            </table>
                        </div>
                        <h3>Itens</h3>
                        <p style="color:black;">Data: ${dataAtual}| Itens: ${quantidade}| Valor Total: ${valorTotal}</p>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="row">Capa</th>
                                    <th scope="row">Título</th>
                                    <th scope="row">Valor Unitário</th>
                                    <th scope="row">Quantidade</th>
                                    <th scope="row">Valor Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items ="${listaProdutoPedido}" var="produto">
                                    <tr>
                                        <td>
                                            <form method="post" action="${pageContext.request.contextPath}/detalhesProdutoServlet">
                                                <div>
                                                    <input style="max-width:80px;margin:5px;" type="image" src="${produto.getImagem()}" value="submit">
                                                    <input name="ID" type="hidden" value="${produto.getID()}"/>
                                                </div>
                                            </form>
                                        </td>
                                        <td style="max-width:250px;">
                                            <p>
                                                <c:out value="${produto.getTitulo()}"/>
                                            </p>
                                        </td>
                                        <td><c:out value="${produto.formatarValor(produto.getValorVenda())}"/></td>
                                        <!-- TD DE ACRESCIMO DE PRODUTO -->
                                        <td>
                                            ${produto.getQuantidade()}
                                        </td>
                                        <td>
                                            <c:out value="${produto.formatarValor(produto.getValorVenda()*produto.getQuantidade())}"/>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody> 
                        </table>
                        <h3>Endereço de Entrega</h3>
                        <table class="table">
                            <tbody>
                                <tr>
                                    <td>
                                        CEP: ${EnderecoEntregaPedido.getCEP()}
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Cidade: ${EnderecoEntregaPedido.getCidade()}
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Estado: ${EnderecoEntregaPedido.getEstado()}
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Endereço: ${EnderecoEntregaPedido.getEndereco()}
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Complemento: ${EnderecoEntregaPedido.getComplemento()}
                                    </td>
                                </tr>
                            </tbody> 
                        </table>

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

            function displayPagamentoCartao() {
                $('#creditCard').css("display", "block");
                $('#boleto').css("display", "none");
                $('#paymentMethod').val("Cartão");
            }
            ;
            function displayPagamentoBoleto() {
                $('#boleto').css("display", "block");
                $('#creditCard').css("display", "none");
                $('#paymentMethod').val("Boleto");
            }
            ;

            function setIDEndereco(ID) {
                $('#addressID').val(ID);
            }
            ;



        </script>
    </body>
</html>