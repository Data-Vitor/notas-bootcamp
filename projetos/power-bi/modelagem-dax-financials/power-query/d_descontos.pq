let
    Fonte = financials_origem,
    Colunas = Table.SelectColumns(Fonte, {"ID_Produto", "Discounts", "Discount Band"}),
    Renomeado = Table.RenameColumns(Colunas, {{"Discounts", "Discount"}}),
    Unicos = Table.Distinct(Renomeado),
    Ordenado = Table.Sort(Unicos, {{"ID_Produto", Order.Ascending}, {"Discount Band", Order.Ascending}, {"Discount", Order.Ascending}}),
    IDDesconto = Table.AddIndexColumn(Ordenado, "ID_Desconto", 1, 1, Int64.Type),
    Resultado = Table.ReorderColumns(IDDesconto, {"ID_Desconto", "ID_Produto", "Discount", "Discount Band"})
in
    Resultado
