// dEventos
let
    Fonte = Excel.CurrentWorkbook(){[Name="Fonte_Eventos"]}[Content],
    Textos = Table.TransformColumns(Fonte, {
        {"ID_Evento", each if _ = null then null else Text.Trim(Text.From(_)), type text},
        {"Nome", each if _ = null then null else fnLimparTexto(Text.From(_)), type text},
        {"Tipo", each if _ = null then null else Text.Proper(fnLimparTexto(Text.From(_))), type text},
        {"ID_Localidade", each if _ = null then null else Text.Trim(Text.From(_)), type text}
    }),
    NomeCorrigido = Table.TransformColumns(Textos, {
        {"Nome", each if _ = null then null else Text.Replace(_, "camarao", "camarão"), type text}
    }),
    Tipos = Table.TransformColumnTypes(NomeCorrigido, {{"Data_Inicio", type date}, {"Data_Fim", type date}}, "pt-BR")
in
    Tipos
