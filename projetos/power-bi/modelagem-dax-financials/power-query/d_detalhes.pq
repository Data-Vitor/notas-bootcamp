let
    Fonte = financials_origem,
    Colunas = Table.SelectColumns(Fonte, {"Segment", "Country"}),
    Unicos = Table.Distinct(Colunas),
    Ordenado = Table.Sort(Unicos, {{"Segment", Order.Ascending}, {"Country", Order.Ascending}}),
    IDDetalhe = Table.AddIndexColumn(Ordenado, "ID_Detalhe", 1, 1, Int64.Type),
    Resultado = Table.ReorderColumns(IDDetalhe, {"ID_Detalhe", "Segment", "Country"})
in
    Resultado
