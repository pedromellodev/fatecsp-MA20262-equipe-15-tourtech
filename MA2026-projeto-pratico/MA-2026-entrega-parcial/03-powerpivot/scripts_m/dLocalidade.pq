// dLocalidade
let
 Fonte = cad_Etapa2{[Item="dLocalidade", Kind="Table"]}[Data],
 Tipos = Table.TransformColumnTypes(Fonte, {
 {"ID_Localidade", type text},
 {"Destino", type text},
 {"Município", type text},
 {"Regiao", type text}
 })
in
 Tipos
