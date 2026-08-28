create database if not exists loja;

use loja;

create table categorias (
    id int auto_increment primary key,
    nome varchar(100) not null,
    descricao varchar(255),
    ativo boolean not null default true,
    criado_em datetime not null default current_timestamp
);

create table produtos (
    id int auto_increment primary key,
    nome varchar(100) not null,
    preco decimal(10,2) not null,
    quantidade_estoque int not null default 0,
    categoria_id int not null,

    constraint fk_produto_categoria
        foreign key (categoria_id)
        references categorias(id)
);

insert into categorias (nome, descricao, ativo)
values
('eletrônicos', 'produtos eletrônicos e acessórios', true),
('informática', 'produtos para computadores', true),
('acessórios', 'acessórios diversos', true);

insert into produtos (nome, preco, quantidade_estoque, categoria_id)
values
('mouse gamer', 89.90, 25, 2),
('teclado mecânico', 249.90, 15, 2),
('fone bluetooth', 159.90, 30, 1),
('cabo usb-c', 39.90, 50, 3),
('webcam full hd', 299.90, 10, 1);