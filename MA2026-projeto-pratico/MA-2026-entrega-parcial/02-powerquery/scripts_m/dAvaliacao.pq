// dAvaliacao
let
    Fonte = Excel.CurrentWorkbook(){[Name="Fonte_Avaliacao"]}[Content],
    Textos = Table.TransformColumns(Fonte, {
        {"ID_Avaliacao", each if _ = null then null else Text.Trim(Text.From(_)), type text},
        {"Classificação", each Text.Proper(fnLimparTexto(if _ = null then null else Text.From(_))), type text},
        {"Periodo", each if _ = null then null else Text.Trim(Text.From(_)), type text},
        {"Origem_da_Avaliação", each if _ = null then null else Text.Trim(Text.From(_)), type text}
    }),
    Tipos = Table.TransformColumnTypes(Textos, {{"Nota", type number}}, "pt-BR")
in
    Tipos
