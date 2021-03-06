<%-- 
    Document   : consultaProdutos
    Created on : 19/09/2020, 22:23:14
    Author     : Valter Lafuente Junior
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="${pageContext.request.contextPath}/JSP-STYLES/IMAGES/LANDING-PAGE/logo-colorido.png" type="image/ico" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consulta de Produtos</title>
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
            <form id="FadeForm" class="form-type" 
                  action="${pageContext.request.contextPath}/consultaProdutoServlet" method = "post" accept-charset="UTF-8"
                  style="max-width: 1300px; height:auto; max-height: 800px;">
                <!-- ALERTA DE SUCESSO OU FALHA -->
                <div class="alert alert-success" role="alert" style="display:none;" id='RespostaSucesso'>
                    Atualizado com Sucesso!!
                </div>
                <div class="alert alert-danger" role="alert" style="display:none;" id='RespostaFalha'>
                    Ocorreu uma falha ao atualizar produto!
                </div>
                <input id="alertaR" type="hidden" value="${alertaResposta}">

                <input name="tipo" type="hidden" value="${tipo}" id="tipoUsuario"/>

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
                        <div class="table-wrapper-scroll-y my-custom-scrollbar" id="style-1" style="height:500px;">
                            <table class="table" style="color: white;">
                                <thead>
                                    <tr>
                                        <th scope="col">Nome Produto</th>
                                        <th scope="col">Status</th>
                                        <th scope="col">Descrição</th>
                                        <th scope="col">Data cadastro</th>
                                        <th scope="col">Valor Venda</th>
                                        <th scope="col">Categoria</th>
                                        <th scope="col">Quantidade</th>
                                        <th scope="col">Peso</th>
                                        <th scope="col">Tag</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%-- ESSE FORM É UM FORM QUE QUEBRA PARA RESOLVER UM BUG! --%>
                                <form></form>
                                <%-- FIM --%>
                                <c:forEach items ="${listaProduto}" var="produto">
                                    <tr>
                                        
                                        <td style="vertical-align: middle;"><c:out value="${produto.getTitulo()}"/></td>
                                        <td style="vertical-align: middle;"><c:out value="${produto.getStatus()}"/></td>
                                        <td style="vertical-align: middle;"><c:out value="${produto.getDescricao()}"/></td>
                                        <td style="vertical-align: middle;"><c:out value="${produto.getData()}"/></td>
                                        <td style="vertical-align: middle;"><c:out value="${produto.formatarValor(produto.getValorVenda())}"/></td>
                                        <td style="vertical-align: middle;"><c:out value="${produto.getCategoria()}"/></td>
                                        <td style="vertical-align: middle;"><c:out value="${produto.getQuantidade()}"/></td>
                                        <td style="vertical-align: middle;"><c:out value="${produto.getPeso()}"/></td>
                                        <td style="vertical-align: middle;"><c:out value="${produto.getTag()}"/></td>
                                        <td>
                                            <form method="post" action="${pageContext.request.contextPath}/detalhesProdutoServlet">
                                                <div>
                                                    <input style="max-height: 80px;" type="image" src="${produto.getImagem()}" value="submit">
                                                    <input name="ID" type="hidden" value="${produto.getID()}"/>
                                                </div>
                                            </form>
                                        </td>
                                        <!-- TD DE EDIÇÃO DE PRODUTO -->
                                        <td style="vertical-align: middle;">
                                            <form method="get" action="${pageContext.request.contextPath}/editarProdutoServlet">
                                                <input type="hidden" value="${produto.getID()}" name="ID">

                                                <!-- BOTÃO DE ADMIN -->
                                                <button class="btn-form-button edit-button" id="btn-form-search"  type="submit" alt="Editar Produto"><i class="fa fa-edit"></i></button>
                                            </form>
                                        </td>

                                        <!-- TD DE EXCLUSÃO DE PRODUTO -->
                                        <td style="vertical-align: middle;">
                                            <form  method="post" action="${pageContext.request.contextPath}/deletarProdutoServlet">
                                                <input type="hidden" value="${produto.getID()}" name="ID">
                                                <!-- Button trigger modal -->
                                                <button type="button" class="btn btn-excluir" data-toggle="modal" data-target="#modalExclusao${produto.getID()}" id="btn-form-search"> 
                                                    <i class="fa fa-times"></i>
                                                </button>

                                                <!-- MODAL CONFIRMAR EXCLUSÃO-->
                                                <div class="modal fade" id="modalExclusao${produto.getID()}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                                    <div class="modal-dialog modal-dialog-centered" role="document" style="color: black;">
                                                        <div class="modal-content">
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
                                                                Tem certeza que deseja deletar o Produto?
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
                    Os preços apresentados no site não são obrigatoriamente iguais aos apresentados na rede de lojas físicas da Muchachos Perfumaria, e somente são válidos para as compras efetuadas no ato de sua exibição.
                </p>
                <p id="copyright"> 
                    Muchachos Perfumaria é uma empresa do grupo Muchachos S.A., CNPJ nº 54.345.056/0054-07, Av Faria Lima, nº 15461, São Paulo – SP.
                </p>
            </div>
        </footer>
        <script type="text/javascript" src="${pageContext.request.contextPath}/JSP-STYLES/JS/swiper.min.js"></script>
        <script src="${pageContext.request.contextPath}/JSP-STYLES/JS/script.js"></script>   
        <script type="text/javascript" src="${pageContext.request.contextPath}/JSP-STYLES/JS/jquery-3.4.1.min.js"></script>
        <script type="text/javascript">
        $(document).ready(function desativa() {

            if ($('#tipoUsuario').val() === 'estoquista') {
                /*desativa o botão de exclusão para estoquista */
                $('.btn-excluir').css("display", 'none');

            }
        });
        </script>
    </body>
</html>
