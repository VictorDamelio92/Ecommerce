create database Desafio_eccomerce;

use Desafio_eccomerce;

create table PessoaFisica(
IdPessoaFisica int auto_increment primary key,
CPF char(11) not null,
constraint unique_cpf_PessoaFisica unique (CPF)
);

create table PessoaJuridica(
IdPessoaJuridica int auto_increment primary key,
CNPJ char(15) not null,
constraint unique_CNPJ_PessoaJuridica unique (CNPJ)
);


create table Endereco(
IdEndereco int auto_increment primary key,
Nome_Rua varchar(100),
Numero varchar(6),
Bairro varchar(20),
cep char(8),
Cidade varchar(45),
Estado varchar(45),
Pais varchar(45),
Complemento varchar(100)
);


create  table Cliente(
	idClient int auto_increment primary key,
    Pnome varchar(30),
    NMeioInicial varchar(3),
	Sobrenome varchar(20),
    Data_de_Nascimento DATE,
    idc_PessoaFisica INT,
    idc_PessoaJuridica INT,
    idc_Endereco INT,
    constraint fk_idc_PessoaFisica foreign key (idc_PessoaFisica) references PessoaFisica (IdPessoaFisica),
	constraint fk_idc_PessoaJuridica foreign key (idc_PessoaJuridica) references PessoaJuridica (IdPessoaJuridica),
	constraint fk_idc_Endereco foreign key (idc_Endereco) references Endereco (IdEndereco)
);

create table fornecedor(
	idFornecedor int auto_increment primary key ,
    Nome_Fornecedor varchar(45) not null,
    Contato varchar(45),
    idf_PessoaJuridica INT,
    idf_Endereco INT,
    constraint fk_idf_PessoaJuridica foreign key (idf_PessoaJuridica) references PessoaJuridica (IdPessoaJuridica),
	constraint fk_idf_Endereco foreign key (idf_Endereco) references Endereco (IdEndereco)
);

create table Vendedor(
	idVendedor int auto_increment primary key,
    Razão_social varchar(45) not null,
    Contato char(11) not null,
    idv_PessoaFisica INT,
    idv_PessoaJuridica INT,
    idv_Endereco INT,
    constraint fk_idv_PessoaFisica foreign key (idv_PessoaFisica) references PessoaFisica (IdPessoaFisica),
	constraint fk_idv_PessoaJuridica foreign key (idv_PessoaJuridica) references PessoaJuridica (IdPessoaJuridica),
	constraint fk_idv_Endereco foreign key (idv_Endereco) references Endereco (IdEndereco)
);

create  table Produto(
	idProduto int auto_increment primary key,
    Nome_Produto varchar(30) not null,
    Classificação_Infantil bool default false,
	Categoria enum('Eletrônico', 'Vestimenta', 'Brinquedos', 'Alimentos', 'Móveis') not null,
    avaliação float default 0,
    Tamanho varchar(10),
    Valor decimal(7,2)
);

create table Produto_Vendedor(
	idPVendedor int,
    idPProduto int,
    Quantidade_Produto int default 1,
    primary key (idPVendedor, idPProduto),
    constraint fk_Produto_Vendedor foreign key(idPVendedor) references Vendedor(idVendedor),
    constraint fk_Produto_Produto foreign key (idPProduto) references Produto(idProduto)
);

create table Estoque(
	idEstoque int auto_increment primary key,
    idE_Endereco INT,
    Quantidade int default 0,
    constraint fk_idE_Endereco foreign key (idE_Endereco) references Endereco (IdEndereco)
);

create table Produto_Em_Estoque(
IdPE_Estoque int,
idPE_Produto int,
primary key(IdPE_Estoque,idPE_Produto),
constraint fk_IdPE_Estoque foreign key (IdPE_Estoque) references Estoque (IdEstoque),
constraint fk_idPE_Produto foreign key (idPE_Produto) references Produto(IdProduto)
);

create table Produto_Fornecedor(
idPF_Fornecedor int,
idPF_Produto int,
primary key(idPF_Fornecedor,idPF_Produto),
constraint fk_idPF_Fornecedor foreign key (idPF_Fornecedor ) references Fornecedor(IdFornecedor),
constraint fk_idPF_Produto foreign key (idPF_Produto) references Produto(IdProduto)
);

create table Produto_estoque(
idPE_Produto int,
idPE_Estoque int,
primary key(idPE_Produto,idPE_Estoque),
constraint fk_idPEE_Produto foreign key (idPE_Produto ) references Produto(IdProduto),
constraint fk_idPEE_Estoque foreign key (idPE_Estoque) references Estoque(IdEstoque)
);

create table Status(
IdStatus int auto_increment primary key,
Status_s enum ('Enviado', 'Entregue', 'Em Processamento', 'Em andamento') default 'Em processamento');

create table Entrega(
IdEntrega int auto_increment primary key,
Codigo_De_Rastreio varchar(45) not null unique,
idE_Status int,
idE_Entrega int,
constraint fk_idE_Status foreign key (idE_Status) references Status(IdStatus),
constraint fk_idE_Entrega foreign key (idE_Entrega) references Entrega(IdEntrega)
);

create table PIX(
IdPix int auto_increment primary key,
Chave varchar(45)
);

create table Debito(
IdDebito int auto_increment primary key,
N_Banco varchar(45),
N_agencia varchar(45)
);

create table Boleto(
idBoleto int auto_increment primary key,
Numero_do_Boleto VARCHAR(45) not null
);

create table Credito(
idCredito int auto_increment primary key,
N_Cartao varchar(45) not null,
N_Banco varchar(45) not null,
N_Agencia varchar(45) not null,
Bandeira varchar(45) not null
);

create table Forma_Pagamento(
idForma_Pagamento int auto_increment primary key,
idF_Pix int,
idF_Debito int,
idF_Boleto int,
IdF_Credito int,
constraint fk_idF_Pix foreign key (idF_Pix) references Pix(IdPix),
constraint fk_idF_Debito foreign key (idF_Debito ) references Debito(IdDebito),
constraint fk_idF_Boleto  foreign key (idF_Boleto) references Boleto(IdBoleto),
constraint fk_IdF_Credito foreign key (IdF_Credito) references Credito(IdCredito)
);

create table Pedido(
IdPedido int auto_increment primary key,
Descricao varchar(45) not null,
Frete float default 0,
idPCliente int not null,
idPEntrega int not null,
idPForma_Pagamento int not null,
constraint fk_idPCliente  foreign key (idPCliente) references Cliente(IdClient),
constraint fk_idPEntrega  foreign key (idPEntrega ) references Entrega(IdEntrega),
constraint fk_idPForma_Pagamento  foreign key (idPForma_Pagamento) references Forma_Pagamento(IdForma_Pagamento)
);

create table Relacao_Produto_Pedido(
idRP_Produto int,
idRP_Pedido int,
Quantidade int not null,
primary key(idRP_Produto, idRP_Pedido),
constraint fk_idRP_Produto  foreign key (idRP_Produto) references Produto(IdProduto),
constraint fk_idRP_Pedido  foreign key (idRP_Pedido) references Pedido(IdPedido)
);

show tables;

-- paramos aqui

