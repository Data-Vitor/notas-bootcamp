let
    Fonte = financials_origem,
    Colunas = Table.SelectColumns(Fonte, {"ID_Produto", "Discount Band", "Sale Price", "Units Sold", "Manufacturing Price"}),
    Agrupado = Table.Group(
        Colunas,
        {"ID_Produto", "Discount Band", "Sale Price", "Manufacturing Price"},
        {{"Units Sold", each List.Average([Units Sold]), type number}}
    ),
    Ordenado = Table.Sort(Agrupado, {{"ID_Produto", Order.Ascending}, {"Discount Band", Order.Ascending}, {"Sale Price", Order.Ascending}}),
    IDDetalhe = Table.AddIndexColumn(Ordenado, "ID_Produto_Detalhe", 1, 1, Int64.Type),
    Resultado = Table.ReorderColumns(IDDetalhe, {"ID_Produto_Detalhe", "ID_Produto", "Discount Band", "Sale Price", "Units Sold", "Manufacturing Price"})
in
    Resultado
