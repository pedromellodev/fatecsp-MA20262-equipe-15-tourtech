//fTurismo
let
    FonteBruta = cad_Etapa2{[Item="fTurismo", Kind="Sheet"]}[Data],
    Fonte = Table.PromoteHeaders(
        FonteBruta,        [PromoteAllScalars=true]
    ),
    JunçãoCalendario = Table.NestedJoin(
        Fonte, {"ID_Calendario"},
        dCalendario_Fonte, {"ID_Calendario"},
        "Calendario", JoinKind.LeftOuter
    ),
    ExpandirData = Table.ExpandTableColumn(
        JunçãoCalendario, "Calendario",
        {"Data"}, {"Data"}
    ),
    Tipos = Table.TransformColumnTypes(
        ExpandirData, {{"Data", type date}}
    )
in
    Tipos
