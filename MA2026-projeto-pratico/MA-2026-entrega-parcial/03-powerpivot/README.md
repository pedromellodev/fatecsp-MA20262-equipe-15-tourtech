# TourTech — Etapa 3: Power Pivot & DAX

**Projeto:** TourTech • **Equipe:** 15
**Disciplina:** Microinformática Aplicada (ILP590) — FATEC-SP
**Período:** 2º semestre de 2026

---

## 1. Objetivo

Construir o **Modelo de Dados** no Power Pivot a partir das tabelas tratadas na Etapa 2 (Power Query), organizando-as em um **modelo estrela**; criar os relacionamentos; elaborar **medidas DAX**; validar a integridade das chaves; e documentar a linhagem entre as etapas.

Esta etapa **não é uma nova etapa de limpeza**: ela consome a saída tratada da Etapa 2 e permite análises por tempo, destino, hospedagem, evento e avaliação.

> **Escopo dos resultados:** a tabela fato `fTurismo` contém **20 registros**, adotados pela equipe como oficiais (ver seção 8.1). Os indicadores refletem somente esses 20 registros e devem ser lidos como descritivos; não sustentam, sozinhos, conclusões causais (por exemplo, que um evento causou aumento de visitantes).

---

## 2. Como abrir o arquivo

1. Use o **Excel para Windows** com o suplemento **Microsoft Power Pivot for Excel** habilitado (*Arquivo → Opções → Suplementos → Suplementos de COM → Ir*). Excel para Web e para Mac não oferecem a mesma experiência de Power Pivot.
2. **Antes de atualizar**, ajuste os parâmetros de caminho para o seu computador (seção 3.2).
3. Abra `03-powerpivot/TourTech_03_PowerPivot.xlsx` e, se necessário, clique em **Habilitar conteúdo/Habilitar edição**.
4. Para ver o modelo: guia **Power Pivot → Gerenciar** (abre a janela do Power Pivot; use **Exibição de Diagrama** para ver as relações).
5. Abas da pasta de trabalho:
   - `Validacao` — Tabelas Dinâmicas inseridas **a partir do Modelo de Dados** (não de Tabela/Intervalo).
   - `Conferencia` — reconciliação e status das conferências.

---

## 3. Origem dos dados e caminhos dos parâmetros

### 3.1 Linhagem

`TourTech_01_Excel_tratado.xlsx` → `TourTech_02_PowerQuery.xlsx` → `TourTech_03_PowerPivot.xlsx`

- **Arquivo de origem:** `02-powerquery/TourTech_02_PowerQuery.xlsx`
- A Etapa 3 **lê** as tabelas tratadas da Etapa 2 pelo Power Query; não há dados redigitados nem copiados/colados.
- A Etapa 2 permanece separada e intacta (a Etapa 3 foi criada como pasta de trabalho em branco, sem *Salvar Como* sobre a Etapa 2).
- Todas as tabelas do modelo, **inclusive a `fTurismo`**, vêm da Etapa 2 (consulta `cad_Etapa2`). O arquivo `dados_limpos/fTurismo.csv` (apenas cabeçalho) **não é mais a fonte da fato** (ver seção 8.1).

### 3.2 Parâmetros que dependem do computador — **alteração obrigatória**

Os parâmetros do Power Query guardam **caminhos absolutos** de arquivos do computador onde o modelo foi construído. Esses caminhos **não funcionam em outra máquina**, nem se a pasta do repositório for movida ou renomeada, nem se o usuário/unidade do Windows for diferente. Se não forem ajustados, a atualização falha com erro de arquivo não encontrado e o modelo não carrega.

| Parâmetro | Tipo | O que deve conter | Situação |
|---|---|---|---|
| `pArquivoEtapa2` | Texto | Caminho completo de `TourTech_02_PowerQuery.xlsx`, incluindo a extensão `.xlsx` | **Obrigatório.** Alimenta `cad_Etapa2` e, a partir dela, todas as dimensões, o calendário e a `fTurismo` |
| `pArquivoFatoCSV` | Texto | Caminho completo de `02-powerquery/dados_limpos/fTurismo.csv` | **Legado.** Só é necessário se a consulta `fTurismo_FonteCSV` continuar existindo no arquivo. Com a fato lida da Etapa 2, pode ficar sem uso; se mantiver a consulta, ajuste o caminho também (ou ela gerará erro no *Atualizar Tudo*) |

**Exemplo de formato** (ilustrativo; use o caminho real da sua máquina):

```
C:\Users\<seu_usuario>\Documents\MA2026-entrega-parcial\02-powerquery\TourTech_02_PowerQuery.xlsx
```

#### Passo a passo para cada integrante

1. **Feche** `TourTech_02_PowerQuery.xlsx` (arquivo aberto pode bloquear a leitura ou fornecer versão desatualizada).
2. No Explorador de Arquivos, vá até a pasta `02-powerquery` do **seu** clone do repositório.
3. Mantenha **Shift** pressionado, clique com o botão direito em `TourTech_02_PowerQuery.xlsx` e escolha **Copiar como caminho**.
4. Abra `TourTech_03_PowerPivot.xlsx` e vá em **Dados → Obter Dados → Iniciar Editor do Power Query**.
5. No painel **Consultas** (à esquerda), abra a pasta **Parâmetros** e clique em `pArquivoEtapa2`. (Alternativa: **Página Inicial → Gerenciar Parâmetros** e selecione o parâmetro.)
6. No campo **Valor Atual**, cole o caminho copiado e **remova as aspas** que o Windows adiciona nas duas pontas (o valor deve começar em `C:\...` e terminar em `.xlsx`, sem aspas).
7. Repita para `pArquivoFatoCSV`, se a consulta `fTurismo_FonteCSV` ainda existir (use o caminho de `dados_limpos\fTurismo.csv`).
8. Clique em **Concluído/OK**, abra a consulta `cad_Etapa2` e confira se a coluna `Item` lista as tabelas da Etapa 2 (`dLocalidade`, `dHospedagem`, `dEventos`, `dAvaliacao`, `dCalendario`, `cad_Hotelaria`, `fTurismo`, `Rejeitados`). Se listar, o caminho está correto.
9. Clique em **Fechar e Carregar** e, no Excel, em **Dados → Atualizar Tudo**.

#### Erros mais comuns

| Sintoma | Causa provável | Correção |
|---|---|---|
| `DataSource.Error: Não foi possível localizar o arquivo` / arquivo não encontrado | Caminho de outra máquina, pasta movida ou nome digitado incorretamente | Refazer os passos 3 a 6 com o caminho do seu computador |
| Mensagem de arquivo/caminho inválido logo após colar | Aspas nas pontas do caminho | Apagar as aspas do valor do parâmetro |
| Erro de que a tabela `fTurismo` (ou outra) não foi encontrada | Arquivo apontado é outra versão/cópia da Etapa 2, ou o nome da tabela mudou | Abrir a Etapa 2, selecionar a tabela e conferir **Design da Tabela → Nome da Tabela**; usar exatamente o nome exibido |
| Dados desatualizados | Etapa 2 não foi atualizada/salva antes | Atualizar e salvar a Etapa 2, fechá-la e então *Atualizar Tudo* na Etapa 3 |
| Erro só em `fTurismo_FonteCSV` | `pArquivoFatoCSV` não ajustado (consulta legada) | Ajustar o caminho do CSV ou remover/desativar a consulta legada, documentando a decisão |
| Bloqueio por nível de privacidade ao combinar fontes | Política de privacidade do Excel | Seguir a orientação do professor/laboratório; não alterar configurações de segurança sem necessidade |

#### Cuidados

- **Não** versionar no Git um arquivo com o caminho pessoal de outra pessoa sem avisar a equipe: o `.xlsx` guarda o último caminho salvo. Cada integrante ajusta o parâmetro localmente e, ao fazer commit, combina com a equipe qual caminho permanece no arquivo.
- Se o repositório estiver em pasta sincronizada (OneDrive, Google Drive), o caminho inclui o nome dessa pasta; use o caminho exibido por **Copiar como caminho** e não um digitado à mão.
- Confira em **Arquivo → Informações** que o `TourTech_03_PowerPivot.xlsx` está em `03-powerpivot\`.
- Configuração regional das consultas: **Português (Brasil)** (*Dados → Obter Dados → Opções de Consulta*).

---

## 4. Como atualizar (Atualizar Tudo)

1. Atualize primeiro `TourTech_02_PowerQuery.xlsx`, confira a aba `Conferencia` dela, **salve e feche**.
2. Abra `TourTech_03_PowerPivot.xlsx` e confirme os parâmetros (seção 3.2).
3. Clique em **Dados → Atualizar Tudo**.
4. Confira as medidas `Conf ...`, atualize as Tabelas Dinâmicas e registre o status real na aba `Conferencia`.
5. Salve e **feche o Excel antes do commit** (para liberar o arquivo temporário `~$TourTech_03_PowerPivot.xlsx`).

---

## 5. Tabelas do modelo

| Tabela | Papel | Chave / campos principais | Destino de carga |
|---|---|---|---|
| `fTurismo` | **Fato** (20 registros, fonte: tabela `fTurismo` da Etapa 2) | `ID_Registro`; FKs de calendário, localidade, hospedagem, evento e avaliação; visitantes, ocupantes, capacidade, taxa e avaliações; `Data` (obtida por junção) | Conexão + Modelo de Dados |
| `dLocalidade` | Dimensão de destino | PK `ID_Localidade`; Destino; Município; Regiao | Conexão + Modelo de Dados |
| `dHospedagem` | Dimensão de hospedagem | PK `ID_Hospedagem`; Tipo_de_Hospedagem; Capacidade | Conexão + Modelo de Dados |
| `dEventos` | Dimensão de evento | PK `ID_Evento`; Nome; Tipo; ID_Localidade; Data_Inicio; Data_Fim | Conexão + Modelo de Dados |
| `dAvaliacao` | Dimensão de avaliação | PK `ID_Avaliacao`; Nota; Classificação; Periodo; Origem_da_Avaliação | Conexão + Modelo de Dados |
| `dCalendario` | Dimensão de tempo **diária e contínua**, marcada como Tabela de Datas | PK `Data`; Ano; MesNumero; Mês; Trimestre; AnoMes; Período/Sazionalidade | Conexão + Modelo de Dados |
| `Rejeitados` | Auditoria dos registros recusados pelas regras da Etapa 2 | — | Conexão + Modelo de Dados |
| `cad_Hotelaria` | Cadastro auxiliar — **não relacionado à fato** (a fato não possui `ID_Hotelaria`) | `ID_Hotelaria`; CNPJ; Nome; métricas cadastrais | Somente conexão |

**Consultas auxiliares (somente conexão):** `cad_Etapa2`, `dCalendario_Fonte`, `cad_Hotelaria`, `fTurismo_FonteCSV` (legada, se mantida) e os parâmetros `pArquivoEtapa2` / `pArquivoFatoCSV`.

**Construção da `fTurismo`:** lida de `cad_Etapa2{[Item="fTurismo", Kind="Table"]}[Data]`, com os mesmos tipos definidos no guia (IDs como texto; quantidades como inteiro; taxa como decimal) e junção `LeftOuter` com `dCalendario_Fonte` por `ID_Calendario` para acrescentar a coluna `Data`.

**Regra do calendário:** a `dCalendario` original da Etapa 2 é mensal (uma data por mês). Para atender ao requisito de Tabela de Datas (funções como `DATEADD`), foi gerado um calendário **diário e contínuo**, do primeiro dia do menor mês ao último dia do maior mês da fonte (esperado: 01/01/2025 a 31/08/2026, se os limites se mantiverem). A classificação sazonal mensal da fonte é replicada para todos os dias do mês — *regra a confirmar com a equipe*. `ID_Calendario` é mantido para rastreabilidade.

---

## 6. Relacionamentos

Todos **muitos-para-um (N:1)**, **ativos**, com filtro em **direção única** (dimensão → fato).

| # | Lado muitos (fato) | Lado um (dimensão) |
|---|---|---|
| R1 | `fTurismo[ID_Localidade]` | `dLocalidade[ID_Localidade]` |
| R2 | `fTurismo[ID_Hospedagem]` | `dHospedagem[ID_Hospedagem]` |
| R3 | `fTurismo[ID_Evento]` | `dEventos[ID_Evento]` |
| R4 | `fTurismo[ID_Avaliacao]` | `dAvaliacao[ID_Avaliacao]` |
| R5 | `fTurismo[Data]` | `dCalendario[Data]` |

**Relações deliberadamente não criadas:**
- `cad_Hotelaria` ↔ `fTurismo` (falta `ID_Hotelaria` na fato);
- `dEventos`/`dHospedagem` ↔ `dLocalidade` (a estrela mantém as dimensões ligadas apenas à fato);
- relações por texto descritivo (nome de destino, nome de evento, tipo de hospedagem);
- não foi usada a opção *Detectar automaticamente*.

---

## 7. Medidas DAX

Arquivo completo: [`dax/medidas_preliminares.dax`](dax/medidas_preliminares.dax) (17 medidas)

**Medidas principais**

| Medida | Definição |
|---|---|
| `Total de Visitantes` | `SUM ( fTurismo[Quantidade_de_Visitantes] )` |
| `Total de Ocupantes` | `SUM ( fTurismo[Quantidade_de_Ocupantes] )` |
| `Capacidade Disponível` | `SUM ( fTurismo[Capacidade_Disponivel] )` |
| `Total de Avaliações` | `SUM ( fTurismo[Quantidade_de_Avaliacoes] )` |
| `Quantidade de Registros` | `DISTINCTCOUNT ( fTurismo[ID_Registro] )` |
| `Visitantes por Registro` | `DIVIDE ( [Total de Visitantes], [Quantidade de Registros] )` |
| `Taxa de Ocupação` | `DIVIDE ( [Total de Ocupantes], [Capacidade Disponível] )` — razão entre totais, **não** `AVERAGE` da taxa por linha |
| `Nota Média Ponderada` | `DIVIDE ( SUMX ( fTurismo, RELATED ( dAvaliacao[Nota] ) * fTurismo[Quantidade_de_Avaliacoes] ), [Total de Avaliações] )` |

**Medidas de conferência e integridade**

| Medida | O que verifica |
|---|---|
| `Conf Linhas Fato` | Linhas da `fTurismo` |
| `Conf Linhas Rejeitados` | Linhas da `Rejeitados` |
| `Conf Linhas Classificadas` | Fato + Rejeitados |
| `Conf Fato sem Localidade` | FK órfã para `dLocalidade` |
| `Conf Fato sem Hospedagem` | FK órfã para `dHospedagem` |
| `Conf Fato sem Evento` | FK órfã para `dEventos` |
| `Conf Fato sem Avaliacao` | FK órfã para `dAvaliacao` |
| `Conf Fato sem Data` | FK órfã para `dCalendario` |
| `Conf PK Duplicada` | Soma de (linhas − distintos) das PKs das cinco dimensões |

**Formatação:** contagens e totais — número inteiro com separador de milhar; `Visitantes por Registro` e `Nota Média Ponderada` — decimal, 2 casas; `Taxa de Ocupação` — porcentagem, 1 ou 2 casas.

**Observações:** as fórmulas usam vírgula como separador de argumentos, conforme exibido no Gerenciar Medidas; em Excel que exija ponto e vírgula, troque `,` por `;`. `Nota Média Ponderada` assume que `Nota` (dimensão) e `Quantidade_de_Avaliacoes` (fato) seguem a interpretação de média ponderada — *a confirmar com a equipe*.

---

## 8. Decisões e pendências

### 8.1 Decisão sobre as 20 linhas de `fTurismo`

**Contexto da divergência:** o `README.md`/`LEIA-ME.txt` da Etapa 2 e o CSV `dados_limpos/fTurismo.csv` indicam que a fonte oficial da fato não foi fornecida (o CSV contém apenas o cabeçalho, com 11 colunas). Já a cópia de `TourTech_02_PowerQuery.xlsx` utilizada contém **20 linhas** em `fTurismo` e em `src_FatoTurismo`, e a aba `Pendencias/Conferencia` da própria Etapa 2 registra "Fonte da fato: Não fornecida".

**Decisão adotada pela equipe:** as **20 linhas de `fTurismo` do `TourTech_02_PowerQuery.xlsx` são consideradas registros oficiais**, e a fato do modelo é lida diretamente da tabela `fTurismo` da Etapa 2.

Consequências aplicadas:
- A origem da fato é `cad_Etapa2{[Item="fTurismo", Kind="Table"]}[Data]`, mantendo os mesmos tipos e a junção com o calendário para obter `Data`.
- Os 20 registros **não são misturados** com o CSV: uma única fonte foi escolhida. O CSV de cabeçalho deixou de ser fonte da fato.
- A planilha da Etapa 2 **não foi alterada nem apagada**.
- As medidas e as Tabelas Dinâmicas passam a refletir esses 20 registros.

| Campo de registro da decisão | Preenchimento |
|---|---|
| Decisão | 20 linhas de `fTurismo` da Etapa 2 adotadas como oficiais |
| Quem confirmou (equipe/professor) | _a preencher_ |
| Data da confirmação | _a preencher_ |
| Versão da fonte validada (arquivo, data de modificação ou hash) | _a preencher_ |
| Evidência (print/e-mail/ata) | _a anexar em `evidencias/`_ |

**Inconsistência documental remanescente:** o README da Etapa 2, o CSV e a aba `Pendencias/Conferencia` da Etapa 2 continuam registrando que a fonte da fato não foi fornecida. Como a decisão foi tomada na Etapa 3, recomenda-se **atualizar a documentação da Etapa 2** (ou registrar nota explicativa) para que o repositório não se contradiga, sem apagar o histórico.

### 8.2 Granularidade da fato

**Registro adotado:**

> Cada linha de `fTurismo` representa um registro individual de observação turística, identificado por `ID_Registro` e associado a um calendário, uma localidade, uma hospedagem, um evento e uma avaliação. Entretanto, a unidade de observação de negócio (por exemplo, destino por período ou combinação de destino, hospedagem e evento) permanece pendente de confirmação pela equipe e/ou professor.

**Pendência:** a unidade de observação de negócio ainda não foi confirmada. Ela afeta a interpretação de `Quantidade_de_Visitantes`, `Quantidade_de_Ocupantes`, `Capacidade_Disponivel` e `Quantidade_de_Avaliacoes` — por exemplo, se somar visitantes entre linhas pode contar a mesma população mais de uma vez. Até a confirmação, os totais devem ser apresentados como soma dos registros do modelo, sem extrapolação.

### 8.3 CNPJ duplicado no cadastro auxiliar (pendente)

`HTL003` e `HTL004` compartilham o CNPJ normalizado `12345678000103` na `cad_Hotelaria`. **Não alterar o CNPJ sem documento comprobatório.** Não é duplicidade de PK do modelo estrela, pois `cad_Hotelaria` não participa das cinco relações. Pendente de validação cadastral.

### 8.4 Outras confirmações pendentes

- Regra de preenchimento sazonal do calendário diário (replicação da classificação mensal para todos os dias do mês).
- Interpretação de `Nota` × `Quantidade_de_Avaliacoes` na `Nota Média Ponderada`.
- Significado de `Capacidade_Disponivel` como denominador da `Taxa de Ocupação`.

---

## 9. Status da reconciliação e conferências

Com a fato carregada, as conferências passam a ser executáveis. Os valores abaixo **devem ser preenchidos com o resultado real** após *Atualizar Tudo*; este README não antecipa resultados.

| Indicador | Referência (Etapa 2) | Modelo Etapa 3 | Status |
|---|---|---|---|
| Fonte da fato | Tabela `fTurismo` da Etapa 2 (20 linhas visíveis na cópia examinada) | Mesma tabela, via `cad_Etapa2` | Adotada como oficial — confirmação formal a registrar (8.1) |
| Linhas lidas | Contagem da `src_FatoTurismo` / `Conferencia` da Etapa 2 | `[Conf Linhas Fato]` | _a preencher_ |
| Linhas aceitas | Contagem da `fTurismo` na Etapa 2 | `[Conf Linhas Fato]` | _a preencher_ |
| Linhas rejeitadas | Contagem da `Rejeitados` na Etapa 2 | `[Conf Linhas Rejeitados]` | _a preencher_ |
| PK duplicada nas dimensões | A validar | `[Conf PK Duplicada]` | _a preencher_ (esperado: 0) |
| FK órfã — localidade, hospedagem, evento, avaliação, data | A validar | `[Conf Fato sem ...]` (5 medidas) | _a preencher_ (esperado: 0) |
| CNPJ duplicado HTL003 / HTL004 | Cadastro auxiliar | — | **Pendente** de validação cadastral |

**Regra de reconciliação:** `Linhas lidas − Linhas aceitas − Linhas rejeitadas = 0`. Para contagens e totais comparáveis entre Etapa 2 e Etapa 3, a coluna de diferença (`=C2-B2` na aba `Conferencia`) deve ser **0**; qualquer diferença deve ser investigada e registrada, não ocultada.

**Limitações:** com apenas 20 registros, as análises são exploratórias. Tabelas Dinâmicas podem mostrar associação entre eventos e visitantes, mas não demonstram causalidade.

---

## 10. Estrutura da entrega

```
MA2026-entrega-parcial/
└── 03-powerpivot/
    ├── TourTech_03_PowerPivot.xlsx
    ├── README.md
    ├── dax/
    │   └── medidas_preliminares.dax
    ├── docs/
    │   ├── modelo_relacional.md
    │   └── diagrama_modelo.png
    ├── scripts_m/
    │   └── (consultas de origem e modelo .pq)
    └── evidencias/
        ├── powerpivot_ativo.png
        ├── tabelas_modelo.png
        ├── relacionamentos.png
        ├── medidas.png
        ├── validacao.png
        └── conferencia.png
```

---

## 11. Commit

Antes do commit: salvar, **fechar o Excel** (libera `~$TourTech_03_PowerPivot.xlsx`) e conferir `git status`. Lembrar da observação sobre caminhos pessoais (seção 3.2). Mensagem sugerida:

```
Etapa 3: modelo estrela TourTech e medidas DAX
```

Cada integrante realiza seus próprios commits conforme orientação da disciplina.

---

*Referência metodológica: Guia Prático da disciplina — Etapa 3: Power Pivot & DAX, adaptado ao tema TourTech.*
