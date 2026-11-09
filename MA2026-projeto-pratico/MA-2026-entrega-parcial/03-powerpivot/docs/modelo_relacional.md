Modelo relacional — TourTech_03_PowerPivot.xlsx

1. Origem dos dados

A origem principal dos dados utilizados na Etapa 3 é o arquivo TourTech_02_PowerQuery.xlsx, desenvolvido na Etapa 2 do projeto.

As tabelas dimensionais foram obtidas por meio da consulta cad_Etapa2. A tabela fato fTurismo foi carregada a partir da planilha de mesmo nome presente no arquivo da Etapa 2, contendo 20 registros. A coluna Data foi incorporada por meio do relacionamento entre ID_Calendario e a consulta dCalendario_Fonte.

2. Descrição das tabelas

fTurismo: tabela fato que armazena os registros de observação turística, contendo informações sobre visitantes, ocupantes, capacidade disponível, taxa de ocupação e quantidade de avaliações.

dLocalidade: dimensão que contém informações sobre os destinos e localidades.

dHospedagem: dimensão que contém informações sobre os tipos de hospedagem.

dEventos: dimensão que contém informações sobre os eventos.

dAvaliacao: dimensão que contém informações sobre as notas e avaliações.

dCalendario: dimensão temporal com datas diárias e contínuas, contendo atributos de ano, número do mês, mês, trimestre, AnoMes e período/sazonalidade.

Rejeitados: tabela de auditoria que armazena os registros rejeitados durante o processo de tratamento dos dados.

cad_Hotelaria: tabela auxiliar de cadastro hoteleiro, mantida fora dos relacionamentos do modelo por não existir a chave ID_Hotelaria na tabela fato.

3. Granularidade da tabela fato

Cada linha de fTurismo representa um registro individual de observação turística, identificado por ID_Registro e associado a um calendário, uma localidade, uma hospedagem, um evento e uma avaliação.

A granularidade corresponde, portanto, a um registro por combinação de identificadores das dimensões, conforme a estrutura dos dados disponibilizados. O identificador ID_Registro individualiza cada observação da tabela fato.

4. Chaves primárias e estrangeiras

Chaves primárias (PK)

dLocalidade[ID_Localidade]

dHospedagem[ID_Hospedagem]

dEventos[ID_Evento]

dAvaliacao[ID_Avaliacao]

dCalendario[Data]

Chaves estrangeiras (FK)

fTurismo[ID_Localidade]

fTurismo[ID_Hospedagem]

fTurismo[ID_Evento]

fTurismo[ID_Avaliacao]

fTurismo[Data]

A coluna fTurismo[ID_Registro] identifica individualmente os registros da tabela fato.

5. Relacionamentos

O modelo possui cinco relacionamentos ativos, todos do tipo muitos para um (*:1), com a tabela fato no lado muitos e as dimensões no lado um.

fTurismo[ID_Localidade] → dLocalidade[ID_Localidade]

fTurismo[ID_Hospedagem] → dHospedagem[ID_Hospedagem]

fTurismo[ID_Evento] → dEventos[ID_Evento]

fTurismo[ID_Avaliacao] → dAvaliacao[ID_Avaliacao]

fTurismo[Data] → dCalendario[Data]

A direção de filtragem ocorre das dimensões para a tabela fato.

6. Regra do calendário

A dimensão dCalendario possui uma linha para cada dia, sem lacunas entre a menor e a maior data identificada na fonte.

Sua construção considera o intervalo entre o primeiro dia do mês da menor data e o último dia do mês da maior data de dCalendario_Fonte.

A tabela contém os atributos:

Data

Ano

MesNumero

Mês

Trimestre

AnoMes

Período/Sazionalidade

A coluna Data possui tipo de dados data, sem valores em branco ou duplicados, e é utilizada como chave primária da dimensão e chave estrangeira na tabela fato.

7. Medidas DAX criadas

As medidas foram armazenadas na tabela fTurismo.

7.1 Indicadores de turismo

Total de Visitantes: soma da quantidade de visitantes.

Total de Ocupantes: soma da quantidade de ocupantes.

Capacidade Disponível: soma da capacidade disponível.

Total de Avaliações: soma da quantidade de avaliações.

Quantidade de Registros: contagem distinta dos identificadores de registro.

Visitantes por Registro: divisão do total de visitantes pela quantidade de registros.

Taxa de Ocupação: divisão do total de ocupantes pela capacidade disponível.

Nota Média Ponderada: média das notas ponderada pela quantidade de avaliações.

7.2 Medidas de conferência e integridade

Conf Linhas Fato: quantidade de linhas da tabela fato.

Conf Linhas Rejeitados: quantidade de linhas da tabela Rejeitados.

Conf Linhas Classificadas: soma das linhas da fato e das rejeitadas.

Conf Fato sem Localidade: quantidade de registros sem correspondência na dimensão de localidades.

Conf Fato sem Hospedagem: quantidade de registros sem correspondência na dimensão de hospedagens.

Conf Fato sem Evento: quantidade de registros sem correspondência na dimensão de eventos.

Conf Fato sem Avaliacao: quantidade de registros sem correspondência na dimensão de avaliações.

Conf Fato sem Data: quantidade de registros sem correspondência na dimensão calendário.

Conf PK Duplicada: quantidade de duplicidades identificadas nas chaves primárias das dimensões.

8. Limitações

A análise dos indicadores está condicionada à estrutura e à abrangência dos 20 registros disponibilizados na planilha fTurismo.

A tabela cad_Hotelaria permanece auxiliar, sem relacionamento com a tabela fato, devido à ausência da chave ID_Hotelaria.

A interpretação dos indicadores depende da consistência dos dados e da ausência de duplicidade de observações.

A reconciliação entre registros lidos, aceitos e rejeitados depende da correspondência entre as fontes e os resultados do tratamento realizado na Etapa 2.

9. Divergência entre README/CSV e planilha da Etapa 2

Foi identificada uma divergência entre os arquivos disponibilizados para o projeto:

O README e o arquivo dados_limpos/fTurismo.csv indicam que a fonte da tabela fato não foi fornecida. O CSV contém somente os cabeçalhos, sem registros.

O arquivo TourTech_02_PowerQuery.xlsx, entretanto, apresenta uma planilha denominada fTurismo com 20 registros.

Para a construção do modelo da Etapa 3, foi adotada a planilha fTurismo da Etapa 2 como fonte da tabela fato, utilizando seus 20 registros. O CSV vazio não foi utilizado como fonte da fato.

Dessa forma, o modelo relacional da Etapa 3 foi construído com base nos registros disponíveis na planilha da Etapa 2, mantendo documentada a divergência em relação ao README e ao CSV disponibilizado.