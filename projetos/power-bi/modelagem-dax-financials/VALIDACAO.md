# Validação

Validação executada antes da entrega:

- origem oficial preservada sem alterações;
- 700 registros carregados na fato;
- chaves de produto, detalhe, desconto, mercado e data sem órfãos;
- cinco relacionamentos ativos, `1:*` e com filtro único;
- `Financials_origem` oculta no modelo;
- totais comparados com a planilha original;
- workbook de conferência aberto e renderizado sem erros.

Totais de controle:

| Indicador | Resultado |
|---|---:|
| Linhas | 700 |
| Produtos | 6 |
| Vendas | 118.726.350,26 |
| Lucro | 16.893.702,26 |
| Chaves órfãs | 0 |
