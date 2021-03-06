CREATE DATABASE ECOMMERCE_PROJECT;

USE ECOMMERCE_PROJECT;
CREATE TABLE `PRODUTOS` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `STATUS` varchar(1) NOT NULL DEFAULT 'A',
  `TITULO` varchar(255) NOT NULL,
  `DESCRICAO` text NOT NULL,
  `VALORVENDA` float NOT NULL,
  `VALORCUSTO` float NOT NULL,
  `CATEGORIA` varchar(30) NOT NULL,
  `QUANTIDADE` int(11) NOT NULL,
  `DATACADASTRO` varchar(255) DEFAULT NULL,
  `IMAGEM` longblob DEFAULT NULL,
  `IMAGEM1` longblob DEFAULT NULL,
  `IMAGEM2` longblob DEFAULT NULL,
  `PESO` float DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `USUARIO` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `STATUS` varchar(1) NOT NULL DEFAULT 'A',
  `NOME` varchar(255) NOT NULL,
  `USUARIO` varchar(255) NOT NULL,
  `SENHA` varchar(255) NOT NULL,
  `EMAIL` varchar(100) NOT NULL,
  `TIPO` varchar(255) DEFAULT NULL,
  `DATANASC` varchar(10) NOT NULL,
  `CELULAR` varchar(14) DEFAULT NULL,
  `CPF` varchar(14) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`),
  UNIQUE KEY `USUARIO` (`USUARIO`),
  UNIQUE KEY `SENHA` (`SENHA`),
  UNIQUE KEY `CPF` (`CPF`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `PERGUNTAS` (
  `NUM` int(11) NOT NULL auto_increment,
  `ID` int(11) NOT NULL,
  `PERGUNTA` varchar(255) NOT NULL,
  `RESPOSTA` varchar(500) NOT NULL,
  PRIMARY KEY (`NUM`)
) ENGINE=InnoDB auto_increment=1 DEFAULT CHARSET=utf8mb4;
       
CREATE TABLE `ENDERECOS` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IDUSUARIO` int(11) NOT NULL,
  `STATUS` varchar(1) NOT NULL DEFAULT 'A',
  `CEP` varchar(255) NOT NULL,
  `CIDADE` varchar(255) NOT NULL,
  `ESTADO` varchar(255) NOT NULL,
  `ENDERECO` varchar(255) NOT NULL,
  `COMPLEMENTO` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDUSUARIO` (`IDUSUARIO`),
  CONSTRAINT `enderecos_ibfk_1` FOREIGN KEY (`IDUSUARIO`) REFERENCES `USUARIO` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `PEDIDOS` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IDCLIENTE` int(11) NOT NULL,
  `DATAPEDIDO` date DEFAULT NULL,
  `VALOR` float DEFAULT NULL,
  `FORMADEPAGAMENTO` varchar(45) DEFAULT NULL,
  `IDENDERECO` int(11) NOT NULL,
  `STATUS` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDCLIENTE` (`IDCLIENTE`),
  KEY `pedidos_ibfk_2_idx` (`IDENDERECO`),
  CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`IDCLIENTE`) REFERENCES `usuario` (`ID`),
  CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`IDENDERECO`) REFERENCES `enderecos` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;


CREATE TABLE `CARRINHO` (
  `IDCARRINHO` int(11) NOT NULL AUTO_INCREMENT,
  `ID` int(11) NOT NULL,
  `IDPRODUTO` int(11) NOT NULL,
  `QUANTIDADE` int(11) NOT NULL,
  `STATUS` varchar(1) NOT NULL,
  `IDPEDIDO` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDCARRINHO`),
  KEY `IDPRODUTO` (`IDPRODUTO`),
  KEY `IDPEDIDO` (`IDPEDIDO`),
  CONSTRAINT `carrinho_ibfk_1` FOREIGN KEY (`IDPRODUTO`) REFERENCES `PRODUTOS` (`ID`),
  CONSTRAINT `carrinho_ibfk_2` FOREIGN KEY (`IDPEDIDO`) REFERENCES `PEDIDOS` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;
