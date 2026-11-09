// Conf_CNPJ
let
    Fonte = cad_Hotelaria,
    Agrupado = Table.Group(Fonte, {"CNPJ"}, {{"Quantidade", each Table.RowCount(_), Int64.Type}, {"IDs", each Text.Combine(List.Transform([ID_Hotelaria], Text.From), " / "), type text}}),
    Duplicados = Table.SelectRows(Agrupado, each [CNPJ] <> null and [CNPJ] <> "" and [Quantidade] > 1)
in
    Duplicados
