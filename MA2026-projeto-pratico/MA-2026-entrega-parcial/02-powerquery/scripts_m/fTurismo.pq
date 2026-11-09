// fTurismo
let
    Fonte = stg_Fato_Bruto,
    Grupos = Table.Group(Fonte, {"ID_Registro"}, {{"Qtd", each Table.RowCount(_), Int64.Type}}),
    IDsDuplicados = Table.SelectRows(Grupos, each [ID_Registro] <> null and [Qtd] > 1)[ID_Registro],
    ComProblema = Table.AddColumn(Fonte, "Problema", each fnProblemasFato(_, IDsDuplicados), type text),
    ApenasAceitos = Table.SelectRows(ComProblema, each [Problema] = ""),
    Saida = Table.SelectColumns(ApenasAceitos, {
        "ID_Registro","ID_Calendario","ID_Localidade","ID_Hospedagem","ID_Evento","ID_Avaliacao",
        "Quantidade_de_Visitantes","Quantidade_de_Ocupantes","Capacidade_Disponivel",
        "Taxa_de_Ocupacao","Quantidade_de_Avaliacoes"
    })
in
    Saida
