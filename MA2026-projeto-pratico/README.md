## Equipe — FATEC-SP | Equipe 15

**TourTech — dados integrados para apoiar decisões no turismo.**

![Status](https://img.shields.io/badge/Status-Em%20Desenvolvimento-blue)
![Instituição](https://img.shields.io/badge/Institui%C3%A7%C3%A3o-FATEC%20SP-red)
![Disciplina](https://img.shields.io/badge/Disciplina-Microinform%C3%A1tica%20Aplicada-orange)

| Integrante | Função |
|:---| :---|
| Arthur Ciol Calixto Cid | Design, prototipação e banco de dados SQL |
| Felipe Prais Almeida | Modelagem com Power Query e DAX |
| Pedro Bispo | Automação VBA e engenharia de dados |
| Pedro Henrique Mello | APIs e desenvolvimento Python |
| Pedro Henrique Pacheco | Documentação e desenvolvimento Python |

---

# TourTech

Projeto acadêmico da **Equipe 15 da FATEC-SP**, voltado à centralização e análise de dados do setor de turismo.

## 🎯 Objetivo

Desenvolver uma solução que reúna informações de hotéis, flats e outros meios de hospedagem para apoiar decisões estratégicas. A partir de dados sobre ocupação, sazonalidade, localidades e eventos regionais, a proposta é gerar informações que ajudem os estabelecimentos a identificar oportunidades e planejar ações para atrair visitantes.

## Problemática

Os dados que podem influenciar a atividade turística — como períodos de alta e baixa temporada, eventos locais e índices de ocupação — costumam estar dispersos em diferentes fontes. Essa fragmentação dificulta a análise conjunta dessas informações e a identificação de oportunidades.

O TourTech busca centralizar esses dados e organizá-los para facilitar a compreensão do comportamento turístico de cada região e apoiar decisões dos meios de hospedagem.

## Tecnologias e Ferramentas Utilizadas

O desenvolvimento do TourTech utiliza um conjunto de tecnologias voltadas à integração, tratamento, armazenamento e análise de dados, seguindo as etapas de evolução técnica propostas pelo projeto:

1. **Excel Avançado:** Organização da base de dados, estruturação das tabelas e identificação de inconsistências por meio de auditorias.
2. **Power Query (Linguagem M):** Tratamento, limpeza e transformação dos dados. 
3. **Power Pivot & DAX:** Modelagem dos dados e desenvolvimento de indicadores (KPIs).
4. **Banco de Dados Relacional (SQL):**  Estruturação e gerenciamento das informações, utilizando comandos para criação, manipulação e consulta dos dados.
5. **APIs REST**: Integração com fontes externas para obtenção e enriquecimento de informações sobre localidades, eventos e atividade turística.
6. **Power BI:**: Desenvolvimento de dashboards interativos para visualização dos indicadores.

## Modelo de Dados

A estrutura de dados do projeto utiliza as seguintes tabelas:

* *Fato_Hotelaria*
    * 'Localidade'
    * 'Hospedagem'
    * 'Eventos'
    * 'Avaliação'
    * 'Calendário'
    * 'Ocupação'

As tabelas se relacionam para permitir análises que cruzem informações de hospedagens, localidades, eventos, avaliações, datas e ocupação.

