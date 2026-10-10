let
    Origem = Excel.Workbook(Web.Contents("https://go.microsoft.com/fwlink/?LinkID=521962"), null, true),
    #"Navegação 1" = Origem{[Item="financials",Kind="Table"]}[Data],
    #"Tipo de coluna alterado" =
        Table.AddColumn(
            Table.TransformColumnNames(
                Table.TransformColumnTypes(#"Navegação 1", {
                    {"Segment", type text}, {"Country", type text},
                    {"Product", type text}, {"Discount Band", type text},
                    {"Units Sold", type number},
                    {"Manufacturing Price", Currency.Type}, {"Sale Price", Currency.Type},
                    {"Gross Sales", Currency.Type}, {"Discounts", Currency.Type},
                    {" Sales", Currency.Type}, {"COGS", Currency.Type},
                    {"Profit", Currency.Type}, {"Date", type date},
                    {"Month Number", Int64.Type}, {"Month Name", type text},
                    {"Year", Int64.Type}
                }),
                Text.Trim
            ),
            "AnoMes", each Date.ToText([Date], "yyyy-MM"), type text
        )
in
    #"Tipo de coluna alterado"

