// dCalendario - calendário diário contínuo
let
 DatasFonte = dCalendario_Fonte[Data],
 Inicio = Date.StartOfMonth(List.Min(DatasFonte)),
 Fim = Date.EndOfMonth(List.Max(DatasFonte)),
 Lista = List.Dates(
 Inicio,
 Duration.Days(Fim - Inicio) + 1,
 #duration(1, 0, 0, 0)
 ),
 Base = Table.FromList(
 Lista, Splitter.SplitByNothing(), {"Data"}
 ),
 TipoData = Table.TransformColumnTypes(
 Base, {{"Data", type date}}
 ),
 AddAno = Table.AddColumn(
 TipoData, "Ano", each Date.Year([Data]), Int64.Type
 ),
 AddMesNumero = Table.AddColumn(
 AddAno, "MesNumero", each Date.Month([Data]), Int64.Type
 ),
 AddMes = Table.AddColumn(
 AddMesNumero, "Mês", each Date.MonthName([Data], "pt-BR"), type text
 ),
 AddTrimestre = Table.AddColumn(
 AddMes, "Trimestre",
 each Text.From(Date.QuarterOfYear([Data])) & "º trimestre",
 type text
 ),
 AddAnoMes = Table.AddColumn(
 AddTrimestre, "AnoMes",
 each Date.ToText([Data], "yyyy-MM"), type text
 ),
 Meses = Table.NestedJoin(
 AddAnoMes, {"AnoMes"},
 dCalendario_Fonte, {"AnoMes"},
 "MesFonte", JoinKind.LeftOuter
 ),
 Expandir = Table.ExpandTableColumn(
 Meses, "MesFonte",
 {"Período/Sazionalidade"},
 {"Período/Sazionalidade"}
 )
in
 Expandir
