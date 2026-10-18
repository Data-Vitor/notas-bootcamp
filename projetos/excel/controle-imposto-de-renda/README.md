# Controle de dados para o Imposto de Renda (Excel)

Planilha que reúne em um só lugar as informações que costumam ser necessárias na hora de declarar o Imposto de Renda: dados do titular, informes de rendimentos e despesas dedutíveis, com menu de navegação, validações de dados e totais automáticos. Todos os dados do arquivo (nomes, CPF, CNPJ, valores) são fictícios, de exemplo.

## Resultado

| Menu | Informes | Resumo |
|---|---|---|
| ![Menu](imagens/01-menu.png) | ![Informes](imagens/03-informes.png) | ![Resumo](imagens/05-resumo.png) |

Também há prints do [Titular](imagens/02-titular.png) e das [Notas](imagens/04-notas.png).

## Abas

| Aba | Função |
|---|---|
| Menu | Botões que levam a cada aba e links rápidos para o site da Receita Federal e o gov.br. Cada aba tem o link "Voltar ao Menu". |
| Titular | Nome, CPF, nascimento, e-mail, ano-calendário e até 3 dependentes (com contagem automática). |
| Informes | Até 100 linhas de rendimentos: fonte pagadora, CNPJ, data, tipo, valor e imposto retido (IRRF). |
| Notas | Até 100 linhas de despesas: prestador, documento, data, categoria e valor. |
| Resumo | Rendimentos por tipo, IRRF total, despesas por categoria e uma conferência de linhas sem tipo. |
| Apoio | Listas usadas nos menus suspensos. |

Células amarelas são para preencher; cinzas são calculadas e não devem ser editadas.

## Recursos usados

- **Validação de dados**: listas suspensas (tipo de rendimento, categoria de despesa, parentesco), valores não negativos, CPF com 11 dígitos e data de nascimento anterior a hoje.
- **Intervalos nomeados**: `lista_tipos`, `lista_categorias`, `lista_dependentes`, `tipo_informes`, `valor_informes`, `irrf_informes`, `cat_notas` e `valor_notas`. Os totais do Resumo usam `SOMASE` (SUMIF) sobre eles.
- **Formatações personalizadas**: CPF (`000"."000"."000"-"00`), CNPJ (`00"."000"."000"/"0000"-"00`), datas e moeda. O número fica guardado sem pontuação e só aparece formatado.
- **Navegação**: hiperlinks internos entre as abas.

## Validação

Recalculei a planilha no LibreOffice: sem erro de fórmula, e os totais batem com a soma manual dos dados de exemplo (rendimentos R$ 79.200,00 = 60.000 + 18.000 + 1.200; IRRF R$ 4.200,00; despesas R$ 9.500,00, sendo saúde R$ 6.000,00 e educação R$ 3.500,00).

## Limitações

- Não calcula imposto devido nem aplica limites de dedução ou tabelas da Receita: ela só organiza os dados. Para qualquer regra fiscal, consulte a Receita Federal ou um contador.
- Os links da Receita Federal e do gov.br não foram abertos durante a validação.
- Não testei no Excel propriamente dito (usei o LibreOffice), nem as validações com digitação manual.
- Não criei função personalizada (LAMBDA ou VBA) nem formulário em VBA; as aulas do curso tratam disso e eu não as acompanhei.
- Não usei os arquivos complementares da DIO (`bancos_apoio`, `projeto_completo`, script de alinhamentos); a estrutura é minha.
- O arquivo foi gerado por script (`gerar_planilha.py`, openpyxl).
