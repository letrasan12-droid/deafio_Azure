# Desafio: Azure MySQL + Power BI + Power Query (by Manoel)

Este pacote contém **tudo** para você subir uma base MySQL no Azure, popular dados,
conectar no Power BI e transformar no Power Query.

## Conteúdo
- `deploy_mysql_flexible_server.sh` — Script **Azure CLI** para criar o servidor MySQL Flexible Server e o database `desafio_powerbi`.
- `mysql_schema.sql` — Criação de tabelas (`clientes`, `produtos`, `vendas`).
- `mysql_seed.sql` — Inserts com ~200 clientes, ~30+ produtos e 5.000 vendas (dados sintéticos).
- `data/*.csv` — As mesmas entidades em CSV (fonte aberta).
- `power_query_m__*.txt` — Scripts **Power Query (M)** para conectar, tipar, mesclar e calcular Faturamento.
- `dax_measures.txt` — Medidas DAX prontas.
- `mysql_desafio.pbids` — Arquivo de conexão Power BI (abre o Desktop já apontando para o servidor e database).
- `azure_resource_graph_queries.kql` — Exemplos de consultas no **Azure Resource Graph**.

## Passo a passo (resumo)
1. **Crie o servidor** executando `deploy_mysql_flexible_server.sh` (altere `RESOURCE_GROUP`, `SERVER_NAME`, `ADMIN_*` e `PUBLIC_ACCESS_IP`).
2. **Carregue o schema** e os **dados** (use `mysql` CLI ou MySQL Workbench):
   - `SOURCE mysql_schema.sql;`
   - `SOURCE mysql_seed.sql;`
3. **Power BI Desktop**:
   - Abra `mysql_desafio.pbids` e informe usuário/senha (autenticação **Database**).
   - No **Power Query**, cole os scripts de `power_query_m__*.txt` conforme instruções.
   - Carregue e publique o relatório.
4. **Atualização agendada** (opcional): use gateway **Standard** com MySQL Connector/NET instalado no host.

## Observações
- Para a conexão Power BI ↔ MySQL, instale o **MySQL Connector/NET** no computador (e no servidor de gateway, se usar refresh). 
- O conector MySQL **não é suportado** no gateway **Personal Mode** — use o **Standard**.
- Em Azure, bancos MySQL aparecem como recursos `Microsoft.DBforMySQL/flexibleServers` (servidor) e `.../flexibleServers/databases` (database).

Boa análise! :)
