// dHospedagem
let
 Fonte = cad_Etapa2{[Item="dHospedagem", Kind="Table"]}[Data],
 Tipos = Table.TransformColumnTypes(Fonte, {
 {"ID_Hospedagem", type text},
 {"Tipo_de_Hospedagem", type text},
 {"ID_Localidade", type text},
 {"Capacidade", Int64.Type}
 })
in
 Tipos

