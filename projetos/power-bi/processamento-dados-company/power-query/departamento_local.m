let
    Fonte = MySQL.Database("SEU_SERVIDOR.mysql.database.azure.com", "azure_company"),
    Department = Fonte{[Schema="azure_company", Item="departament"]}[Data],
    Locations = Fonte{[Schema="azure_company", Item="dept_locations"]}[Data],
    Mescla = Table.NestedJoin(Department, {"Dnumber"}, Locations, {"Dnumber"}, "Locations", JoinKind.Inner),
    Expande = Table.ExpandTableColumn(Mescla, "Locations", {"Dlocation"}, {"Dlocation"}),
    ChaveLegivel = Table.AddColumn(Expande, "Department_location", each [Dname] & " - " & [Dlocation], type text),
    Resultado = Table.SelectColumns(ChaveLegivel, {"Dnumber", "Dname", "Dlocation", "Department_location"})
in
    Resultado
