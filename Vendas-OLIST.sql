/* Tabelas de carga
SELECT * FROM olist_customers_dataset;
SELECT * FROM olist_geolocation_dataset;
SELECT * FROM olist_order_items_dataset;
SELECT * FROM olist_order_payments_dataset;
SELECT * FROM olist_order_reviews_dataset;
SELECT * FROM olist_orders_dataset;
SELECT * FROM olist_products_dataset;
SELECT * FROM olist_sellers_dataset;
SELECT * FROM product_category_name_translation;



*/

/* CRIAR AS TABELAS DE PRODUCAO

----------- Tabela customers ------------
CREATE TABLE customers 
(
	customer_id NVARCHAR (150),
    customer_unique_id NVARCHAR (150),
    customer_zip_code_prefix NVARCHAR (15),
    customer_city NVARCHAR (100),
    customer_state CHAR (2)

)

----------- Tabela geolocation ------------
CREATE TABLE geolocation 
(
	geolocation_zip_cod_prefix FLOAT (15),
    geolocation_lat NVARCHAR (100),
    geolocation_lng NVARCHAR (100),
    geolocation_city NVARCHAR (100),
    geolocation_state CHAR (2)

)

----------- Tabela order_items ------------
CREATE TABLE order_items
(
	order_id NVARCHAR(150),
    order_item_id char (10),
    product_id NVARCHAR (100),
    seller_id NVARCHAR (100),
    shipping_limit_date DATETIME
    
)

----------- Tabela order_payments ------------
CREATE TABLE order_payments
(
	order_id NVARCHAR (150),
    payment_sequential char (10),
    payment_type NVARCHAR (50),
    payment_installments FLOAT (10),
    payment_value FLOAT (50)
    
)

----------- Tabela order_reviews ------------
CREATE TABLE order_reviews
(
	review_id NVARCHAR (150),
    order_id NVARCHAR (150),
    review_score FLOAT (10),
	review_comment_title NVARCHAR(100),
	review_comment_message NVARCHAR (256),
	review_creation_date DATETIME,
	review_answer_timestamp DATETIME
)





-- Importar os dados da tabela de carga para as tabelas de producao
----------- Tabela customers ------------
INSERT INTO customers
SELECT * FROM olist_customers_dataset;

----------- Tabela geolocation ------------

INSERT INTO geolocation
SELECT * FROM olist_geolocation_dataset;

----------- Tabela order_items ------------
INSERT INTO order_items
SELECT * FROM olist_order_items_dataset

----------- Tabela order_payments ------------
INSERT INTO order_payments
select * from olist_order_payments_dataset;
*/



/* AVISO
Para importar os dados corretamente devemos substituir os dados vazios das colunas de datas por NULL
Por padrao o workbench nao permite atualizacoes na tabela de carga se houver uma chave primaria
Para fazermos esta atualizacao deve-se executar o comando abaixo.
SET SQL_SAFE_UPDATES=0;

SET SQL_SAFE_UPDATES=0;
UPDATE olist_order_items_dataset SET shipping_limit_date = NULL
WHERE shipping_limit_date = ''


*/

-- Corrigir o bug na importacao dos dados. a linha 315 da tabela review_comment_message



