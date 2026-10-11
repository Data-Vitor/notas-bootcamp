let
    Fonte = Excel.Workbook(File.Contents(CaminhoArquivo), null, true),
    Dados = Fonte{[Item="financials", Kind="Table"]}[Data],
    Cabecalhos = Table.TransformColumnNames(Dados, Text.Trim),
    Tipos = Table.TransformColumnTypes(
        Cabecalhos,
        {
            {"Segment", type text}, {"Country", type text}, {"Product", type text},
            {"Discount Band", type text}, {"Units Sold", type number},
            {"Manufacturing Price", Currency.Type}, {"Sale Price", Currency.Type},
            {"Gross Sales", Currency.Type}, {"Discounts", Currency.Type},
            {"Sales", Currency.Type}, {"COGS", Currency.Type}, {"Profit", Currency.Type},
            {"Date", type date}, {"Month Number", Int64.Type},
            {"Month Name", type text}, {"Year", Int64.Type}
        },
        "en-US"
    ),
    SK = Table.AddIndexColumn(Tipos, "SK_ID", 1, 1, Int64.Type),
    IDProduto = Table.AddColumn(
        SK,
        "ID_Produto",
        each if [Product] = "Amarilla" then 1
        else if [Product] = "Carretera" then 2
        else if [Product] = "Montana" then 3
        else if [Product] = "Paseo" then 4
        else if [Product] = "VTT" then 5
        else if [Product] = "Velo" then 6
        else null,
        Int64.Type
    )
in
    IDProduto
