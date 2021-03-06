CREATE TABLE MARCAS (
  CODIGO SERIAL NOT NULL,
  NOME VARCHAR(50) NOT NULL,
  PRIMARY KEY(CODIGO)
);

CREATE TABLE GRUPOS (
  CODIGO SERIAL NOT NULL,
  NOME VARCHAR(50) NOT NULL,
  PRIMARY KEY(CODIGO)
);

CREATE TABLE CLIENTES (
  CODIGO SERIAL NOT NULL,
  NOME VARCHAR(100) NOT NULL,
  CPF VARCHAR(20) NOT NULL,
  PRIMARY KEY(CODIGO)
);

CREATE TABLE VENDAS (
  CODIGO SERIAL NOT NULL,
  CLIENTE INTEGER NOT NULL,
  DATA_VENDA DATE NOT NULL,
  HORA_VENDA TIME NOT NULL,
  VALOR_BRUTO DOUBLE PRECISION NOT NULL,
  VALOR_DESCONTO DOUBLE PRECISION NOT NULL,
  VALOR_LIQUIDO DOUBLE PRECISION NOT NULL,
  PRIMARY KEY(CODIGO),
  FOREIGN KEY(CLIENTE)
    REFERENCES CLIENTES(CODIGO)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE ITENS (
  CODIGO SERIAL NOT NULL,
  MARCA INTEGER NOT NULL,
  GRUPO INTEGER NOT NULL,
  DESCRICAO VARCHAR(100) NOT NULL,
  PRECO_VENDA DOUBLE PRECISION NOT NULL,
  PRIMARY KEY(CODIGO),
  FOREIGN KEY(GRUPO)
    REFERENCES GRUPOS(CODIGO)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(MARCA)
    REFERENCES MARCAS(CODIGO)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE VENDAS_ITENS (
  CODIGO INTEGER NOT NULL,
  SEQUENCIA INTEGER NOT NULL,
  ITEM INTEGER NOT NULL,
  VALOR_UNIT DOUBLE PRECISION NOT NULL,
  QUANTIDADE DOUBLE PRECISION NOT NULL,
  VALOR_BRUTO DOUBLE PRECISION NOT NULL,
  VALOR_DESCONTO DOUBLE PRECISION NOT NULL,
  VALOR_LIQUIDO DOUBLE PRECISION NOT NULL,
  PRIMARY KEY(CODIGO, SEQUENCIA),
  FOREIGN KEY(CODIGO)
    REFERENCES VENDAS(CODIGO)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ITEM)
    REFERENCES ITENS(CODIGO)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);






INSERT INTO grupos(nome) VALUES ('Alimentos');
INSERT INTO grupos(nome) VALUES ('Bebidas');
INSERT INTO grupos(nome) VALUES ('Carnes');
INSERT INTO grupos(nome) VALUES ('Frutas e Verduras');
INSERT INTO grupos(nome) VALUES ('Padaria');
INSERT INTO grupos(nome) VALUES ('Estacionamento');


INSERT INTO marcas(nome) VALUES ('Nestle');
INSERT INTO marcas(nome) VALUES ('Lacta');
INSERT INTO marcas(nome) VALUES ('Coca Cola');
INSERT INTO marcas(nome) VALUES ('Tampico');
INSERT INTO marcas(nome) VALUES ('Antarctica');
INSERT INTO marcas(nome) VALUES ('Elma Chips');
INSERT INTO marcas(nome) VALUES ('Kibon');
INSERT INTO marcas(nome) VALUES ('Duracell');


INSERT INTO CLIENTES (CODIGO, NOME, CPF) VALUES (1, 'CLIENTE 01', '86976005021');
INSERT INTO CLIENTES (CODIGO, NOME, CPF) VALUES (2, 'CLIENTE 02', '41940060036');
INSERT INTO CLIENTES (CODIGO, NOME, CPF) VALUES (3, 'CLIENTE 03', '99448842007');
INSERT INTO CLIENTES (CODIGO, NOME, CPF) VALUES (4, 'CLIENTE 04', '89847510067');


INSERT INTO ITENS (CODIGO, MARCA, GRUPO, DESCRICAO, PRECO_VENDA)
           VALUES (1, 1, 2, 'ACHOCOLATADO NESTLE', 5);
INSERT INTO ITENS (CODIGO, MARCA, GRUPO, DESCRICAO, PRECO_VENDA)
           VALUES (2, 2, 1, 'CHOCOLATE ALPINO', 3.89);
INSERT INTO ITENS (CODIGO, MARCA, GRUPO, DESCRICAO, PRECO_VENDA)
           VALUES (3, 3, 2, 'COCA COLA 2L', 5.59);
INSERT INTO ITENS (CODIGO, MARCA, GRUPO, DESCRICAO, PRECO_VENDA)
           VALUES (4, 5, 2, 'CERVEJA ORIGINAL 600ML', 5.79);
INSERT INTO ITENS (CODIGO, MARCA, GRUPO, DESCRICAO, PRECO_VENDA)
           VALUES (5, 8, 1, 'PILHA AAA 4UN', 12.59);
INSERT INTO ITENS (CODIGO, MARCA, GRUPO, DESCRICAO, PRECO_VENDA)
           VALUES (6, 7, 1, 'PICOLÉ KIBON TABLITO', 4.1);
INSERT INTO ITENS (CODIGO, MARCA, GRUPO, DESCRICAO, PRECO_VENDA)
           VALUES (7, 6, 1, 'SALGADINHO FANDANGOS QUEIJO 59G', 3.5);
INSERT INTO ITENS (CODIGO, MARCA, GRUPO, DESCRICAO, PRECO_VENDA)
           VALUES (8, 3, 2, 'CERVEJA SOL LONG NECK', 5);
		   
		   		   
INSERT INTO VENDAS (CODIGO, CLIENTE, DATA_VENDA, HORA_VENDA, VALOR_BRUTO, VALOR_DESCONTO, VALOR_LIQUIDO)
            VALUES (1, 2, '2019-07-09', '08:58:00', 15.59, 0, 15.59);
INSERT INTO VENDAS (CODIGO, CLIENTE, DATA_VENDA, HORA_VENDA, VALOR_BRUTO, VALOR_DESCONTO, VALOR_LIQUIDO)
            VALUES (2, 4, '2019-07-30', '10:16:00', 34.74, 3.474, 31.26);
INSERT INTO VENDAS (CODIGO, CLIENTE, DATA_VENDA, HORA_VENDA, VALOR_BRUTO, VALOR_DESCONTO, VALOR_LIQUIDO)
            VALUES (3, 1, '2019-08-14', '14:58:00', 24.29, 0, 24.29);
INSERT INTO VENDAS (CODIGO, CLIENTE, DATA_VENDA, HORA_VENDA, VALOR_BRUTO, VALOR_DESCONTO, VALOR_LIQUIDO)
            VALUES (4, 2, '2019-08-16', '16:00:00', 50, 0, 50);


			
			
INSERT INTO VENDAS_ITENS (CODIGO, SEQUENCIA, ITEM, VALOR_UNIT, QUANTIDADE, VALOR_BRUTO, VALOR_DESCONTO, VALOR_LIQUIDO)
                  VALUES (1, 1, 8, 5, 2, 10, 0, 10);
INSERT INTO VENDAS_ITENS (CODIGO, SEQUENCIA, ITEM, VALOR_UNIT, QUANTIDADE, VALOR_BRUTO, VALOR_DESCONTO, VALOR_LIQUIDO)
                  VALUES (1, 2, 3, 5.59, 1, 5.59, 0, 5.59);
INSERT INTO VENDAS_ITENS (CODIGO, SEQUENCIA, ITEM, VALOR_UNIT, QUANTIDADE, VALOR_BRUTO, VALOR_DESCONTO, VALOR_LIQUIDO)
                  VALUES (2, 1, 4, 5.79, 6, 34.74, 3.474, 31.266);
INSERT INTO VENDAS_ITENS (CODIGO, SEQUENCIA, ITEM, VALOR_UNIT, QUANTIDADE, VALOR_BRUTO, VALOR_DESCONTO, VALOR_LIQUIDO)
                  VALUES (3, 1, 6, 4.1, 2, 8.2, 0, 8.2);
INSERT INTO VENDAS_ITENS (CODIGO, SEQUENCIA, ITEM, VALOR_UNIT, QUANTIDADE, VALOR_BRUTO, VALOR_DESCONTO, VALOR_LIQUIDO)
                  VALUES (3, 2, 5, 12.59, 1, 12.59, 0, 12.59);
INSERT INTO VENDAS_ITENS (CODIGO, SEQUENCIA, ITEM, VALOR_UNIT, QUANTIDADE, VALOR_BRUTO, VALOR_DESCONTO, VALOR_LIQUIDO)
                  VALUES (3, 3, 7, 3.5, 1, 3.5, 0, 3.5);
INSERT INTO VENDAS_ITENS (CODIGO, SEQUENCIA, ITEM, VALOR_UNIT, QUANTIDADE, VALOR_BRUTO, VALOR_DESCONTO, VALOR_LIQUIDO)
                  VALUES (4, 1, 8, 5, 10, 50, 0, 50);
		  
		  
				  1------------------------
				  select sum(coalesce(v.valor_desconto, 0)), c.nome 
				  from vendas v 
				  full join clientes c 
				  on c.codigo = v.cliente
				  group by c.nome
				  order by c.nome;
				  
				  2---------------------------
				  select coalesce(sum(v.valor_desconto),0),  lower(c.nome) 
				  from vendas v 
				  full join clientes c 
				  on c.codigo = v.cliente
				  group by c.nome
				  order by c.nome;
				  
				  3--------------------------
				 select v.data_venda , vi.item, i.descricao, sum(vi.valor_bruto) 
				 as total_vendas, sum(vi.valor_desconto) as total_desconto from vendas v 
				 inner join vendas_itens vi on vi.codigo = v.codigo 
				 inner join itens i on i.codigo = vi.item
				 where v.data_venda between '2019-08-01' and '2019-08-30' 
				 group by vi.item, i.descricao, v.data_venda
				 
				 4-----------------------------
				select v.data_venda , m.nome, sum(vi.valor_bruto) as total_vendas, sum(vi.valor_desconto) as total_desconto from vendas v 
				inner join vendas_itens vi on vi.codigo = v.codigo 
				inner join itens i on i.codigo = vi.item
				inner join marcas m on m.codigo = i.marca
				where v.data_venda between '2019-08-01' and '2019-08-30' 
				group by vi.item, i.descricao, v.data_venda,m.nome
				
	------------------------------------------------------------------------------------------------------------------------
				1) functions
					     
				1-----------------------------
				
				create or replace function retorna_nome_cliente(clienteid int)
				returns text as
				$$
				declare
					vnome text;
					vativo text;
				begin
					select nome, ativo
						into vnome,vativo
						from clientes where codigo = clienteid;

						if vativo ='s' then
							return vnome || '-' || 'Usuário Ativo';
						else
							return vnome || '-' || 'Usuário Inativo';
						end if;
				end
				$$
				language plpgsql
	-----------------------------------------------------------------------------------------------------------------------			
				2----------------------------------------------------------
				create or replace function soma(n1 int, n2 int)
				returns int as
				$$
				begin
					return n1 + n2;
				end;
				$$
				language plpgsql
	-----------------------------------------------------------------------------------------------------------------------	     
	|			para chama-la usar 										|
	|			select soma(1,2)										|			
	-----------------------------------------------------------------------------------------------------------------------			
				3---------------------------------------------------------------
				
				create or replace function retorna_nome_cliente(clienteid int)
				returns text as
				$$
				declare
					cnome text;
				begin

					select c.nome into cnome from clientes c where c.codigo = clienteid;

					return cnome;

				end
				$$
				language plpgsql;
	-----------------------------------------------------------------------------------------    
	|			select retorna_nome_cliente(1);					|
	-----------------------------------------------------------------------------------------
					     
					     
/*usando like - case sensetive*/
select * from clientes where nomes like E%;
select * from clientes where nomes like %a;
select * from clientes where nomes like %li%;

/*usando ilike - case insensetive*/
select * from clientes where nomes ilike li%;
select * from clientes where nomes ilike %li;
select * from clientes where nomes ilike %li%;


Create or replace function clientes()
returns setof clientes AS
$$
declare
	--cursor
	reg clientes%rowtype;
BEGIN
		--realiza um loop em todos os clientes da tabela
for reg in
select codigo,nome,cpf from clientes
	loop
	return next reg;
	end loop;
	return;
END;
$$
LANGUAGE plpgsql;
/*-=-=-=-=-=-=-=-=-=-=-=-=-=-=FUNSIONE=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=*/
	
/*-=-=-=-=-=-=-=-=-=-=-=-=-=-=FUNSIONE=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=*/
select * from clientes();
/*Retorna nulo em todos os campos em que nao foram chamados na funcao*/
create function
quebrapc()
returns float as
$$
begin
for int 0
select random();
end;
$$
Language plpgsql

create function selecionaporcpf(cpfdigitado varchar)
returns text as
$$
begin
select codigo,nome,cpf from clientes where cpf = cpfdigitado
return cpfdigitado;
end;
$$
language plpgsql
select selecionarporcpf('86976005021');
--------------------------------------------------------------------------------------------------------------------------------------  
/*Buscar todos os clientes que contenham 'fael' no nome*/
select * from clientes where nomes like %fael%;
/*Buscar todos os clientes que inicie com 'clie'*/					     
select * from clientes where nomes like clie%;
/*Buscar todos os produtos que terminem com 'uto'*/					     
select * from produtos where descricao ilike %uto;
