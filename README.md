# Projetos e notas do bootcamp Santander/DIO

| Entrega | Conteúdo |
|---|---|
| [Modelagem e transformação de dados com DAX — Power BI](projetos/power-bi/modelagem-dax-financials/) | Star schema da amostra Financials, tabelas calculadas em DAX, relacionamentos 1:N, PBIX, consultas M e validação dos dados. |
| [Star schema de professores — Power BI](projetos/power-bi/star-schema-professores/) | Modelo dimensional com uma tabela fato, cinco dimensões, relacionamentos 1:N, arquivo PBIX, dados de exemplo, SQL, DAX e documentação. |
| [Processamento e transformação de dados — MySQL e Power BI](projetos/power-bi/processamento-dados-company/) | SQL corrigido, transformações no Power Query, checagens de qualidade, relatório publicado e base auditável. |
| [Relatório gerencial de vendas — Power BI](projetos/power-bi/relatorio-gerencial-vendas/) | Duas páginas, indicadores, troca de visuais, navegação, relatório PBIX e base Financials. |
| [Dashboard de vendas e lucro — Power BI](projetos/power-bi/dashboard-vendas/) | Três páginas, relatório PBIX, PowerPoint, base de dados e documentação. |
| [Relatório financeiro com foco em experiência do usuário — Power BI](projetos/power-bi/relatorio-experiencia-usuario/) | Três páginas, menu de navegação com estados de focalizar e selecionado, segmentadores, proporção áurea, PBIX, base e validação. |
| [Relatório estatístico com foco em experiência do usuário (Power BI)](projetos/power-bi/relatorio-estatistico-ux/) | Três páginas com média, mediana, desvio padrão, gráfico de controle, Z-score, correlação e tendência, navegação com estados, medidas DAX, PBIX e validação. |
| [Simulador de fundos imobiliários (Excel)](projetos/excel/simulador-fundos-imobiliarios/) | VF, cenários de 2 a 30 anos, intervalos nomeados, PROCV com chave composta, lista de perfis, gráfico de pizza e validação. |
| [Caderno temático — NotebookLM](#ferramentas-estatísticas-para-trabalhar-com-dados-de-verdade-guia-de-fundamentos) | Curadoria de fontes, prompts e guia de fundamentos estatísticos, documentados abaixo. |

---

# Ferramentas Estatísticas para Trabalhar com Dados de Verdade (Guia de Fundamentos)

Desafio de projeto do Bootcamp Santander/DIO: "Treinando uma IA de Aprendizagem: Explore o Poder do NotebookLM".

## Contexto e Objetivos

Sou Vitor, estudante de Ciência de Dados, atualmente estudando estatística de forma autodidata pelo material do Prof. Fernando Nemec. Escolhi esse assunto para o Caderno Temático porque é o que estou estudando ativamente agora, e queria testar se o NotebookLM ajuda a organizar e priorizar o aprendizado, não só resumir conteúdo.

**Objetivo de estudo:** montar um mapa enciclopédico das ferramentas estatísticas essenciais para quem trabalha com dados reais, com foco em priorização (o que aprender primeiro, o que é mais cobrado no mercado) e não só em definição teórica.

## Curadoria de Fontes

1. **OpenIntro Statistics** (Diez, Barr, Çetinkaya-Rundel) — livro-texto completo de estatística introdutória, licença Creative Commons, disponível gratuitamente em [openintro.org/os](https://www.openintro.org/os).
2. **Seeing Theory** (Brown University, Daniel Kunin) — recurso interativo de visualização de probabilidade e estatística, disponível em [seeing-theory.brown.edu](https://seeing-theory.brown.edu).
3. **Notebooks próprios** — cadernos que produzi estudando os capítulos 2 a 5 do material do Prof. Fernando Nemec (Ferramentas na Prática, Medições e Distribuições, Probabilidade/Amostragem/Viés, Ferramentas Estatísticas Essenciais). Contêm o código e os exercícios que apliquei na prática, servindo como contraponto de aplicação real às duas fontes conceituais acima.

## Engenharia de Prompts e Cicatrizes

### Prompt 1 (mapa geral)
> "Quais ferramentas estatísticas eu preciso dominar pra trabalhar com dados reais, e em que ordem aprender?"

**Resultado:** resposta estruturada em 6 blocos (Tidy Data → EDA → Probabilidade → Inferência → Regressão → Diagnóstico de dados), com boa fidelidade às três fontes. A ordem sugerida bateu de forma próxima com a sequência de capítulos do próprio material do Nemec, o que indica que a curadoria das fontes estava coerente entre si.

### Prompt 2 (teste de estresse, priorização sob restrição)
> "Dessas ferramentas, quais são as 3 mais urgentes pra alguém que já sabe SQL e Pandas mas nunca fez inferência estatística, pensando em entrevista de estágio em 3 meses?"

**Objetivo do teste:** forçar o modelo a cortar a lista em vez de só reorganizar o que já tinha dito, situação em que IA generativa costuma ficar genérica.

**Resultado:** o modelo não caiu na armadilha esperada. Priorizou Testes de Hipótese/p-valor, Intervalos de Confiança e Regressão (linear e logística), com justificativa amarrada ao cenário de entrevista (o que costuma ser testado, o que sinaliza raciocínio de negócio). Também conectou a recomendação de estudo (usar Bootstrap/simulação computacional para aprender inferência) a um método que já aparece no meu próprio capítulo 3.

**Dificuldade real encontrada:** não foi corrigir uma resposta ruim, foi não achar o furo que eu esperava. Isso também é um dado válido: nem todo teste de prompt precisa expor erro para ser útil, às vezes ele confirma que a curadoria de fontes estava boa o suficiente para sustentar respostas específicas, não só genéricas.

## Miniguia de Estudo

### Resumo estruturado

**1. Fundamentos e Tidy Data** — organização de dados (cada linha uma observação, cada coluna uma variável), tipos de variável (numérica discreta/contínua, categórica nominal/ordinal), manipulação básica com Pandas.

**2. Estatística Descritiva e EDA** — medidas de tendência central (média, mediana, moda), medidas de variabilidade (variância, desvio padrão, IQR), visualização (histograma, dispersão, boxplot, gráfico de barras).

**3. Probabilidade e Distribuições** — Distribuição Normal e Z-score, Binomial, Poisson, t de Student, Teorema de Bayes, amostragem aleatória.

**4. Inferência Estatística** — estimativas pontuais e intervalos de confiança, testes de hipótese (H0/HA, p-valor), Bootstrap e testes de permutação.

**5. Regressão e Modelagem** — regressão linear simples e múltipla, regressão logística, validação cruzada.

**6. Diagnóstico e Tratamento de Dados** — detecção de outliers (IQR, Z-score, Mahalanobis), tratamento (winsorização, imputação), transformações (log, raiz), ANOVA.

### Glossário

| Termo | Definição |
|---|---|
| Tidy Data | Organização onde cada linha é uma observação, cada coluna uma variável, cada célula um valor único. |
| Variável Numérica | Dado que representa quantidade, contínua (peso) ou discreta (contagem). |
| Variável Categórica | Dado que representa grupo ou rótulo, nominal (sem ordem) ou ordinal (com ordem). |
| Média | Soma das observações dividida pelo número de casos. |
| Mediana | Valor do meio em dados ordenados, resistente a outliers. |
| Desvio Padrão | Distância típica das observações em relação à média. |
| Outlier | Observação extrema em relação ao restante do conjunto. |
| IQR | Diferença entre 3º e 1º quartil, dispersão dos 50% centrais. |
| Robustez | Propriedade de estatísticas pouco sensíveis a outliers (ex: mediana, IQR). |
| Distribuição Normal | Curva em sino, simétrica, que descreve muitos fenômenos estatísticos. |
| Z-score | Número de desvios padrão que um valor está da média. |
| Teorema de Bayes | Atualiza a probabilidade de um evento a partir de nova evidência. |
| Erro Padrão | Variabilidade de uma estimativa (ex: média amostral) entre amostras. |
| Teorema do Limite Central | Com amostras grandes, a distribuição das médias amostrais tende à normal. |
| Hipótese Nula (H0) | Suposição padrão de que não há efeito ou diferença real. |
| p-valor | Probabilidade de observar um resultado tão extremo quanto o obtido, assumindo H0 verdadeira. |
| Intervalo de Confiança | Faixa de valores plausíveis para o parâmetro populacional real. |
| Correlação (r) | Valor entre -1 e 1 que mede força e direção da relação linear entre duas variáveis. |
| Regressão Linear | Ajusta uma reta aos dados para prever uma variável a partir de preditores. |
| Regressão Logística | Modelo de regressão para variável de resposta binária. |

### Prompts reutilizáveis

Para revisão futura do tema:

```
"Quais ferramentas estatísticas eu preciso dominar pra [contexto/objetivo específico], e em que ordem aprender?"

"Dessas ferramentas, quais são as [N] mais urgentes pra alguém que já sabe [skills atuais] mas nunca fez [gap], pensando em [prazo/objetivo]?"

"Com base nas fontes, gera um glossário com os [N] termos mais importantes sobre [subtema], cada um com definição de uma linha."
```

## Ferramentas Usadas

NotebookLM (Google), com as 3 fontes listadas acima.
