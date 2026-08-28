Write-Host "=== containers ==="
docker ps

Write-Host ""
Write-Host "=== rede ==="
docker network inspect rede_atividade --format "{{json .Containers}}"

Write-Host ""
Write-Host "=== tabelas ==="
docker exec mysql-db mysql -uroot -proot123 -e "show tables from loja;"

Write-Host ""
Write-Host "=== categorias ==="
docker exec mysql-db mysql -uroot -proot123 -e "select * from loja.categorias;"

Write-Host ""
Write-Host "=== produtos ==="
docker exec mysql-db mysql -uroot -proot123 -e "select * from loja.produtos;"