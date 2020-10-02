<%-- 
    Document   : home
    Created on : 26/03/2020, 13:52:50
    Author     : Valter Lafuente Junior 
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath}/JSP-STYLES/CSS/style.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/JSP-STYLES/CSS/swiper.min.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>

    <jsp:include page="navbar.jsp"/>

    <body >
        <!-- INICIO DO BODY -->
        <div class="heading-bar"></div>
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="d-block w-100" src="${pageContext.request.contextPath}/JSP-STYLES/IMAGES/LANDING-PAGE/banner2.png" alt="First slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="${pageContext.request.contextPath}/JSP-STYLES/IMAGES/LANDING-PAGE/banner1.png" alt="Second slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="${pageContext.request.contextPath}/JSP-STYLES/IMAGES/LANDING-PAGE/banner3.png" alt="Third slide">
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
          <div class="heading-bar"></div>         
        <div class="heading">
            <h4><strong> Mais Populares</strong> </h4>
        </div>
        <div class="swiper-container" >
            <div class="swiper-wrapper">

                <c:forEach items ="${listaMaisVendidos}" var="produto">
                    <div class="swiper-slide">
                        <div class="slider-box">
                            <p class="time"><mark><c:out value="${produto.getTag()}"/></mark></p>

                            <form method="post" action="${pageContext.request.contextPath}/detalhesProdutoServlet">
                                <div class="img-box">
                                    <input style="max-height: 170px;" type="image" src="${produto.getImagem()}" value="submit">
                                    <input name="ID"   type="hidden" value="${produto.getID()}"/>
                                    <input name="Titulo" type="hidden" value="${produto.getTitulo()}"/>
                                    <input name="tag" type="hidden" value="${produto.getTag()}"/>
                                </div>
                            </form>

                            <p class="detail" id="productTitle"><c:out value="${produto.getTitulo()}"/>
                                <span id="categoriaa" class="detail"><c:out value="${produto.getCategoria()}"/></span>
                                <a href="#" class="price"><span id="ValorUnitario" onload=""><c:out value="${produto.formatarValor(produto.getValorVenda())}"/></span></a>
                            </p>
                            <div class="cart">
                                <form method="post" action="${pageContext.request.contextPath}">
                                    <input type="number" name="quantidade" value="1" style="display:none;">
                                    <input type="hidden" value="${produto.getID()}" name="ID">
                                    <input class="addtocart" type="submit" value="COMPRAR" style="background-color:transparent; border:none;">
                                </form>
                            </div>
                        </div>
                    </div>
                </c:forEach>

            </div>
        </div>


        <div class="heading">
            <h4><strong>Lançamentos</strong></h4>
        </div>
        <!-- SLIDER 2 -->
        <div class="swiper-container">
            <div class="swiper-wrapper">
                <c:forEach items ="${listaNovos}" var="produto1">
                    <div class="swiper-slide">
                        <div class="slider-box">
                            <p class="time"><mark><c:out value="${produto1.getTag()}"/></mark></p>

                            <form method="post" action="${pageContext.request.contextPath}/detalhesProdutoServlet">
                                <div class="img-box">
                                    <input style="max-height: 170px;" type="image" src="${produto1.getImagem()}" value="submit">
                                    <input name="ID" type="hidden" value="${produto1.getID()}"/>
                                    <input name="titulo" type="hidden" value="${produto1.getTitulo()}"/>
                                    <input name="tag" type="hidden" value="${produto1.getTag()}"/>
                                </div>
                            </form>


                            <p class="detail" id="productTitle"><c:out value="${produto1.getTitulo()}"/>
                                <span id="status" class="detail"><c:out value="${produto1.getCategoria()}"/></span>
                                <a href="#" class="price"><span id="ValorUnitario" onload=""><c:out value="${produto1.formatarValor(produto1.getValorVenda())}"/></span></a>
                            </p>
                            <div class="cart">
                                <form method="post" action="${pageContext.request.contextPath}">
                                    <input type="number" name="quantidade" value="1" style="display:none;">
                                    <input type="hidden" value="${produto1.getID()}" name="ID">
                                    <input class="addtocart" type="submit" value="COMPRAR" style="background-color:transparent; border:none;">
                                </form>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>


        <div class="heading">
            <h4><strong>Mais Baratos</strong></h4>
        </div>
        <!-- SLIDER 3 -->
        <div class="swiper-container">
            <div class="swiper-wrapper">
                <c:forEach items ="${listaMenorPreco}" var="produto2">
                    <div class="swiper-slide">
                        <div class="slider-box">
                            <p class="time"><mark><c:out value="${produto2.getTag()}"/></mark></p>


                            <form method="post" action="${pageContext.request.contextPath}/detalhesProdutoServlet">
                                <div class="img-box">
                                    <input style="max-height: 170px;" type="image" src="${produto2.getImagem()}" value="submit">
                                    <input name="ID" type="hidden" value="${produto2.getID()}"/>
                                    <input name="titulo" type="hidden" value="${produto2.getTitulo()}"/>
                                    <input name="tag" type="hidden" value="${produto2.getTag()}"/>
                                </div>
                            </form>


                            <p class="detail" id="productTitle"><c:out value="${produto2.getTitulo()}"/>
                                <span id="status" class="detail"><c:out value="${produto2.getCategoria()}"/></span>
                                <a href="#" class="price"><span id="ValorUnitario" onload=""><c:out value="${produto2.formatarValor(produto2.getValorVenda())}"/></span></a>
                            </p>
                            <div class="cart">
                                <form method="post" action="${pageContext.request.contextPath}">
                                    <input type="number" name="quantidade" value="1" style="display:none;">
                                    <input type="hidden" value="${produto2.getID()}" name="ID">
                                    <input class="addtocart" type="submit" value="COMPRAR" style="background-color:transparent; border:none;">
                                </form>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <!-- SLIDER 3 END  -->
        <!-- FIM DO BODY -->
        <div class="heading-bar"></div>

        <!--FOOTER -->
        <footer>
            
           <input type="hidden" value="request.getSession().getAttribute('msg')" id="tipoUsuario">
            <hr>

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
