// Conf_Reconciliacao
let
    Lidas = Table.RowCount(stg_Fato_Bruto),
    Aceitas = Table.RowCount(fTurismo),
    Rejeitadas = Table.RowCount(Rejeitados),
    Resultado =
        if Lidas = 0 then
            #table(
                type table [Indicador = text, Linhas = nullable number, Status = text],
                {
                    {"Linhas lidas", null, "Pendente — fonte da fato sem registros"},
                    {"Linhas aceitas", null, "Pendente — fonte da fato sem registros"},
                    {"Linhas rejeitadas", null, "Pendente — fonte da fato sem registros"},
                    {"Diferença", null, "Pendente — não calculável"}
                }
            )
        else
            #table(
                type table [Indicador = text, Linhas = nullable number, Status = text],
                {
                    {"Linhas lidas", Lidas, "Calculado"},
                    {"Linhas aceitas", Aceitas, "Calculado"},
                    {"Linhas rejeitadas", Rejeitadas, "Calculado"},
                    {"Diferença", Lidas - Aceitas - Rejeitadas,
                        if Lidas - Aceitas - Rejeitadas = 0 then "OK" else "Verificar"}
                }
            )
in
    Resultado
