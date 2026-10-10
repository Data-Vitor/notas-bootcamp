let
    Fonte = MySQL.Database("SEU_SERVIDOR.mysql.database.azure.com", "azure_company"),
    Employee = Fonte{[Schema="azure_company", Item="employee"]}[Data],
    Tipos = Table.TransformColumnTypes(Employee, {
        {"Ssn", type text}, {"Fname", type text}, {"Minit", type text},
        {"Lname", type text}, {"Bdate", type date}, {"Address", type text},
        {"Sex", type text}, {"Salary", Currency.Type},
        {"Super_ssn", type text}, {"Dno", Int64.Type}
    }),
    NomeCompleto = Table.AddColumn(Tipos, "Employee_name", each
        Text.Combine(List.Select({[Fname], [Minit], [Lname]}, each _ <> null and _ <> ""), " "), type text),
    PartesEndereco = Table.AddColumn(NomeCompleto, "Address_parts", each Text.Split([Address], "-")),
    Numero = Table.AddColumn(PartesEndereco, "House_number", each List.First([Address_parts]), type text),
    Estado = Table.AddColumn(Numero, "State", each List.Last([Address_parts]), type text),
    Cidade = Table.AddColumn(Estado, "City", each List.Reverse([Address_parts]){1}, type text),
    Rua = Table.AddColumn(Cidade, "Street", each Text.Combine(List.Range([Address_parts], 1, List.Count([Address_parts]) - 3), "-"), type text),
    Department = Fonte{[Schema="azure_company", Item="departament"]}[Data],
    MesclaDepartamento = Table.NestedJoin(Rua, {"Dno"}, Department, {"Dnumber"}, "Department", JoinKind.LeftOuter),
    ExpandeDepartamento = Table.ExpandTableColumn(MesclaDepartamento, "Department", {"Dnumber", "Dname"}, {"Dnumber", "Department"}),
    MesclaGerente = Table.NestedJoin(ExpandeDepartamento, {"Super_ssn"}, NomeCompleto, {"Ssn"}, "Manager", JoinKind.LeftOuter),
    ExpandeGerente = Table.ExpandTableColumn(MesclaGerente, "Manager", {"Employee_name"}, {"Manager_name"}),
    GerenteNulo = Table.ReplaceValue(ExpandeGerente, null, "Sem gerente", Replacer.ReplaceValue, {"Manager_name"}),
    Resultado = Table.SelectColumns(GerenteNulo, {
        "Ssn", "Employee_name", "Bdate", "House_number", "Street", "City", "State",
        "Sex", "Salary", "Dnumber", "Department", "Manager_name"
    })
in
    Resultado
