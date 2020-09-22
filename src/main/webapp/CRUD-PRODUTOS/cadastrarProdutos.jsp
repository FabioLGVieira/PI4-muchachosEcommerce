<%-- 
    Document   : Cadastro de Produtos
    Created on : 19/09/2020, 17:21:45
    Author     : Valter lafuente Junior
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="${pageContext.request.contextPath}/JSP-STYLES/IMAGES/LANDING-PAGE/booksicon.ico" type="image/ico" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Produtos</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/JSP-STYLES/CSS/style.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/JSP-STYLES/CSS/swiper.min.css"/>

    </head>
    <jsp:include page="../navbar.jsp"/>

    <body onload="mensagemCadastro()">

        <div class="heading-bar"></div>

        <!-- INICIO DO BODY -->

        <div id="body-changes" class="text-center">

            <form  id="fadeForm" class="form-type needs-validation" method="post" 
                   action="${pageContext.request.contextPath}/cadastroProdutoServlet" >
                <div class="alert alert-success" role="alert" style="display:none;" id='RespostaSucesso'>
                    Cadastrado com Sucesso!!
                </div>
                <div class="alert alert-danger" role="alert" style="display:none;" id='RespostaFalha'>
                    Ocorreu uma falha ao cadastrar produto!
                </div>
                <input id="alertaR" type="hidden" value="${alertaResposta}">
                
                <div class="row justify-content-center">
                    <div class="form-group col-6">
                        <h2>Perfume</h2>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="form-group col-6">
                        <label> Nome Perfume: </label>
                        <input type="text" class="form-control" placeholder="Nome Perfume" 
                               id="ProdutoName" name="Titulo" required>
                    </div>
                    <div class="form-group col-6">
                        <label> Quantidade: </label>
                        <input type="number" class="form-control" placeholder="10" id="ProdutoName" name="Quantidade"
                               required>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="form-group col-12 ">
                        <label> Descrição: </label>
                        <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="Descricao" required></textarea>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="form-group col-4">
                        <label>Valor Venda:</label>
                        R$:<input type="text" id="dinheiro" class="form-control" style="display:inline-block"
                                  name="ValorVenda" placeholder="R$00,00" maxlength="7" 
                                  onKeyPress="return(moeda(this, '.', ',', event))" required/>
                    </div>
                    <div class="form-group col-4">
                        <label>Valor Compra:</label>
                        R$:<input type="text" id="dinheiro1" name="ValorCusto" class="form-control" style="display:inline-block" 
                                  placeholder="R$00,00" maxlength="7" onKeyPress="return(moeda(this, '.', ',', event))"
                                  required/>
                    </div>
                    <div class="form-group col-4">
                        <label>Ano:</label>
                        <input type="String" name="DataCadastro" class=" form-control" style="display:inline-block"
                               maxlength="4" required/>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="form-group col-4">
                        <label> Categoria: </label>
                        <select class="form-control" name="Categoria" required>  
                            <option disabled selected style="display: none;" >Categoria</option>
                            <option  value="Masculino">Masculino</option>
                            <option  value="Feminino">Feminino</option>
                        </select>
                    </div>
                    <div class="form-group col-4">
                        <label>Peso:</label>
                        <input type="int" name="Peso" class="form-control" style="display:inline-block" 
                               placeholder="0.46" maxlength="4" required/>
                    </div>
                    <div class="form-group col-4">
                        <label> Tag: </label>
                        <select class="form-control" name="Tag" required>  
                            <option disabled selected style="display: none;">Tags Especiais</option>
                            <option  value="Mais Vendidos" required>Mais Vendidos</option>
                            <option  value="Lançamento">Lançamento</option>
                            <option  value="Clássico">Clássico</option>
                            <option  value=" ">Sem Tag</option>
                        </select>
                    </div>
                </div>
               <div class="row justify-content-center">
                    <div class="form-group col-8">
                        <input type="file" class="custom-file-input form-control" id="customFile"
                               name="Image" onchange="uploadFile()" required>
                        <label class="custom-file-label" for="customFile">Importar imagem do Produto</label>
                        <p id="labelImagem" style="display:none;">Preview de Imagem:</p>
                        <img alt="Imagem" src="" id="target" style="max-width:300px; max-height: 300px;display:none;">
                        <img alt="Imagem" src="" id="target1" style="max-width:300px; max-height: 300px;display:none;">
                        <img alt="Imagem" src="" id="target2" style="max-width:300px; max-height: 300px;display:none;">
                        <input type="hidden" id="base64" name="imagemB64">
                        <input type="hidden" id="base641" name="imagemB641">
                        <input type="hidden" id="base642" name="imagemB642">
                    </div>
                </div>
                <!------>

                <div class="row ">
                    <div class ="form group col-9 ">
                    </div>
                    <div class ="form group   col-sm-3 ">
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
        <script type="text/javascript" src="${pageContext.request.contextPath}/JSP-STYLES/JS/jquery-3.4.1.min.js"></script>
        <script type="text/javascript">
        </script>
    </body>
</html>

