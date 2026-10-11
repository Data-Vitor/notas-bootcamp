# Relacionamentos do modelo

| Dimensão | Coluna | Fato | Coluna | Cardinalidade | Direção |
|---|---|---|---|---|---|
| D_Produtos | ID_Produto | F_Vendas | ID_Produto | 1:* | Única |
| D_Produtos_Detalhes | ID_Produto_Detalhe | F_Vendas | ID_Produto_Detalhe | 1:* | Única |
| D_Descontos | ID_Desconto | F_Vendas | ID_Desconto | 1:* | Única |
| D_Detalhes | ID_Detalhe | F_Vendas | ID_Detalhe | 1:* | Única |
| D_Calendario | Date | F_Vendas | Date | 1:* | Única |

`Financials_origem` é apenas a cópia de segurança. Desative a carga ou oculte a tabela depois de conferir as consultas.
