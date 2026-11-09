// dCalendario
let
    Fonte = Excel.CurrentWorkbook(){[Name="Fonte_Calendario"]}[Content],
    Renomeada = Table.RenameColumns(Fonte, {{"ID_Calendário", "ID_Calendario"}}),
    Textos = Table.TransformColumns(Renomeada, {
        {"ID_Calendario", each if _ = null then null else Text.Trim(Text.From(_)), type text},
        {"Mês", each Text.Proper(fnLimparTexto(if _ = null then null else Text.From(_))), type text},
        {"Trimestre", each if _ = null then null else Text.Trim(Text.From(_)), type text},
        {"Período/Sazionalidade", each Text.Proper(fnLimparTexto(if _ = null then null else Text.From(_))), type text}
    }),
    Tipos = Table.TransformColumnTypes(Textos, {{"Data", type date}, {"Ano", Int64.Type}}, "pt-BR")
in
    Tipos
