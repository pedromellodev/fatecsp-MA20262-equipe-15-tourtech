// Rejeitados
let
    Fonte = stg_Fato_Bruto,
    Grupos = Table.Group(Fonte, {"ID_Registro"}, {{"Qtd", each Table.RowCount(_), Int64.Type}}),
    IDsDuplicados = Table.SelectRows(Grupos, each [ID_Registro] <> null and [Qtd] > 1)[ID_Registro],
    ComProblema = Table.AddColumn(Fonte, "Problema", each fnProblemasFato(_, IDsDuplicados), type text),
    ApenasRejeitados = Table.SelectRows(ComProblema, each [Problema] <> "")
in
    ApenasRejeitados
