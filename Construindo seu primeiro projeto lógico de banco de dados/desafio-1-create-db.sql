CREATE DATABASE ecommerce;

USE ecommerce;

CREATE TABLE clientes (
    id_cliente INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    data_nascimento DATE NOT NULL,
    cpf_cnpj VARCHAR(11) NOT NULL,
    tipo_pessoa ENUM('PF', 'PJ') NOT NULL,
    PRIMARY KEY (id_cliente)
);

CREATE TABLE produtos (
    id_produto INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    descrição TEXT NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    estoque INT NOT NULL,
    PRIMARY KEY (id_produto)
);

CREATE TABLE pedidos (
    id_pedido INT NOT NULL AUTO_INCREMENT,
    data_pedido DATETIME NOT NULL,
    id_cliente INT NOT NULL,
    id_fornecedor INT NOT NULL,
    PRIMARY KEY (id_pedido),
    FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente),
    FOREIGN KEY (id_fornecedor) REFERENCES fornecedores (id_fornecedor)
);

CREATE TABLE fornecedores (
    id_fornecedor INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    cnpj VARCHAR(14) NOT NULL,
    telefone VARCHAR(255) NOT NULL,
    endereço VARCHAR(255) NOT NULL,
    PRIMARY KEY (id_fornecedor)
);

CREATE TABLE estoque_produtos (
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    localidade VARCHAR(255) NOT NULL,
    PRIMARY KEY (id_produto, localidade),
    FOREIGN KEY (id_produto) REFERENCES produtos (id_produto)
);

CREATE TABLE vendedores (
    id_vendedor INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    cpf_cnpj VARCHAR(11) NOT NULL,
    telefone VARCHAR(255) NOT NULL,
    endereço VARCHAR(255) NOT NULL,
    PRIMARY KEY (id_vendedor)
);

CREATE TABLE produtos_vendedores (
    id_produto INT NOT NULL,
    id_vendedor INT NOT NULL,
    PRIMARY KEY (id_produto, id_vendedor),
    FOREIGN KEY (id_produto) REFERENCES produtos (id_produto),
    FOREIGN KEY (id_vendedor) REFERENCES vendedores (id_vendedor)
);

CREATE TABLE produtos_pedidos (
    id_produto INT NOT NULL,
    id_pedido INT NOT NULL,
    quantidade INT NOT NULL,
    PRIMARY KEY (id_produto, id_pedido),
    FOREIGN KEY (id_produto) REFERENCES produtos (id_produto),
    FOREIGN KEY (id_pedido) REFERENCES pedidos (id_pedido)
);

CREATE TABLE estoques_localidades (
    id_estoque INT NOT NULL AUTO_INCREMENT,
    localidade VARCHAR(255) NOT NULL,
    quantidade INT NOT NULL,
    PRIMARY KEY (id_estoque)
);

CREATE TABLE produtos_fornecedores (
    id_produto INT NOT NULL,
    id_fornecedor INT NOT NULL,
    quantidade INT NOT NULL,
    PRIMARY KEY (id_produto, id_fornecedor),
    FOREIGN KEY (id_produto) REFERENCES produtos (id_produto),
    FOREIGN KEY (id_fornecedor) REFERENCES fornecedores (id_fornecedor)
);
