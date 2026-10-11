# Validação da entrega

Conferências feitas em 11/10/2026, abrindo o PBIX final no Power BI Desktop e comparando com a base `dados/Financial Sample.xlsx` (700 linhas) calculada em Python (pandas).

## Estrutura

- 3 páginas: Visão Geral, Lucro e Estatística;
- o arquivo abre no Power BI Desktop e as três páginas renderizam sem erro de campo;
- menu com 3 botões em cada página; o botão da página atual aparece em laranja.

## Números conferidos

Todos os valores abaixo, lidos na tela, batem com o cálculo em pandas.

| Medida | No relatório | No pandas |
|---|---|---|
| Vendas | 118,73 Mi | 118.726.350 |
| Lucro | 16,89 Mi | 16.893.702 |
| Margem de lucro | 14,2% | 14,2% |
| Média mensal de vendas | 7,42 Mi | 7.420.397 |
| Mediana mensal | 6,79 Mi | 6.786.268 |
| Desvio padrão mensal (amostral) | 2,31 Mi | 2.310.556 |
| Coeficiente de variação | 31,1% | 31,1% |
| Correlação unidades x lucro (mensal) | 0,89 | 0,886 |
| Meses atípicos (|Z| > 2) | 1 | 1 (out/2014, Z = 2,14) |
| Lucro médio por registro | 24,1 mil | 24.134 |
| Lucro mediano por registro | 9,2 mil | 9.242 |

Lucro por trimestre (soma do mesmo trimestre nos dois anos, em milhões): 2,63, 3,23, 3,50 e 7,53, total 16,89. Bate com a cascata.

Lucro por segmento: Government 11,39 Mi, Small Business 4,14 Mi, Channel Partners 1,32 Mi, Midmarket 0,66 Mi e Enterprise -0,61 Mi, iguais aos da árvore de decomposição (diferença de 1 centavo em Enterprise, arredondamento).

Vendas por segmento, produto e país (em milhões) batem com a planilha: por exemplo Government 52,5, Paseo 33,0 e Estados Unidos 25,0.

Matriz de estatística descritiva por segmento (valor de cada venda): registros, média, mediana, mínimo e máximo batem com o pandas nos cinco segmentos. O desvio da matriz é populacional (por exemplo 9.110,58 em Channel Partners, contra 9.156,47 amostral), e a coluna está rotulada "(pop.)".

## Erros que apareceram e foram corrigidos

- A primeira versão da matriz mostrava Mínimo, Máximo e Registros trocados, porque eu tinha mapeado errado os códigos de agregação no arquivo do relatório. Percebi comparando com o pandas (a contagem aparecia como 80 em vez de 100). Corrigido e conferido de novo.
- A tabela simples do Power BI não exibia as colunas de valor com o formato que gerei. Troquei por matriz.
- O eixo de datas saiu como "000/13" na primeira tentativa de formato; corrigido para `MMM/yy`.

## Não testado

- Navegação e efeitos de focalizar/pressionar no modo de leitura. No modo de edição só verifiquei a aparência.
- Publicação no Power BI Service.
- Layout de celular (não foi criado).
- Normalidade dos dados: o critério de 2 desvios é um critério prático, não um teste estatístico.
- Abertura em versões antigas do Power BI Desktop (o arquivo usa o formato PBIR).
