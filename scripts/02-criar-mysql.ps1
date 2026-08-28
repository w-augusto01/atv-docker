docker volume create mysql_data

docker run -d `
    --name mysql-db `
    --network rede_atividade `
    -e MYSQL_ROOT_PASSWORD=devops `
    -e MYSQL_DATABASE=loja `
    --memory=128m `
    --cpus=0.2 `
    -v mysql_data:/var/lib/mysql `
    mysql:latest `
    --innodb-buffer-pool-size=32M `
    --performance-schema=OFF `
    --max-connections=10