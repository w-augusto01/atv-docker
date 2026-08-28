Write-Host "=== iniciando projeto ==="

# Verifica se a rede existe
docker network inspect rede_atividade *> $null

if ($LASTEXITCODE -ne 0) {
    docker network create rede_atividade
}

# Verifica se o MySQL existe
docker inspect mysql-db *> $null

if ($LASTEXITCODE -ne 0) {
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
}

# Verifica se o Node existe
docker inspect node-app *> $null

if ($LASTEXITCODE -ne 0) {
    docker build -t atv-node .

    docker volume create node_data

    docker run -d `
        --name node-app `
        --network rede_atividade `
        -p 3000:3000 `
        --memory=128m `
        --cpus=0.2 `
        -v node_data:/app/data `
        atv-node
}

Write-Host ""
Write-Host "=== projeto iniciado ==="

docker ps