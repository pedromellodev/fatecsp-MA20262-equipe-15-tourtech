// stg_Fato_Bruto
let
    Fonte = Excel.CurrentWorkbook(){[Name="Fonte_FatoTurismo"]}[Content],
    Tipos = Table.TransformColumnTypes(Fonte, {
        {"ID_Registro", type text}, {"ID_Calendario", type text},
        {"ID_Localidade", type text}, {"ID_Hospedagem", type text},
        {"ID_Evento", type text}, {"ID_Avaliacao", type text},
        {"Quantidade_de_Visitantes", Int64.Type},
        {"Quantidade_de_Ocupantes", Int64.Type},
        {"Capacidade_Disponivel", Int64.Type},
        {"Taxa_de_Ocupacao", type number},
        {"Quantidade_de_Avaliacoes", Int64.Type}
    }, "pt-BR"),
    ComLinha = Table.AddIndexColumn(Tipos, "Linha_Origem", 1, 1, Int64.Type)
in
    ComLinha
