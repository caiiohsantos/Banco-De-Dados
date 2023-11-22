-- Criando a tabela Usuario

CREATE TABLE [Usuario]
(

[UsuarioId] NVARCHAR(160) NOT NULL,
[Login] NVARCHAR(160) NOT NULL,
[Senha] NVARCHAR(160) NOT NULL,
[Email] NVARCHAR(160) NOT NULL,
CONSTRAINT [PK_Usuario] PRIMARY KEY ([UsuarioId])
);

CREATE UNIQUE INDEX [IPK_Usuario] ON [Usuario]([UsuarioId]);

-- Criando a tabela Fornecedor

CREATE TABLE [Fornecedor]
(

[FornecedorId] NVARCHAR(160) NOT NULL,
[Nome] NVARCHAR(160) NOT NULL,
[Email] NVARCHAR(160) NOT NULL,
[Endereco] NVARCHAR(160) NOT NULL,
[Cnpj] NVARCHAR(160) NOT NULL,
[Telefone] NVARCHAR(160) NOT NULL,
CONSTRAINT [PK_Fornecedor] PRIMARY KEY ([FornecedorId])
);

CREATE UNIQUE INDEX [IPK_Fornecedor] ON [Fornecedor]([FornecedorId]);


-- Criando a tabela Loja

CREATE TABLE [Loja]
(

[LojaId] NVARCHAR(160)  NOT  NULL,
[Nome] NVARCHAR(160) NOT NULL,
[Endereco] NVARCHAR(160) NOT NULL,
[Telefone] NVARCHAR(160)  NOT NULL,
CONSTRAINT [PK_Loja] PRIMARY KEY ([LojaId])
);

CREATE UNIQUE INDEX [IPK_Loja] ON [Loja]([LojaId]);

-- Criando a tabela Produto

CREATE TABLE [Produto]
(

[ProdutoId] NVARCHAR(160) NOT NULL,
[FornecedorId] NVARCHAR(160) NOT NULL,
[Nome] NVARCHAR(160) NOT NULL,
[Vlr_Produto] FLOAT  NOT NULL,
CONSTRAINT [PK_Produto] PRIMARY KEY ([ProdutoId]),
CONSTRAINT [FK_Fornecedor] FOREIGN KEY ([FornecedorId]) REFERENCES Fornecedor (FornecedorId)
);

CREATE UNIQUE INDEX [IPK_Produto] ON [Produto] ([ProdutoId]);

-- Criando a tabela Cliente

CREATE TABLE [Cliente]
(
    [ClienteId] NVARCHAR(160)  NOT NULL,
    [UsuarioId] NVARCHAR(160)  NOT NULL,
    [Nome] NVARCHAR(160)  NOT NULL,
    [CPF] NVARCHAR(160) NOT NULL,
    [Endereco] NVARCHAR(160)  NOT NULL,
    [Telefone] NVARCHAR(160) NOT NULL,
    CONSTRAINT [PK_Cliente] PRIMARY KEY ([ClienteId]),
    CONSTRAINT [FK_Usuario] FOREIGN KEY ([UsuarioId]) REFERENCES usuario(UsuarioId)
  
);

CREATE UNIQUE INDEX [IPK_CLIENTE] ON [CLIENTE]([ClienteId]);

-- Criando a tabela Estoque

CREATE TABLE [Estoque]
(
[EstoqueId] NVARCHAR(160) NOT NULL,
[ProdutoId] NVARCHAR(160) NOT NULL,
[LojaId] NVARCHAR(160) NOT NULL,
[Qtd_Produtos] INTEGER NOT NULL,
CONSTRAINT [PK_Estoque] PRIMARY KEY ([EstoqueId]),
 CONSTRAINT [FK_Estoque_Produto] FOREIGN KEY ([ProdutoId]) REFERENCES produto(ProdutoId),
 CONSTRAINT [FK_Estoque_Loja] FOREIGN KEY ([LojaId]) REFERENCES loja(LojaId)

);

CREATE UNIQUE INDEX [IPK_ESTOQUE] ON [Estoque] ([EstoqueId]);


-- Criando a tabela Relatorio

CREATE TABLE [Relatorio]
(
[RelatorioId] NVARCHAR(160) NOT NULL,
[LojaId] NVARCHAR(160) NOT NULL,
[Vlr_Total] FLOAT NOT NULL,
[Data_Inicio] DATETIME NOT NULL,
[Data_Fim] DATETIME NOT NULL,
CONSTRAINT [PK_Relatorio] PRIMARY KEY ([RelatorioId]),
CONSTRAINT [FK_Relatorio_Loja] FOREIGN KEY ([LojaId]) REFERENCES loja(LojaId)

);

CREATE UNIQUE INDEX [IPK_RELATORIO] ON [Relatorio] ([RelatorioId]);

-- Criando a tabela de Vendedor

CREATE TABLE [VENDEDOR]
(
    [VendedorId] NVARCHAR(160)  NOT NULL,
    [UsuarioId] NVARCHAR(160)  NOT NULL,
    [LojaId] NVARCHAR(160) NOT NULL,
    [Nome] NVARCHAR(160)  NOT NULL,
    [CPF] NVARCHA(160) NOT NULL,
    [Endereco] NVARCHAR(160)  NOT NULL,
    [Telefone] NVARCHAR(160) NOT NULL,
    [admin] INTEGER,
    CONSTRAINT [PK_Vendedor] PRIMARY KEY ([VendedorId]),
    CONSTRAINT [FK_Usuario] FOREIGN KEY ([UsuarioId]) REFERENCES usuario(UsuarioId), 
    CONSTRAINT [FK_Loja] FOREIGN KEY ([LojaId]) REFERENCES Loja(LojaId)
  
);

CREATE UNIQUE INDEX [IPK_VENDEDOR] ON [VENDEDOR]([VendedorId]);

-- Criando a tabela Pedido

CREATE TABLE [Pedido]
(
    [PedidoId] NVARCHAR(160)  NOT NULL,
    [ClienteId] NVARCHAR(160)  NOT NULL,
    [VendedorId] NVARCHAR(160)  NOT NULL,
    [Status] NVARCHAR(160)  NOT NULL,
    [Tempo_Espera] TIME NOT NULL,
    [Vlr_pedido] FLOAT  NOT NULL,
    [data] DATATIME NOT NULL,
    CONSTRAINT [PK_Pedido] PRIMARY KEY ([PedidoId]),
    CONSTRAINT [FK_Cliente] FOREIGN KEY ([ClienteId]) REFERENCES cliente(ClienteId), 
    CONSTRAINT [FK_Vendedor] FOREIGN KEY ([VendedorId]) REFERENCES vendedor(VendedorId)
  
);

CREATE UNIQUE INDEX [IPK_PEDIDO] ON [PEDIDO]([PedidoId]);


-- Criando a tabela de Itens_Pedido

CREATE TABLE [Itens_Pedido]
(
[Itens_PedidoId] NVARCHAR(160) NOT NULL,
[PedidoId] NVARCHAR(160)  NOT NULL,
[ProdutoId] NVARCHAR(160) NOT NULL,
[Qnt_Produto] INTEGER NOT NULL,
CONSTRAINT [PK_Itens_Pedido] PRIMARY KEY ([Itens_PedidoId]),
CONSTRAINT [FK_Pedido] FOREIGN KEY ([PedidoId]) REFERENCES pedido(PedidoId),
CONSTRAINT [FK_Produto] FOREIGN KEY ([ProdutoId]) REFERENCES produto(ProdutoId)

);

CREATE UNIQUE INDEX [IPK_ITENS_PEDIDO] ON [ITENS_PEDIDO]([Itens_PedidoId]);


-- INSERT

-- Inserindo um registro na tabela Cliente

INSERT INTO Cliente (ClienteId, UsuarioId, Nome, CPF, Endereco, Telefone)
VALUES (1, 1, 'Jose', '145221199', 'Rua Olivia 123', 31988721210);

INSERT INTO Cliente (ClienteId, UsuarioId, Nome, CPF, Endereco, Telefone)
VALUES (2, 2, 'Ana', '2345221169', 'Rua Nasa 99', 319875213199);

INSERT INTO Cliente (ClienteId, UsuarioId, Nome, CPF, Endereco, Telefone)
VALUES (3, 3, 'Maria', '987662133', 'Rua Osvaldo Nunes 2', 22975230011);

-- Inserindo um registro na tabela Fornecedor

INSERT INTO Fornecedor (FornecedorId, Nome, Email, Endereco, Cnpj, Telefone)
VALUES (1, 'Ambev LTDA', 'ambev@gmail.com', 'Rua da Agua n199', '42480617000100', 5530007255);

INSERT INTO Fornecedor (FornecedorId, Nome, Email, Endereco, Cnpj, Telefone)
VALUES (2, 'Grupo Heineken', 'gheineken@hotmail.com', 'Rua da Saudade n88', '88471619000125', 1199991000);

INSERT INTO Fornecedor (FornecedorId, Nome, Email, Endereco, Cnpj, Telefone)
VALUES (3, 'Grupo Petropolis', 'petropolisgroup@outlook.com', 'Avenida Itambé n5', '14943748000132', 1155332200);

-- Inserindo um registro na tabela Vendedor

INSERT INTO Vendedor (VendedorId, UsuarioId, LojaId, Nome, CPF, Endereco, Telefone, admin)
VALUES (1, 4, 1, 'Fernando', '96186624030', 'Rua Florianópolis n10', '6936841381', 'TRUE');

INSERT INTO Vendedor (VendedorId, UsuarioId, LojaId, Nome, CPF, Endereco, Telefone, admin)
VALUES (2, 5, 2, 'Marisa', '48160399022', 'Rua Quatro n4', '3325417235', 'TRUE');

INSERT INTO Vendedor (VendedorId, UsuarioId, LojaId, Nome, CPF, Endereco, Telefone, admin)
VALUES (3, 6, 3, 'Jonas', '89893322065', 'Rua Quiriote n1050', '96227898435', 'TRUE');

-- Inserindo um registro na tabela Loja

INSERT INTO Loja (LojaId, Nome, Endereco, Telefone)
VALUES (1, 'Breja Boa', 'Rua Desafogados n55', '6930502210');

INSERT INTO Loja (LojaId, Nome, Endereco, Telefone)
VALUES (2, 'Adega do Ceu', 'Rua Deselegantes n159', '3315559910');

INSERT INTO Loja (LojaId, Nome, Endereco, Telefone)
VALUES (3, 'Zeze Beer', 'Rua Trambolhas n3000', '9699995000');

-- Inserindo um registro na tabela Produto

INSERT INTO Produto (ProdutoId, FornecedorId, Nome, Vlr_Produto)
VALUES (1, 3, 'Itaipava', 4.50);

INSERT INTO Produto (ProdutoId, FornecedorId, Nome, Vlr_Produto)
VALUES (2, 1, 'Pepsi 1L', 3.99);

INSERT INTO Produto (ProdutoId, FornecedorId, Nome, Vlr_Produto)
VALUES (3, 2, 'Heineken 600ml', 9.00);

-- Inserindo um registro na tabela Estoque

INSERT INTO Estoque (EstoqueId, ProdutoId, LojaId, Qtd_Produtos)
VALUES (1, 3, 1, 200);

INSERT INTO Estoque (EstoqueId, ProdutoId, LojaId, Qtd_Produtos)
VALUES (2, 1, 3, 357);

INSERT INTO Estoque (EstoqueId, ProdutoId, LojaId, Qtd_Produtos)
VALUES (3, 2, 2, 50);

-- Inserindo um registro na tabela Relatorio

INSERT INTO Relatorio (RelatorioId, LojaId, Vlr_Total, Data_Inicio, Data_Fim)
VALUES (1, 3, 25.000, '2023-01-10 00:00:00', '2023-31-10 00:00:00');

INSERT INTO Relatorio (RelatorioId, LojaId, Vlr_Total, Data_Inicio, Data_Fim)
VALUES (2, 1, 15.300, '2023-01-10 00:00:00', '2023-15-10 00:00:00');

INSERT INTO Relatorio (RelatorioId, LojaId, Vlr_Total, Data_Inicio, Data_Fim)
VALUES (3, 2, 8.200, '2023-01-10 00:00:00', '2023-08-10 00:00:00');

-- Inserindo um registro na tabela Pedido

INSERT INTO Pedido (PedidoId, ClienteId, VendedorId, Status, Tempo_Espera, Vlr_Pedido, data)
VALUES (1, 3, 1, 'EM PREPARO', '40min-65min', 45.00, '2023-03-10 18:30:20');

INSERT INTO Pedido (PedidoId, ClienteId, VendedorId, Status, Tempo_Espera, Vlr_Pedido, data)
VALUES (3, 1, 2, 'SAIU PARA ENTREGA', '10min', 32.50, '2023-17-10 22:23:00');

INSERT INTO Pedido (PedidoId, ClienteId, VendedorId, Status, Tempo_Espera, Vlr_Pedido, data)
VALUES (2, 2, 3, 'CANCELADO', '00min', 15.00, '2023-25-10 19:23:00');

-- Inserindo um registro na tabela Itens_Pedido

INSERT INTO Itens_Pedido (Itens_PedidoId, PedidoId, ProdutoId, Qnt_Produto)
VALUES (1, 3, 3, 5);

INSERT INTO Itens_Pedido (Itens_PedidoId, PedidoId, ProdutoId, Qnt_Produto)
VALUES (2, 1, 2, 12);

INSERT INTO Itens_Pedido (Itens_PedidoId, PedidoId, ProdutoId, Qnt_Produto)
VALUES (3, 2, 1, 17);

-- SELECT DAS INF DE CADA TABELA

SELECT * FROM Cliente 
SELECT * FROM Cliente WHERE Nome LIKE 'Maria%';
SELECT * FROM Estoque e 
SELECT * FROM Estoque e WHERE EstoqueId LIKE '%2';
SELECT * FROM Fornecedor f 
SELECT * FROM Fornecedor f WHERE Cnpj LIKE '88471619000125%';
SELECT * FROM Itens_Pedido ip 
SELECT * FROM Itens_Pedido ip WHERE Itens_PedidoId LIKE '%1';
SELECT * FROM Loja
SELECT * FROM Loja l WHERE Telefone LIKE '6930502210%';
SELECT * FROM Pedido p 
SELECT * FROM Pedido p WHERE Status LIKE 'CANCELADO%';
SELECT * FROM Produto p 
SELECT * FROM Produto p WHERE Vlr_Produto LIKE '4.5%';
SELECT * FROM Relatorio r 
SELECT * FROM Relatorio r WHERE Data_Fim LIKE '2023-08-10 00:00:00';
SELECT * FROM VENDEDOR v 
SELECT * FROM VENDEDOR v WHERE Nome LIKE 'Jonas';

-- UPDATES CLIENTE

SELECT * FROM Cliente c 
UPDATE Cliente SET Nome = 'Otavio' WHERE ClienteId =1;
UPDATE Cliente SET Telefone = '96988501020' WHERE ClienteId =2;
UPDATE Cliente SET CPF = '38338142093' WHERE ClienteId =3;

-- UPDATE ESTOQUE

SELECT * FROM Estoque e 
UPDATE Estoque SET Qtd_Produtos = '66' WHERE EstoqueId = 3;

-- UPDATES FORNECEDOR

SELECT * FROM Fornecedor f 
UPDATE Fornecedor SET Email = 'heineke@yahoo.com' WHERE FornecedorId= 2;
UPDATE Fornecedor SET Endereco = 'Avenida Brasil n5000' WHERE FornecedorId =3;
UPDATE Fornecedor SET Cnpj = '82499924000149' WHERE FornecedorId =1;

-- UPDATES ITENS_PEDIDO

SELECT * FROM Itens_Pedido ip 
UPDATE Itens_Pedido SET Qnt_Produto = '8' WHERE Itens_PedidoId = 1;

-- UPDATES LOJA

SELECT * FROM Loja
UPDATE Loja SET Nome = 'Adega do Arumuni' WHERE LojaId = 2;
UPDATE Loja SET Endereco = 'Avenida Trampolin n10' WHERE LojaId = 3;
UPDATE Loja SET Telefone = '6930204055' WHERE LojaId = 1;

-- UPDATES PEDIDO

SELECT * FROM Pedido p 
UPDATE Pedido SET Tempo_Espera = '50min' WHERE PedidoId = 1;
UPDATE Pedido SET Vlr_pedido = '12.50' WHERE PedidoId = 3;
UPDATE Pedido SET "data" = '2023-17-10 22:15:55' WHERE PedidoId =2;

-- UPDATES PRODUTO

SELECT * FROM Produto p 
UPDATE Produto SET Nome = 'Itaipava 420ml' WHERE ProdutoId = 1;
UPDATE Produto SET Vlr_Produto = '4.35' WHERE ProdutoId = 1;

-- UPDATES RELATORIO

SELECT * FROM Relatorio r 
UPDATE Relatorio SET Vlr_Total = '25000' WHERE RelatorioId = 1;
UPDATE Relatorio SET Vlr_Total = '15300' WHERE RelatorioId = 2;
UPDATE Relatorio SET Vlr_Total = '8200' WHERE RelatorioId = 1;

-- UPDATES VENDEDOR

SELECT * FROM VENDEDOR v 
UPDATE VENDEDOR SET Nome = 'Mariana' WHERE VendedorId = 2;
UPDATE VENDEDOR SET CPF = '47515605065' WHERE VendedorId = 3;

-- DELETES + INSERTS Criados de Exemplo --

SELECT * FROM Loja l 
INSERT INTO Loja (LojaId, Nome, Endereco, Telefone)
VALUES (5, 'Mouse Beer', 'Rua Caracas n2', '2299995440');

DELETE FROM Loja WHERE LojaId = 5;

SELECT * FROM Relatorio r 
INSERT INTO Relatorio (RelatorioId, LojaId, Vlr_Total, Data_Inicio, Data_Fim)
VALUES (4, 2, 55.000, '2023-01-09 00:00:00', '2023-31-09 00:00:00');

DELETE FROM Relatorio WHERE RelatorioId= 4;

SELECT * FROM Pedido
INSERT INTO Pedido (PedidoId, ClienteId, VendedorId, Status, Tempo_Espera, Vlr_Pedido, data)
VALUES (10, 2, 3, 'CANCELADO', '10min', 22.00, '2023-03-09 12:54:22');

DELETE FROM Pedido WHERE PedidoId = 10;

SELECT * FROM Cliente c 
INSERT INTO Cliente (ClienteId, UsuarioId, Nome, CPF, Endereco, Telefone)
VALUES (157, 123, 'Maicon', '1252455399', 'Rua das Marias 22', 33985431210);

DELETE FROM Cliente WHERE ClienteId = 157;

SELECT * FROM Estoque e 
INSERT INTO Estoque (EstoqueId, ProdutoId, LojaId, Qtd_Produtos)
VALUES (15, 3, 1, 1500);

DELETE FROM Estoque WHERE EstoqueId = 15;

SELECT * FROM Fornecedor f 
INSERT INTO Fornecedor (FornecedorId, Nome, Email, Endereco, Cnpj, Telefone)
VALUES (7, 'Pergola LTDA', 'Pergola@gmail.com', 'Rua do Vinho n22', '57480617000121', 1230007254);

DELETE FROM Fornecedor WHERE FornecedorId= 7;

SELECT * FROM Itens_Pedido
INSERT INTO Itens_Pedido (Itens_PedidoId, PedidoId, ProdutoId, Qnt_Produto)
VALUES (8, 2, 1, 10);

DELETE FROM Itens_Pedido WHERE Itens_PedidoId = 8;

SELECT * FROM Produto p 
INSERT INTO Produto (ProdutoId, FornecedorId, Nome, Vlr_Produto)
VALUES (4, 1, 'Coca-Cola 2L', 8.55);

DELETE FROM Produto WHERE ProdutoID = 4;

SELECT * FROM VENDEDOR v 
INSERT INTO Vendedor (VendedorId, UsuarioId, LojaId, Nome, CPF, Endereco, Telefone, admin)
VALUES (9, 7, 3, 'Gilmar', '29893622061', 'Rua da Praia n157', '27985627110', 'FALSE');

DELETE FROM VENDEDOR  WHERE VendedorId = 9;


-- INNER JOINS


-- 1 -- QUERO SABER TODAS SITUAÇÕES DE PEDIDOS REALIZADOS

SELECT
    Pedido.PedidoId, Cliente.Nome AS "Nome.Cliente", Pedido.Status, Pedido.Tempo_Espera, Pedido.Vlr_Pedido,Pedido.data
FROM Pedido
INNER JOIN Cliente ON Pedido.ClienteId = Cliente.ClienteId
ORDER BY Pedido.Status;

-- 2 -- QUERO SABER A QUANTIDADE DE PRODUTOS QUE CADA LOJA TEM NO ESTOQUE

SELECT Estoque.EstoqueId, Loja.LojaId AS "Loja", Produto.Nome AS "Nome do Produto", Estoque.Qtd_Produtos AS "Quantidade de Produto"
FROM Estoque 
INNER JOIN Produto ON Estoque.ProdutoId = Produto.ProdutoId
INNER JOIN Loja ON Estoque.LojaId = Loja.LojaId;

------

INSERT INTO Pedido (PedidoId, ClienteId, VendedorId, Status, Tempo_Espera, Vlr_Pedido, data)
VALUES (4, 3, 1, 'EM PREPARO', '45min-65min', 25.00, '2023-03-13 18:30:20');

INSERT INTO Pedido (PedidoId, ClienteId, VendedorId, Status, Tempo_Espera, Vlr_Pedido, data)
VALUES (5, 3, 2, 'EM PREPARO', '10min-25min', 15.00, '2023-07-10 12:33:20');

INSERT INTO Pedido (PedidoId, ClienteId, VendedorId, Status, Tempo_Espera, Vlr_Pedido, data)
VALUES (8, 1, 3, 'EM PREPARO', '5min-21min', 46.00, '2023-09-10 15:32:21');

INSERT INTO Pedido (PedidoId, ClienteId, VendedorId, Status, Tempo_Espera, Vlr_Pedido, data)
VALUES (9, 1, 3, 'EM PREPARO', '9min-27min', 90.0, '2023-02-10 17:52:41');

-- 3 -- QUERO SABER QUANTOS PEDIDOS CADA CLIENTE FEZ

SELECT Cliente.ClienteId, Cliente.Nome AS "Nome do Cliente", COUNT(Pedido.PedidoId) AS "Quantidade de Pedidos"
FROM Pedido
INNER JOIN Cliente ON Pedido.ClienteId = Cliente.ClienteId
GROUP BY Cliente.ClienteId, Cliente.Nome
ORDER BY Cliente.Nome;

-- + INSERT +

INSERT INTO Produto (ProdutoId, FornecedorId, Nome, Vlr_Produto)
VALUES (4, 2, 'Kaiser 300ml', 2.39);

INSERT INTO Produto (ProdutoId, FornecedorId, Nome, Vlr_Produto)
VALUES (5, 2, 'Devassa 1L', 7.39);

INSERT INTO Produto (ProdutoId, FornecedorId, Nome, Vlr_Produto)
VALUES (7, 2, 'Amstel 270ml', 3.00);

INSERT INTO Produto (ProdutoId, FornecedorId, Nome, Vlr_Produto)
VALUES (8, 2, 'Eisenbahn 300ml', 4.20);

INSERT INTO Produto (ProdutoId, FornecedorId, Nome, Vlr_Produto)
VALUES (9, 1, 'Corona Extra 300ml', 6.00);

INSERT INTO Produto (ProdutoId, FornecedorId, Nome, Vlr_Produto)
VALUES (10, 1, 'Brahma 250ml', 2.90);

INSERT INTO Produto (ProdutoId, FornecedorId, Nome, Vlr_Produto)
VALUES (11, 1, 'Brahma Duplo Malte 250ml', 3.30);

INSERT INTO Produto (ProdutoId, FornecedorId, Nome, Vlr_Produto)
VALUES (12, 1, 'Stella Artois 350ml', 7.00);

INSERT INTO Produto (ProdutoId, FornecedorId, Nome, Vlr_Produto)
VALUES (13, 1, 'Budweiser 350ml', 5.50);

INSERT INTO Produto (ProdutoId, FornecedorId, Nome, Vlr_Produto)
VALUES (14, 1, 'Bohemia 250ml', 3.45);

INSERT INTO Produto (ProdutoId, FornecedorId, Nome, Vlr_Produto)
VALUES (15, 1, 'Spaten 350ml', 4.00);

INSERT INTO Produto (ProdutoId, FornecedorId, Nome, Vlr_Produto)
VALUES (16, 1, 'Skol 350ml', 3.20);

INSERT INTO Produto (ProdutoId, FornecedorId, Nome, Vlr_Produto)
VALUES (17, 3, 'Petra 600ml', 6.99);

INSERT INTO Produto (ProdutoId, FornecedorId, Nome, Vlr_Produto)
VALUES (19, 3, 'Cacildis 355ml',3.99);

-- 4 -- QUERO SABER QUAIS PRODUTOS CADA FORNECEDOR FORNECE 

SELECT Fornecedor.FornecedorId, Fornecedor.Nome AS "Nome do Fornecedor", Produto.Nome AS "Nome do Produto"
FROM Produto
INNER JOIN Fornecedor ON Produto.FornecedorId = Fornecedor.FornecedorId
ORDER BY Fornecedor.Nome;
