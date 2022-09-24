insert into pessoafisica(CPF) 
	values('81648896014'),
			('93042807029'),
			('91084596067'),
			('81024608069');
			
            
insert into pessoajuridica(CNPJ) 
	values('15208235000140'),
			('02678282000106'),
			('83250069000109'),
            ('32803571000150');
            
insert into veiculos (tipoveiculo,marca,placa) values
('caminhão','Ford','FO123456'),
('carro','Fiat','FI7890123'),
('moto','Suzuki','SUZ3456788'),
('onibus','Marcedes','MER456789'),
('trator','Volvo','TRAR57890654');

insert into clientes(nomecliente,contato,email,idc_veiculos,idc_pessoafisica,idc_pessoajuridica)
	values
		  ('Matheus',11987842692,'matheus@gmail.com',1,1,null),
          ('Maria',11976543123,'maria@gmail.com',2,2,null),
          ('Joao',1198745849,'joão@gmail.com',3,3,null),
          ('Felipe',123445434,'felipe@gmail.com',4,4,null);
          

insert into pecas(pecas,quantidade)values
('Pistão',5),
('Motor',10),
('Cambio',5),
('Volante',6);

insert into diagnostico(resultados,idd_veiculos,idd_pecas,quantidade_de_horas)
values
('Necessário manutenção',1,1,4),
('Não necessita manutenção',2,2,5),
('Necessário manutenção',3,3,4),
('Não necessita manutenção',4,4,5);

insert into preço_de_pecas(pecas,precos)
values
('Pistão',5.00),
('Motor',10.00),
('Cambio',12.00),
('Volante',6.00),
('Painel',20.00),
('Pneu',30.00);

insert into  endereco (Nome_Rua,Numero,Bairro,cep,Cidade,Estado,Pais,Complemento)
	values('rua silva de prata','29', 'Carangola',09452120,'Cidade das flores','SP','BR',null),
		('rua alemeda' ,'289','Centro','72020000','Cidade das flores','GO','BR',null),
        ('avenida almeda vinha', '1009', 'Centro','57081356','Cidade das flores','SP','BR',null),
        ('rua lareijas', '861', 'Centro','68900033','Cidade das flores','SP','BR',null),
        ('avenida koller', '19', 'Centro','49010450','Cidade das flores','SP','BR',null),
        ('rua alemeda das flores','28','Centro','77814480','Cidade das flores','SP','BR','apartamento-51,bloco-7'),
        ('rua dos calangos','24', 'Carangola',09122120,'Cidade das flores','SP','BR',null),
		('rua dos medicos' ,'259','Centro','72022100','Cidade das flores','GO','BR',null),
        ('avenida vinha', '5100', 'Centro','57481346','Cidade das flores','SP','BR',null),
        ('rua doce lar', '291', 'Centro','68904133','Cidade das flores','SP','BR',null);
        
insert into mecanicos(nome,nivel,especialidade)
values('Victor',1, 'Motor'),
	  ('Marcos',2, 'Painel'),
      ('Caio', 3, 'Mecanica'),
      ('Jonatas',4,'Cambio');

 insert into equipes(area_de_atuacao,ide_mecanicos)
 values('mecanica',1),
	   ('eletrica',2),
       ('mecanica',3),
       ('mecanica',4);





          