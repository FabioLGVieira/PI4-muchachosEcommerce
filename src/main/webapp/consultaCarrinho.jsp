<%-- 
    Document   : consultaCarrinho
    Created on : 12/10/2020, 13:34:49
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
        <title>Detalhes do Pedido</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/JSP-STYLES/CSS/style.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/JSP-STYLES/CSS/swiper.min.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/JSP-STYLES/CSS/jquery-ui.css"/>
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
                    <div class="col-8" style="">

                        <h3>Itens no Carrinho</h3>
                        <p style="color:black;">Data: ${dataAtual}| Itens: ${quantidadeDeItens}| Valor: ${valorTotalNoCarrinho}</p>

                        <!-- ------------ALERTA----------- -->
                        <div class="alert alert-success" role="alert" style="display:none;" id='RespostaSucesso'>
                            ${msgResposta}
                        </div>
                        <div class="alert alert-danger" role="alert" style="display:none;" id='RespostaFalha'>
                            ${msgResposta}
                        </div>
                        <input id="alertaR" type="hidden" value="${alertaResposta}">
                        <!-- ------------ FIM ALERTA----------- -->

                        <div class="table-wrapper-scroll-y my-custom-scrollbar" id="style-1" style="min-height:700px ;max-height:800px;">
                            <table class="table">
                                <tbody>
                                    <c:forEach items ="${listaCarrinho}" var="produto">
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
                                                <p>
                                                    <c:out value="${produto.getDescricao()}"/>
                                                </p>
                                            </td>
                                            <td><c:out value="${produto.formatarValor(produto.getValorVenda())}"/></td>
                                            <!-- TD DE ACRESCIMO DE PRODUTO -->
                                            <td>
                                                <form method="post" action="${pageContext.request.contextPath}/editarNoCarrinhoServlet">
                                                    <input type="hidden" value="${produto.getID()}" name="ID">
                                                    <input type="number" name="quantidade" min="0" max="100" value="${produto.getQuantidade()}">
                                                    <button type="submit" id="primaryButton${produto.getID()}" onclick="document.getElementById('primaryButton').click()"
                                                            style="display:none;"/>
                                                </form>
                                            </td>
                                            <td>
                                                <button onclick="document.getElementById('primaryButton${produto.getID()}').click()" class="btn-form-button edit-button" id="btn-form-search"  type="button" alt="Editar Produto"><i class="fas fa-sync"></i></button>
                                            </td>   
                                            <!-- FIM TD DE ACRESCIMO DE PRODUTO -->
                                            <!-- TD DE EXCLUSÃO DE PRODUTO -->
                                            <td>
                                                <form  method="post" action="${pageContext.request.contextPath}/deletarNoCarrinhoServlet">
                                                    <input type="hidden" value="${produto.getID()}" name="ID">
                                                    <!-- Button trigger modal -->
                                                    <button type="button" class="btn btn-excluir" data-toggle="modal" data-target="#modalExclusao${produto.getID()}" id="btn-form-search"> 
                                                        <i class="fa fa-times"></i>
                                                    </button>

                                                    <!-- MODAL CONFIRMAR EXCLUSÃO-->
                                                    <div class="modal fade" id="modalExclusao${produto.getID()}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                                        <div class="modal-dialog modal-dialog-centered" role="document" style="color: black;">
                                                            <div class="modal-content align-items-center" >
                                                                <div class="modal-header">
                                                                    <h5 class="modal-title" id="exampleModalLongTitle">Deletar Produto</h5>
                                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                        <span aria-hidden="true">&times;</span>
                                                                    </button>
                                                                </div>
                                                                <div>
                                                                    <input style="max-height: 150px; margin-top:20px;" type="image" src="${produto.getImagem()}" value="submit">
                                                                    <input name="ID" type="hidden" value="${produto.getID()}"/>
                                                                </div>
                                                                <div class="modal-body">
                                                                    Tem certeza que deseja deletar o Produto do Carrinho?
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

                    <div class="col-4">
                        <form method="get" id="fecharPedidoForm" action="${pageContext.request.contextPath}/consultaEnderecoServlet">
                            <input type="hidden" value="${IDUsuario}" name="ID">
                            <input type="hidden" value="redirectToFinalizarCompra" name="finalizarCompra">
                            <input type="hidden" value="${loginStatus}" id="loginStatus">
                            <button id="fecharPedidoButton" type="button" class="btn btn-block btn-lg btn-primary" onclick="testaStatus();" style="border-radius:0px;width:100%; ">
                                <i class="fa fa-shopping-cart"></i>
                                Fechar Pedido</button>
                        </form>
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