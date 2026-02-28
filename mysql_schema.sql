-- Criação do schema e tabelas para o desafio
CREATE DATABASE IF NOT EXISTS desafio_powerbi CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE desafio_powerbi;

CREATE TABLE IF NOT EXISTS clientes (
  id_cliente INT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  cidade VARCHAR(100),
  estado VARCHAR(2)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS produtos (
  id_produto INT PRIMARY KEY,
  nome_produto VARCHAR(100) NOT NULL,
  categoria VARCHAR(50),
  preco DECIMAL(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS vendas (
  id_venda INT PRIMARY KEY,
  id_cliente INT NOT NULL,
  id_produto INT NOT NULL,
  data_venda DATE NOT NULL,
  quantidade INT NOT NULL,
  FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
  FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
