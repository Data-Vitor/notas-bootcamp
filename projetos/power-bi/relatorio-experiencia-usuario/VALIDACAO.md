# Validação da entrega

Conferências feitas em 11/10/2026, abrindo o PBIX no Power BI Desktop e comparando com a base `dados/Financial Sample.xlsx` (700 linhas) calculada em Python.

## Estrutura

- 3 páginas: Home, Visão Geral, Detalhamento;
- arquivo abre no Power BI Desktop e carrega os dados do modelo;
- menu com 3 botões em cada página interna e botão de entrada na capa;
- cada botão tem os quatro estados de cor configurados no arquivo.

## Números conferidos

Todos os valores exibidos no relatório batem com a soma feita direto na planilha.

| Medida | No relatório | Na planilha |
|---|---|---|
| Vendas | 118,73 Mi | 118.726.350 |
| Unidades vendidas | 1,13 Mi | 1.125.806 |
| Descontos | 9,21 Mi | 9.205.248 |
| COGS | 101,83 Mi | 101.832.648 |

Por segmento (vendas, em milhões): Channel Partners 1,80, Enterprise 19,61, Government 52,50, Midmarket 2,38, Small Business 42,43. Government representa 44,22% do total, o mesmo percentual da rosca.

Por produto (vendas, em milhões): Paseo 33,01, VTT 20,51, Velo 18,25, Amarilla 17,75, Montana 15,39, Carretera 13,82.

Por país (vendas, em milhões): Estados Unidos 25,03, Canadá 24,89, França 24,35, Alemanha 23,51, México 20,95.

Unidades por produto: Paseo 338.240, VTT 168.783, Velo 162.424, Amarilla 155.315, Montana 154.198, Carretera 146.846.

Descontos por segmento (em milhões): Government 3,90, Small Business 3,51, Enterprise 1,46, Midmarket 0,20, Channel Partners 0,13.

Vendas por mês: 16 meses de set/2013 a dez/2014, começando em 4,5 Mi e com pico de 12,4 Mi em out/2014. Os 16 valores batem com a planilha.

A matriz de segmento por produto bate célula a célula (arredondamento de uma casa) e o total geral é 118,7 Mi.

## Não testado

- Navegação e efeitos de focalizar/pressionar no modo de leitura. No modo de edição só verifiquei a aparência.
- Publicação no Power BI Service.
- Visualização no layout de celular (não foi criado).
