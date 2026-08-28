# atv docker

atividade de docker com node/express e mysql em containers separados.

## arquitetura

cliente → node/express → mysql

os containers utilizam uma rede docker própria chamada:

rede_atividade

## containers

### mysql

nome do container:

mysql-db

imagem:

mysql:latest

banco:

loja

senha do root:

devops

### node

nome do container:

node-app

imagem:

atv-node

porta:

3000

## recursos

os dois containers foram configurados com:

- memória: 128mb
- cpu: 0.2

## rede

a rede utilizada pelo projeto é:

rede_atividade

os containers mysql-db e node-app estão conectados a essa mesma rede.

o node acessa o mysql utilizando o nome do container como hostname:

mysql-db

não é utilizado ip fixo.

## banco de dados

o banco possui duas tabelas:

- categorias
- produtos

a tabela produtos possui uma chave estrangeira:

categoria_id → categorias.id

o arquivo sql utilizado para criar o banco e inserir os dados está localizado em:

database/banco.sql

## rotas

### categorias

```text
get /categorias