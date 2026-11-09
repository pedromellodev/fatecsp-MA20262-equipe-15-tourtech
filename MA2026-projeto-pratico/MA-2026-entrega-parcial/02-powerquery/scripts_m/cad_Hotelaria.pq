// cad_Hotelaria
let
    Fonte = Excel.CurrentWorkbook(){[Name="Fonte_Hotelaria"]}[Content],
    Textos = Table.TransformColumns(Fonte, {
        {"ID_Hotelaria", each if _ = null then null else Text.Trim(Text.From(_)), type text},
        {"Nome", each if _ = null then null else Text.Proper(fnLimparTexto(Text.From(_))), type text},
        {"Sobre", each if _ = null then null else fnLimparTexto(Text.From(_)), type text},
        {"CNPJ", each if _ = null then null else Text.Select(Text.From(_), {"0".."9"}), type text}
    }),
    DescricaoCorrigida = Table.TransformColumns(Textos, {
        {"Sobre", each if _ = null then null else Text.Replace(_, "mergulho, mergulho", "mergulho"), type text},
        {"Nome", each if _ = null then null else Text.Replace(_, "Porto Das Águas", "Porto das Águas"), type text}
    }),
    Visitantes = Table.TransformColumns(DescricaoCorrigida, {
        {"Qtd_Visitantes_mensais", each try Int64.From(Number.FromText(Text.Select(Text.From(_), {"0".."9"}), "pt-BR")) otherwise null, Int64.Type},
        {"Qtd_avaliações", each try Number.FromText(Text.Replace(Text.From(_), ",", "."), "en-US") otherwise null, type number}
    })
in
    Visitantes
