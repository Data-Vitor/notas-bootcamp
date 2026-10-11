let
    Fonte = financials_origem,
    DetalheProduto = Table.NestedJoin(
        Fonte,
        {"ID_Produto", "Discount Band", "Sale Price", "Manufacturing Price"},
        D_Produtos_Detalhes,
        {"ID_Produto", "Discount Band", "Sale Price", "Manufacturing Price"},
        "ProdutoDetalhe",
        JoinKind.LeftOuter
    ),
    ExpandeProdutoDetalhe = Table.ExpandTableColumn(DetalheProduto, "ProdutoDetalhe", {"ID_Produto_Detalhe"}),
    Desconto = Table.NestedJoin(
        ExpandeProdutoDetalhe,
        {"ID_Produto", "Discounts", "Discount Band"},
        D_Descontos,
        {"ID_Produto", "Discount", "Discount Band"},
        "Desconto",
        JoinKind.LeftOuter
    ),
    ExpandeDesconto = Table.ExpandTableColumn(Desconto, "Desconto", {"ID_Desconto"}),
    Detalhe = Table.NestedJoin(
        ExpandeDesconto,
        {"Segment", "Country"},
        D_Detalhes,
        {"Segment", "Country"},
        "Detalhe",
        JoinKind.LeftOuter
    ),
    ExpandeDetalhe = Table.ExpandTableColumn(Detalhe, "Detalhe", {"ID_Detalhe"}),
    Colunas = Table.SelectColumns(
        ExpandeDetalhe,
        {"SK_ID", "ID_Produto", "ID_Produto_Detalhe", "ID_Desconto", "ID_Detalhe", "Product", "Units Sold", "Sale Price", "Discount Band", "Segment", "Country", "Sales", "Profit", "Date"}
    ),
    Resultado = Table.RenameColumns(Colunas, {{"Product", "Produto"}})
in
    Resultado
