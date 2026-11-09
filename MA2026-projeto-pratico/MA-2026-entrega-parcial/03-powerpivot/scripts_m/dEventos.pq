// dEventos
let
 Fonte = cad_Etapa2{[Item="dEventos", Kind="Table"]}[Data],
 Tipos = Table.TransformColumnTypes(Fonte, {
 {"ID_Evento", type text},
 {"Nome", type text},
 {"Tipo", type text},
 {"ID_Localidade", type text},
 {"Data_Inicio", type date},
 {"Data_Fim", type date}
 })
in
 Tipos

