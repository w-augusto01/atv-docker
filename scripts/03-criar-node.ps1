docker build -t atv-node .

docker volume create node_data

docker run -d `
    --name node-app `
    --network rede_atividade `
    -p 3000:3000 `
    --memory=128m `
    --cpus=0.2 `
    -e DB_HOST=mysql-db `
    -e DB_USER=root `
    -e DB_PASSWORD=root123 `
    -e DB_DATABASE=loja `
    -e DB_PORT=3306 `
    -v node_data:/app/data `
    atv-node