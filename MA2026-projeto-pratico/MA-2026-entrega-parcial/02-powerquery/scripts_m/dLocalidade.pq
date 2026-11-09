// dLocalidade
let
    Fonte = Excel.CurrentWorkbook(){[Name="Fonte_Localidade"]}[Content],
    Textos = Table.TransformColumns(Fonte, {
        {"ID_Localidade", each if _ = null then null else Text.Trim(Text.From(_)), type text},
        {"Destino", each fnLimparTexto(if _ = null then null else Text.From(_)), type text},
        {"Município", each fnLimparTexto(if _ = null then null else Text.From(_)), type text},
        {"Regiao", each fnLimparTexto(if _ = null then null else Text.From(_)), type text}
    })
in
    Textos
