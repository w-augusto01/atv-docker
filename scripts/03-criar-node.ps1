docker run -d `
    --name node-app `
    --network rede_atividade `
    -p 3000:3000 `
    -e DB_HOST=mysql-db `
    -e DB_USER=devops `
    -e DB_PASSWORD=devops `
    -e DB_DATABASE=loja `
    -e DB_PORT=3306 `
    --memory=128m `
    --cpus=0.2 `
    -v node_data:/app/data `
    atv-node