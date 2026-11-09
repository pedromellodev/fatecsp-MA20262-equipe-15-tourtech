# TourTech — Etapa 2: Power Query

**Disciplina:** Microinformática Aplicada — ILP590  
**Instituição:** FATEC-SP  
**Equipe:** 15

## Arquivos

- `TourTech_02_PowerQuery.xlsx`: pasta de trabalho com fontes organizadas, tabelas de saída e pendências.
- `scripts_m/`: consultas e função em linguagem M para criar no Editor Avançado.
- `dados_limpos/fTurismo.csv`: cabeçalho da fato; não há registros da fato na fonte enviada.
- `evidencias/`: reservado para capturas feitas após executar as consultas no Excel.

## Fonte efetivamente utilizada

`TourTech_01_Excel_tratado(2).xlsx`, aba `Bruto`, com 20 registros em cada bloco de Hotelaria, Localidade, Hospedagem, Eventos, Avaliação e Calendário. As tabelas `Fonte_*` foram separadas dos blocos horizontais da aba bruta para que o Power Query trate os dados originais.

A aba `Bruto` permanece preservada na origem. As tabelas `Fonte_*` desta pasta de trabalho são cópias separadas dos blocos da aba `Bruto`, preservando os valores originais e permitindo que as consultas usem `Excel.CurrentWorkbook()` sem depender de caminhos locais externos. As abas `Orig_*` guardam cópias das quatro abas originais para rastreabilidade.

## Consultas M

Crie as consultas em uma pasta de trabalho Excel aberta usando **Dados → Obter Dados → Iniciar Editor do Power Query → Página Inicial → Nova Fonte → Consulta Nula → Editor Avançado**. Cole o conteúdo do arquivo `.pq` com o mesmo nome da consulta.

| Consulta | Finalidade |
|---|---|
| `stg_Fato_Bruto` | Estrutura de origem da fato, sem alterar a fonte |
| `fnLimparTexto` | Remove espaços extras |
| `fnProblemasFato` | Aplica as regras de validação da tabela fato |
| `cad_Hotelaria` | Cadastro auxiliar de hotelaria; CNPJ e visitantes normalizados |
| `dLocalidade` | Dimensão de destinos, municípios e regiões |
| `dHospedagem` | Dimensão de tipos e capacidade de hospedagem |
| `dEventos` | Dimensão de eventos e datas |
| `dAvaliacao` | Dimensão de avaliações |
| `dCalendario` | Dimensão de calendário e sazonalidade |
| `fTurismo` | Fato de visitantes e ocupação |
| `Rejeitados` | Registros da fato que não passaram nas validações |
| `Conf_Reconciliacao` | Lidas, aceitas, rejeitadas e diferença |
| `Conf_Motivos` | Contagem por motivo de rejeição |
| `Conf_Chaves` | Chaves primárias nulas ou duplicadas nas dimensões |
| `Conf_CNPJ` | CNPJ duplicado após normalização |

## Carga sugerida

- Carregar como tabelas: `cad_Hotelaria`, `dLocalidade`, `dHospedagem`, `dEventos`, `dAvaliacao`, `dCalendario`, `fTurismo`, `Rejeitados`.
- Manter como somente conexão: `stg_Fato_Bruto`, `fnLimparTexto`, `Conf_Reconciliacao`, `Conf_Motivos`, `Conf_Chaves`, `Conf_CNPJ` (as consultas de conferência podem ser carregadas em uma aba `Conferencia` quando forem executadas).
- Não adicionar ao Modelo de Dados nesta etapa; isso pertence à Etapa 3 (Power Pivot), conforme o guia.

## Pendências e limitações identificadas

1. **Fato sem registros:** o Excel enviado não contém os registros da tabela `Fato_Turismo_Ocupação`. A consulta `fTurismo` foi criada apenas com a estrutura de colunas e permanece vazia. Não foram usados os registros de hotelaria como substitutos.
2. **CNPJ duplicado:** HTL003 e HTL004 resultam no mesmo CNPJ `12345678000103` após normalização. A pendência foi mantida para validação cadastral; nenhum dígito foi inventado.
3. **Hotelaria auxiliar:** `cad_Hotelaria` não tem relacionamento direto no modelo estrela enquanto `ID_Hotelaria` não existir na tabela fato.
4. **Granularidade:** confirmar com a equipe/professor se cada linha da fato representa um registro por período, hospedagem, localidade etc. antes de preencher a fato.
5. **Datas:** as datas das dimensões foram convertidas para tipo data; validar a coerência entre eventos e calendário antes de análise.

## Conferência

A reconciliação da fato não pode ser concluída até que a origem da fato contenha registros. Quando a fonte oficial estiver disponível, preencher `Fonte_FatoTurismo`, atualizar as consultas e exigir:

`Linhas lidas - Linhas aceitas - Linhas rejeitadas = 0`

A consulta `Conf_CNPJ` deve continuar sendo revisada até a equipe resolver a duplicidade documentada. A função `fnProblemasFato` classifica registros inválidos; `fTurismo` e `Rejeitados` usam a mesma regra para que cada linha lida seja classificada em um dos dois destinos.
