# Regra de Isolamento de Projetos e Firewall de Contexto

Esta regra é mandatória para todos os agentes de IA (Google Antigravity, Claude Code, Cursor, Copilot) operando com o tema CEIATeX.

---

## 1. Escopo Estrito de Isolamento por Projeto
- Todo trabalho de desenvolvimento de novas apresentações, código TeX, figuras, recortes e compilação deve ocorrer **exclusivamente** dentro de uma pasta de projeto isolada e independente:
  `projetos/<nome_do_projeto>/`
- O diretório raiz do repositório `CEIATeX-Presentation/` é o **Núcleo Base do Template (Template Hub)** e deve ser tratado como **somente leitura**:
  - **NUNCA** crie arquivos `.tex` de trabalho soltos na raiz.
  - **NUNCA** gere saídas de compilação ou recortes de imagem de trabalhos do usuário misturados com os arquivos canônicos da biblioteca.
  - Os arquivos na raiz (`presentation_ceia.tex`, `starter.tex`, `beamerthemeCeia.sty`, `lib/`) são exclusivamente o showcase e os ativos de referência canônicos.

---

## 2. Autocontenção e Arquitetura de Pastas de Cada Projeto
Cada nova apresentação solicitada deve seguir a estrutura padrão quadripolar:

```text
projetos/<nome_do_projeto>/
├── src/        # Código LaTeX da apresentação (ex.: apresentacao.tex)
├── figs/       # Figuras, diagramas, recortes e imagens deste projeto específico
├── build/      # PDF final gerado (apresentacao.pdf) e artefatos de saída
└── docs/       # Arquivos de briefing, requisitos e notas de entrada
```

### Regras de Separação de Arquivos:
1. **Código TeX (`src/`):** Deve conter `apresentacao.tex` com `\usetheme{Ceia}`.
2. **Figuras Locais (`figs/`):** Todos os diagramas e recortes gerados para o projeto devem ser salvos em `figs/` local.
3. **Build Isolado (`build/`):** Todo comando de compilação deve direcionar o PDF e arquivos auxiliares para `build/`, mantendo a raiz e a pasta `src/` sempre limpas.

---

## 3. Comandos de Compilação com Template Central Compartilhado

A compilação de qualquer projeto isolado deve referenciar o diretório central do tema CEIA sem duplicar arquivos:

### Via Tectonic (Recomendado):
```bash
# A partir da pasta do projeto (projetos/<nome_do_projeto>/):
tectonic -Z "search-path=../../CEIATeX-Presentation" src/apresentacao.tex -o build/

# Ou usando o script oficial a partir da raiz:
.\compile.ps1 projetos/<nome_do_projeto>/src/apresentacao.tex -OutputDir projetos/<nome_do_projeto>/build/
```

### Via XeLaTeX Tradicional:
```bash
cd projetos/<nome_do_projeto>
xelatex -output-directory=build -interaction=nonstopmode src/apresentacao.tex
```

---

## 4. Bloqueio de Vazamento de Contexto (Context Firewall)
- O agente **NUNCA** deve inspecionar, ler ou referenciar arquivos de outros projetos existentes sob `projetos/*` (ex.: projetos finalizados de outros temas ou de outros usuários), **a menos que o usuário solicite expressamente na conversa** (por exemplo: *"use a estrutura do projeto X como referência"*).
- Comandos de busca de arquivos e listagem de diretório devem ser restritos à pasta do projeto ativo.
