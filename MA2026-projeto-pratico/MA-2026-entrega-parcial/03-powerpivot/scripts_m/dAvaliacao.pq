// dAvaliacao
let
 Fonte = cad_Etapa2{[Item="dAvaliacao", Kind="Table"]}[Data],
 Tipos = Table.TransformColumnTypes(Fonte, {
 {"ID_Avaliacao", type text},
 {"Nota", type number},
 {"Classificação", type text},
 {"Periodo", type text},
 {"Origem_da_Avaliação", type text}
 })
in
 Tipos

