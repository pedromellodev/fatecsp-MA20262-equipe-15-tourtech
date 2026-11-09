// dCalendario_Fonte
let
 Fonte = cad_Etapa2{[Item="dCalendario", Kind="Table"]}[Data],
 Tipos = Table.TransformColumnTypes(Fonte, {
 {"ID_Calendario", type text},
 {"Data", type date},
 {"Mês", type text},
 {"Trimestre", type text},
 {"Ano", Int64.Type},
 {"Período/Sazionalidade", type text}
 }),
 AnoMes = Table.AddColumn(
 Tipos, "AnoMes",
 each Date.ToText([Data], "yyyy-MM"),
 type text
 )
in
 AnoMes

