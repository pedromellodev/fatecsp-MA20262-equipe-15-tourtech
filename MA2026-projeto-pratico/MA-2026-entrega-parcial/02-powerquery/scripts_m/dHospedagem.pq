// dHospedagem
let
    Fonte = Excel.CurrentWorkbook(){[Name="Fonte_Hospedagem"]}[Content],
    Textos = Table.TransformColumns(Fonte, {
        {"ID_Hospedagem", each if _ = null then null else Text.Trim(Text.From(_)), type text},
        {"Tipo_de_Hospedagem", each fnLimparTexto(if _ = null then null else Text.From(_)), type text},
        {"ID_Localidade", each if _ = null then null else Text.Trim(Text.From(_)), type text}
    }),
    Tipos = Table.TransformColumnTypes(Textos, {{"Capacidade", Int64.Type}}, "pt-BR")
in
    Tipos
