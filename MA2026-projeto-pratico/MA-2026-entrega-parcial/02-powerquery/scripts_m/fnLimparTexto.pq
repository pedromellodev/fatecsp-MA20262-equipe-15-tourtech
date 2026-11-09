// fnLimparTexto
(texto as nullable text) as nullable text =>
if texto = null then null
else Text.Combine(List.Select(Text.Split(Text.Trim(texto), " "), each _ <> ""), " ")
