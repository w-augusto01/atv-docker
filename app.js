const express = require("express");
const mysql = require("mysql2/promise");

const app = express();

const port = 3000;

const pool = mysql.createPool({
    host: process.env.DB_HOST || "mysql-db",
    user: process.env.DB_USER || "root",
    password: process.env.DB_PASSWORD,
    database: process.env.DB_DATABASE || "loja",
    port: process.env.DB_PORT || 3306,
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0
});

app.get("/", (req, res) => {
    res.json({
        mensagem: "api node/express funcionando!"
    });
});

app.get("/categorias", async (req, res) => {
    try {
        const [categorias] = await pool.query(`
            select
                id,
                nome,
                descricao,
                ativo,
                criado_em
            from categorias
            order by id
        `);

        res.json(categorias);

    } catch (error) {
        console.error("erro ao consultar categorias:", error);

        res.status(500).json({
            erro: "erro ao consultar categorias"
        });
    }
});

app.get("/produtos", async (req, res) => {
    try {
        const [produtos] = await pool.query(`
            select
                produtos.id,
                produtos.nome,
                produtos.preco,
                produtos.quantidade_estoque,
                categorias.nome as categoria
            from produtos
            inner join categorias
                on produtos.categoria_id = categorias.id
            order by produtos.id
        `);

        res.json(produtos);

    } catch (error) {
        console.error("erro ao consultar produtos:", error);

        res.status(500).json({
            erro: "erro ao consultar produtos"
        });
    }
});

app.listen(port, "0.0.0.0", () => {
    console.log(`servidor rodando na porta ${port}`);
});