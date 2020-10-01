<%-- 
    Document   : editarProdutos
    Created on : 19/09/2020
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
        <title>Editar Produtos</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/JSP-STYLES/CSS/style.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/JSP-STYLES/CSS/swiper.min.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <style type="text/css">
    </style>

    <jsp:include page="../navbar.jsp"/>

    <body onload="testaTipo()">
        <div class="heading-bar"></div>
        <!-- INICIO DO BODY -->


        <div id="body-changes" class="text-center">

            <form  id="fadeForm" class="form-type needs-validation" method="post" 
                   action="${pageContext.request.contextPath}/editarProdutoServlet" >
                <div class="row justify-content-center">
                    <div class="form-group col-4">
                        <h2>Perfume</h2>
                        <input type="hidden" value="${perfume.getID()}" name="ID">
                        <input type="hidden" value="${tipo}" id="tipoUsuario">
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="form-group col-4">
                        <label> Status: </label>
                        <input type="text" class="form-control" placeholder="Status" 
                               id="ProdutoName" name="Status" value="${perfume.getStatus()}" required>
                    </div>
                    <div class="form-group col-4">
                        <label> Nome Produto: </label>
                        <input type="text" class="form-control" placeholder="Nome Produto" 
                               id="ProdutoName" name="Titulo" value="${perfume.getTitulo()}" required>
                    </div>
                    <div class="form-group col-4">
                        <label> Quantidade: </label>
                        <input type="number" class="form-control" placeholder="10" id="quantidade" name="Quantidade"
                               value="${perfume.getQuantidade()}" required>
                    </div>
                </div>
                <div class="row justify-content-center">
                   <div class="form-group col-4">
                        <label>Valor Venda:</label>
                        R$:<input type="text" id="dinheiro" class="form-control" style="display:inline-block"
                                  name="ValorVenda" placeholder="R$00,00" maxlength="7" 
                                  value="${perfume.getValorVenda()}" onload="return(moeda(this, '.', ',', event))" required/>
                    </div>
                      <div class="form-group col-4">
                        <label>Data Cadastro:</label>
                        <input type="String" name="Data" class=" form-control" style="display:inline-block"
                               maxlength="10" value="${perfume.getData()}" required/>
                    </div>
                     <div class="form-group col-4">
                        <label>Valor Compra:</label>
                        R$:<input type="text" id="dinheiro1" name="ValorCusto" class="form-control" style="display:inline-block" 
                                  placeholder="R$00,00" maxlength="7" onload="return(moeda(this, '.', ',', event))"
                                  value="${perfume.getValorCusto()}" required/>
                    </div>
                </div>
                  <div class="row justify-content-center">
                    <div class="form-group col-12 ">
                      <label> Descrição: </label>
                      <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" id="ProdutoName" name="Descricao"
                               value="${perfume.getDescricao()}" required>${perfume.getDescricao()}</textarea>
                    </div>
                </div>   
                <div class="row justify-content-center">
                     <div class="form-group col-4">
                        <label> Peso: </label>
                        <input type="text" class="form-control" placeholder="Peso" name="Peso" value="${perfume.getPeso()}" required>
                     </div>
                    <div class="form-group col-4">
                        <label> Tag: </label>
                        <select class="form-control" name="Tag" id="tag" required>  
                            <option  selected value="${perfume.getTag()}">${perfume.getTag()}</option>
                            <option  value="Mais Vendidos" required>Mais Vendidos</option>
                            <option  value="Lançamento">Lançamento</option>
                            <option  value="Clássico">Clássico</option>
                            <option  value=" ">Sem Tag</option>
                        </select>
                     </div>
                     <div class="form-group col-4">
                       <label> Categoria: </label>
                        <select class="form-control" name="Categoria" id="categoria" required>  
                            <option selected  value="${perfume.getCategoria()}">${perfume.getCategoria()}</option>
                            <option  value="Masculino">Masculino</option>
                            <option  value="Feminino">Feminino</option>
                        </select>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="form-group col-12">
                        <input type="file" class="custom-file-input form-control" id="customFile"
                               name="Image" onchange="uploadFile()">
                        <label class="custom-file-label" for="customFile">Importar imagem do Produto</label>
                        <p id="labelImagem" style="display:block;">Preview de Imagem:</p>
                        <img alt="Imagem" src="${perfume.getImagem()}" id="target" style="max-width:300px; max-height: 300px;display:inline;">
                        <img alt="Imagem" src="" id="target1" style="max-width:300px; max-height: 300px;display:none;">
                        <img alt="Imagem" src="" id="target2" style="max-width:300px; max-height: 300px;display:none;">
                        <input type="hidden" id="base64" name="imagemB64" value="${perfume.getImagem()}">
                        <input type="hidden" id="base641" name="imagemB641">
                        <input type="hidden" id="base642" name="imagemB642">
                    </div>
                </div>
                <!------>

                <div class="row ">
                    <div class ="form group col-9 ">
                    </div>
                    <div class ="form group col-sm-3 ">
                        <button type="reset" class="btn btn-primary" id="btn-form"> Cancelar </button>
                        <button type="submit" class="btn btn-primary" id="btn-form"> Confirmar </button>
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
          </div>     
        </footer>
        <script type="text/javascript" src="${pageContext.request.contextPath}/JSP-STYLES/JS/swiper.min.js"></script>
        <script src="${pageContext.request.contextPath}/JSP-STYLES/JS/script.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/JSP-STYLES/JS/jquery-3.4.1.min.js"></script>
        <script type="text/javascript">
                          $(document).ready(function testaTipo(){ 
                               
                                if ($('#tipoUsuario').val() === 'estoquista') {
                                $('.form-control').prop("readonly", true);
                                $('#quantidade').prop("readonly", false);
                                 $('form input[type="file"]').prop("disabled", true);
                                /* CATEGORIA DISABLE*/
                                $('#categoria').css("background", '#eee');
                                $('#categoria').css("pointer-events", 'none');
                                $('#categoria').css("touch-action", 'none');

                                /* ACABAMENTO DISABLE*/
                                $('#acabamento').css("background", '#eee');
                                $('#acabamento').css("pointer-events", 'none');
                                $('#acabamento').css("touch-action", 'none');

                                /* IDIOMA DISABLE*/
                                $('#idioma').css("background", '#eee');
                                $('#idioma').css("pointer-events", 'none');
                                $('#idioma').css("touch-action", 'none');

                                /* TAG DISABLE*/
                                $('#tag').css("background", '#eee');
                                $('#tag').css("pointer-events", 'none');
                                $('#tag').css("touch-action", 'none');
                            }
                        });
                        
        </script>
    </body>
</html>