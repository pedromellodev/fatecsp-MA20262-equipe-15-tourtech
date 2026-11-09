// cad_Hotelaria
let
 Fonte = cad_Etapa2{[Item="cad_Hotelaria", Kind="Table"]}[Data],
 Tipos = Table.TransformColumnTypes(Fonte, {
 {"ID_Hotelaria", type text},
 {"CNPJ", type text},
 {"Nome", type text},
 {"Sobre", type text},
 {"Qtd_Visitantes_mensais", Int64.Type},
 {"Qtd_avaliações", type number},
 {"ID_Localidade", type text},
 {"ID_Hospedagem", type text},
 {"ID_Avaliacao", type text}
 })
in
 Tipos

