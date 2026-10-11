let
    Fonte = financials_origem,
    Agrupado = Table.Group(
        Fonte,
        {"Product"},
        {
            {"Media_Unidades_Vendidas", each List.Average([Units Sold]), type number},
            {"Media_Valor_Venda", each List.Average([Sale Price]), Currency.Type},
            {"Mediana_Valor_Venda", each List.Median([Sale Price]), Currency.Type},
            {"Valor_Maximo_Venda", each List.Max([Sale Price]), Currency.Type},
            {"Valor_Minimo_Venda", each List.Min([Sale Price]), Currency.Type}
        }
    ),
    Ordenado = Table.Sort(Agrupado, {{"Product", Order.Ascending}}),
    IDProduto = Table.AddIndexColumn(Ordenado, "ID_Produto", 1, 1, Int64.Type),
    Colunas = Table.ReorderColumns(
        IDProduto,
        {"ID_Produto", "Product", "Media_Unidades_Vendidas", "Media_Valor_Venda", "Mediana_Valor_Venda", "Valor_Maximo_Venda", "Valor_Minimo_Venda"}
    ),
    Renomeado = Table.RenameColumns(Colunas, {{"Product", "Produto"}})
in
    Renomeado
