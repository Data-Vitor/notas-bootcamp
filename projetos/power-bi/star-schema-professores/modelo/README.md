# Definição do modelo

**Grão da fato:** uma linha representa a oferta de uma disciplina por um professor, em um curso, departamento e data de início de período.

Todos os relacionamentos seguem a cardinalidade `1:*`, da dimensão para a fato, com filtro em uma única direção.

| Dimensão | Chave na dimensão | Chave na fato |
|---|---|---|
| D_Professor | ProfessorKey | ProfessorKey |
| D_Departamento | DepartamentoKey | DepartamentoKey |
| D_Curso | CursoKey | CursoKey |
| D_Disciplina | DisciplinaKey | DisciplinaKey |
| D_Calendario | DataKey | DataKey |

As chaves terminadas em `Key` são artificiais. Os campos terminados em `ID` preservam os identificadores do sistema de origem.
