// Conf_Motivos
let
    Fonte = Rejeitados,
    Agrupado = Table.Group(Fonte, {"Problema"}, {{"Quantidade", each Table.RowCount(_), Int64.Type}})
in
    Agrupado
