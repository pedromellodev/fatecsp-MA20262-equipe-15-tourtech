// fTurismo_FonteCSV
let
 Binario = File.Contents(pArquivoFatoCSV),
 CSV = Csv.Document(
 Binario,
 [Delimiter=";", Encoding=65001, QuoteStyle=QuoteStyle.Csv]
 ),
 Cabecalhos = Table.PromoteHeaders(
 CSV, [PromoteAllScalars=true]
 ),
 Tipos = Table.TransformColumnTypes(Cabecalhos, {
 {"ID_Registro", type text},
 {"ID_Calendario", type text},
 {"ID_Localidade", type text},
 {"ID_Hospedagem", type text},
 {"ID_Evento", type text},
 {"ID_Avaliacao", type text},
 {"Quantidade_de_Visitantes", Int64.Type},
 {"Quantidade_de_Ocupantes", Int64.Type},
 {"Capacidade_Disponivel", Int64.Type},
 {"Taxa_de_Ocupacao", type number},
 {"Quantidade_de_Avaliacoes", Int64.Type}
 })
in
 Tipos

