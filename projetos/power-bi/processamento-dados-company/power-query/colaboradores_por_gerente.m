let
    Fonte = Employee_Tratado,
    Agrupado = Table.Group(Fonte, {"Manager_name"}, {{"Employee_count", each Table.RowCount(_), Int64.Type}}),
    Ordenado = Table.Sort(Agrupado, {{"Employee_count", Order.Descending}, {"Manager_name", Order.Ascending}})
in
    Ordenado
