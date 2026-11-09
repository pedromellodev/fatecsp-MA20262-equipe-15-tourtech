// Conf_Chaves
let
    Checar = (Tabela as table, NomeTabela as text, ColunaChave as text) as table =>
        let
            Agrupado = Table.Group(Tabela, {ColunaChave}, {{"Quantidade", each Table.RowCount(_), Int64.Type}}),
            Problemas = Table.SelectRows(Agrupado, each Record.Field(_, ColunaChave) = null or Record.Field(_, "Quantidade") > 1),
            Nome = Table.AddColumn(Problemas, "Tabela", each NomeTabela, type text),
            Renomeia = Table.RenameColumns(Nome, {{ColunaChave, "Chave"}}),
            Seleciona = Table.SelectColumns(Renomeia, {"Tabela", "Chave", "Quantidade"})
        in Seleciona,
    Resultado = Table.Combine({
        Checar(dLocalidade, "dLocalidade", "ID_Localidade"),
        Checar(dHospedagem, "dHospedagem", "ID_Hospedagem"),
        Checar(dEventos, "dEventos", "ID_Evento"),
        Checar(dAvaliacao, "dAvaliacao", "ID_Avaliacao"),
        Checar(dCalendario, "dCalendario", "ID_Calendario")
    })
in
    Resultado
