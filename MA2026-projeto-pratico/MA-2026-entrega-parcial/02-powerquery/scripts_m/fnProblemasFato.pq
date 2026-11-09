// fnProblemasFato
(registro as record, idsDuplicados as list) as text =>
let
    ID = Record.FieldOrDefault(registro, "ID_Registro", null),
    Calendario = Record.FieldOrDefault(registro, "ID_Calendario", null),
    Localidade = Record.FieldOrDefault(registro, "ID_Localidade", null),
    Hospedagem = Record.FieldOrDefault(registro, "ID_Hospedagem", null),
    Evento = Record.FieldOrDefault(registro, "ID_Evento", null),
    Avaliacao = Record.FieldOrDefault(registro, "ID_Avaliacao", null),
    Visitantes = Record.FieldOrDefault(registro, "Quantidade_de_Visitantes", null),
    Ocupantes = Record.FieldOrDefault(registro, "Quantidade_de_Ocupantes", null),
    Capacidade = Record.FieldOrDefault(registro, "Capacidade_Disponivel", null),
    Taxa = Record.FieldOrDefault(registro, "Taxa_de_Ocupacao", null),
    Motivos = List.RemoveNulls({
        if ID = null or Text.Trim(Text.From(ID)) = "" then "ID_Registro vazio" else null,
        if ID <> null and List.Contains(idsDuplicados, ID) then "ID_Registro duplicado" else null,
        if Calendario = null or not List.Contains(dCalendario[ID_Calendario], Calendario) then "ID_Calendario sem correspondência" else null,
        if Localidade = null or not List.Contains(dLocalidade[ID_Localidade], Localidade) then "ID_Localidade sem correspondência" else null,
        if Hospedagem = null or not List.Contains(dHospedagem[ID_Hospedagem], Hospedagem) then "ID_Hospedagem sem correspondência" else null,
        if Evento <> null and Text.Trim(Text.From(Evento)) <> "" and not List.Contains(dEventos[ID_Evento], Evento) then "ID_Evento sem correspondência" else null,
        if Avaliacao <> null and Text.Trim(Text.From(Avaliacao)) <> "" and not List.Contains(dAvaliacao[ID_Avaliacao], Avaliacao) then "ID_Avaliacao sem correspondência" else null,
        if Visitantes <> null and Visitantes < 0 then "Quantidade de visitantes negativa" else null,
        if Ocupantes = null or Ocupantes < 0 then "Quantidade de ocupantes nula ou negativa" else null,
        if Capacidade = null or Capacidade <= 0 then "Capacidade inválida" else null,
        if Ocupantes <> null and Capacidade <> null and Capacidade > 0 and Ocupantes > Capacidade then "Ocupantes acima da capacidade" else null,
        if Taxa <> null and Capacidade <> null and Capacidade > 0 and Ocupantes <> null and Number.Abs(Taxa - (Ocupantes / Capacidade)) > 0.01 then "Taxa de ocupação divergente" else null
    })
in
    Text.Combine(Motivos, "; ")
