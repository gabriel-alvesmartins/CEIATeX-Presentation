# CEIATeX-Presentation

> **Template Oficial de Apresentações em LaTeX Beamer do CEIA (Centro de Excelência em Inteligência Artificial)**  
> *Desenvolvido para Pesquisa Científica, Engenharia de Software e IA — Totalmente compatível com Overleaf, IDEs modernas e Agentes de IA.*

[![LaTeX Beamer](https://img.shields.io/badge/LaTeX-Beamer%2016%3A9-blue.svg)](https://ctan.org/pkg/beamer)
[![Overleaf Ready](https://img.shields.io/badge/Overleaf-XeLaTeX%20Ready-success.svg)](https://www.overleaf.com/)
[![Tectonic Compatible](https://img.shields.io/badge/Tectonic-Fast%20Compile-brightgreen.svg)](https://tectonic-typesetting.github.io/)
[![Google Antigravity](https://img.shields.io/badge/Antigravity-Skill%20Ready-4285F4.svg)](#-suporte-nativo-a-agentes-de-ia)
[![Claude Code](https://img.shields.io/badge/Claude%20Code-CLAUDE.md%20Ready-D97706.svg)](#-suporte-nativo-a-agentes-de-ia)
[![Cursor](https://img.shields.io/badge/Cursor-Rules%20Ready-000000.svg)](#-suporte-nativo-a-agentes-de-ia)
[![Brand Guidelines](https://img.shields.io/badge/Manual%20da%20Marca-CEIA%202026-1B3983.svg)](CEIA_Brand_Guidelines_compressed.pdf)

---

## 🎯 Visão Geral

O **CEIATeX-Presentation** é o sistema visual canônico de apresentações em slides do **CEIA**, projetado para unir o rigor estético do **Manual de Uso da Marca (Goiânia, 2026)** à produtividade técnica de engenharia de software e pesquisa científica.

Ele foi construído do zero com foco em **alta modularidade e automação declarativa**: tabelas executivas com marcadores vetoriais, diagramas de agentes multi-agente sem coordenadas manuais, ícones vetoriais nativos em TikZ puro, linha do tempo/roadmaps, gráficos científicos (donuts, barras verticais e horizontais), layouts de figuras laterais e cartões de síntese executiva.

---

## ⚡ Início Rápido em 3 Minutos

Escolha a modalidade que melhor atende ao seu fluxo de trabalho:

### Opção 1: No Overleaf (Zero Instalação)
1. Baixe este repositório como arquivo **ZIP** (botão verde `<> Code` $\rightarrow$ `Download ZIP` no GitHub).
2. Acesse sua conta no [Overleaf](https://www.overleaf.com/).
3. Clique em **Novo Projeto** $\rightarrow$ **Fazer Upload de Projeto** e selecione o arquivo ZIP.
4. Clique em **Recompilar**.
> *Dica:* O arquivo `main.tex` é o ponto de entrada padrão. Por padrão, ele carrega o showcase completo (`presentation_ceia.tex`). Para criar uma apresentação nova a partir do modelo enxuto de 7 slides, basta descomentar `\input{starter.tex}` em `main.tex`.

---

### Opção 2: No seu Computador (Terminal ou VS Code)
O compilador recomendado é o **Tectonic**, que gerencia pacotes TeX automaticamente sem precisar instalar gigabytes do TeX Live:

1. **Instale o Tectonic em 1 comando:**
   - **Windows:** `winget install tectonic` (ou `choco install tectonic`)
   - **macOS:** `brew install tectonic`
   - **Linux:** `cargo install tectonic` (ou pacote da sua distribuição)

2. **Clone e compile:**
   ```bash
   git clone https://github.com/gabriel-alvesmartins/CEIATeX-Presentation.git
   cd CEIATeX-Presentation
   ```
   - **No Windows (PowerShell):**
     ```powershell
     .\compile.ps1 starter.tex
     ```
   - **No Linux / macOS (Bash):**
     ```bash
     chmod +x compile.sh && ./compile.sh starter.tex
     ```
   - **Ou diretamente via CLI:**
     ```bash
     tectonic starter.tex
     ```

---

### Opção 3: Com Agentes de IA (Google Antigravity, Claude Code, Cursor)

Este repositório vem 100% equipado com skills, regras e invariantes de design para os principais assistentes de código e agentes autônomos.

Execute o instalador automático de 1 comando:
- **No Windows (PowerShell):**
  ```powershell
  .\install_skill.ps1
  ```
- **No Linux / macOS (Bash):**
  ```bash
  chmod +x install_skill.sh && ./install_skill.sh
  ```

O instalador configura automaticamente:
- 🔵 **Google Antigravity:** Instala a skill global em `~/.gemini/config/skills/ceia-presentation/SKILL.md` com resolução dinâmica do caminho absoluto do template.
- 🟠 **Claude Code:** Ativa as instruções de engenharia e diretrizes de design via `CLAUDE.md`.
- ⚫ **Cursor IDE:** Injeta a regra de contexto em `.cursor/rules/ceia-presentation.mdc`.

#### Exemplo de Prompt para o Agente de IA:
> *"Crie uma apresentação técnica de 6 slides sobre a arquitetura do nosso novo microsserviço de orquestração LLM usando o modelo CEIA Beamer (`starter.tex`). Inclua um pipeline de agentes com gate humano, uma tabela de comparação de latência e um card final de veredito executivo com chips de status."*

---

## 🛡️ Invariantes de Design Mandatórios (Diretrizes Inegociáveis)

Todo slide gerado ou editado neste tema deve obedecer aos seguintes princípios fundamentais:

1. **Zero Dark Mode em Conteúdo:**
   - Slides de conteúdo, relatórios, métricas, código e tabelas utilizam **exclusivamente superfícies claras** (`white` ou `CEIABgSoft` `#F8FAFC`).
   - O fundo escuro (`CEIADarkBlue` `#1B3983`) é **estritamente restrito** à Capa (`\setLayout{cover}`), divisores de capítulo (`\ceiasectionframe`) e Encerramento (`\setLayout{closing}`).
   - **Nunca** crie caixas ou cards escuros dentro de slides de conteúdo.

2. **Alto Contraste Cromático (WCAG AAA > 7:1):**
   - É proibido o uso de fundos pastéis desbotados (opacidade a 15%) em tags corporativas.
   - É proibido renderizar ícones em branco (`\ceiaicon[white]`) sobre superfícies claras.
   - Chips e badges (`\ceiachip`) possuem fundo branco, borda saturada (`\chipcol!85`), ícones plenos (`CEIAGreen`, `CEIABrightBlue`, `CEIADarkBlue`) e tipografia bold em `CEIADarkBlue`.

3. **Geometria Icônica Fechada:**
   - O ícone `shield` possui silhueta clássica de crista com ponta inferior nítida e checkmark bold centrado.

4. **Ritmo Tipográfico Vertical Anti-Vácuo:**
   - Em cards compostos (`ceiasummarypunch`), todos os elementos seguem no fluxo contínuo da caixa: 7pt a 8pt entre chapéu e título; 8pt a 10pt entre título e corpo; 11pt a 12pt antes da fileira de chips.

5. **Distribuição em Linha Única:**
   - Chips e badges de status são sempre distribuídos em linha única contínua via `\hfill`.

---

## 🖼️ Layouts e Variações de Fundo

| Layout | Comando | Descrição Visual |
|---|---|---|
| **Capa Oficial** | `\setLayout{cover}` | Fundo azul marinho `CEIADarkBlue` com padrão paramétrico de gotas TikZ (Manual pág. 23) e logotipo branco. |
| **Conteúdo Padrão** | `\setLayout{content}` | Fundo branco limpo, cabeçalho *eyebrow* em azul brilhante e rodapé discreto com metadados. |
| **Transição de Seção (Lateral)** | `\setLayout{section}` ou `\ceiasectionframe` | Fundo escuro `CEIADarkBlue` com gotas verticais na margem direita (sem cortes) e logo branco no canto inferior esquerdo. |
| **Transição de Seção (Inferior)** | `\setLayout{section-bottom}` | Fundo escuro `CEIADarkBlue` com faixa horizontal de gotas na base e logo branco no canto superior direito. |
| **Fundo Suave** | `\setLayout{soft}` | Fundo suave `CEIABgSoft` (`#F8FAFC`) para visualização de cards modulares com contraste amigável. |
| **Tese Institucional** | `\setLayout{statement}` | Fundo limpo com manifesto *We Are CEIA* vetorizado em tipografia oficial Actay Wide. |
| **Encerramento** | `\setLayout{closing}` | Slide final oficial com OBRIGADO, contatos institucionais e régua. |

---

## 🎨 Paleta Cromática Institucional

| Cor TeX | HEX | RGB | Aplicação Semântica |
|---|---|---|---|
| `CEIADarkBlue` | `#1B3983` | `27, 57, 131` | Fundo de capas, encerramento, seções, títulos nobres, gates HITL |
| `CEIABlue` | `#1C4AB8` | `28, 74, 184` | Títulos primários, acentos estruturais, bordas |
| `CEIABrightBlue` | `#2866E5` | `40, 102, 229` | Numerais de métricas, agentes LLM, badges de status ativo |
| `CEIAGreen` | `#0CD4AA` | `12, 212, 170` | Verde Menta tecnológico: destaques (`\bestmetric`), tools, linters, sucesso |
| `CEIATextDark` | `#1E293B` | `30, 41, 59` | Slate neutro oficial para texto corrido com máxima legibilidade |
| `CEIATextMuted` | `#64748B` | `100, 116, 139` | Eyebrow headers, legendas de figuras e metadados de rodapé |
| `CEIABorder` | `#E2E8F0` | `226, 232, 240` | Bordas sutis de cards e divisórias |
| `CEIABgSoft` | `#F8FAFC` | `248, 250, 252` | Fundo suave de cards modulares e zebra-striping de tabelas |

---

## 🧩 Catálogo de Componentes e Sintaxe

### 1. Cards Modulares e Flexíveis (`ceiacards` & `\ceiacarditem`)
Cards com altura sincronizada automática para 2, 3 ou 4 colunas:
```latex
\begin{ceiacards}[3]
    \ceiacarditem[1]{Pesquisa Aplicada}{Modelos com rigor científico e reprodutibilidade.}
    \ceiacarditem[2]{Governança \& Ética}{Trilhas auditáveis e conformidade com LGPD.}
    \ceiacarditem[3]{Engenharia de IA}{Sistemas escaláveis e observabilidade ponta a ponta.}
\end{ceiacards}
```

---

### 2. DSL Declarativa de Multi-Agent Pipeline (`\ceiapipelinefour`, `\ceiapipelinethree`)
Desenhe grafos de agentes declarativamente sem coordenadas TikZ manuais:
```latex
\ceiapipelinethree{Elicitação \&\\Contratos}{agent}{[G1] Gate de\\Homologação}{gate}{Orquestração \&\\Deploy}{tool}
```
*Roles suportados:* `agent` (azul suave), `gate` (marinho HITL), `tool` (verde menta), `db` (slate soft).

---

### 3. Tabelas Executivas & Marcadores Vetoriais (`ceiamatrixtable`)
```latex
\begin{ceiamatrixtable}{l c c c}
    \textbf{Capacidade Avaliada} & \textbf{Legado} & \textbf{Cloud} & \textbf{Padrão CEIA} \\
    \midrule
    \ceiaicon{shield}\hspace{4pt} Governança \& LGPD & \matrixfail & \matrixwarn & \matrixok (Soberana) \\
    \ceiaicon{server}\hspace{4pt} Soberania de Dados & \matrixwarn & \matrixfail & \matrixok (100\%) \\
    \ceiaicon{clock}\hspace{4pt} Latência p95 & 3.2s & 1.8s & \bestmetric{110ms} \\
\end{ceiamatrixtable}
```

---

### 4. Conclusão Executiva e Veredito (`ceiasummarypunch`)
Card monumental de alta densidade sem vácuo e com chips de alto contraste:
```latex
\begin{ceiasummarypunch}{VEREDITO DE ENGENHARIA \& PESQUISA}{Arquitetura Homologada para Operação Crítica em Produção}
    A migração para orquestração declarativa e contratos formais de tipos garantiu estabilidade determinística, eliminando 100\% dos incidentes de parsing silencioso.
    \par\vspace{12pt}
    \ceiachip[CEIAGreen]{shield}{Conformidade LGPD \& EU AI Act}\hfill
    \ceiachip[CEIABrightBlue]{server}{Soberania On-Premise}\hfill
    \ceiachip[CEIADarkBlue]{clock}{Latência p95 $<$ 120ms}
\end{ceiasummarypunch}
```

---

### 5. Biblioteca Nativa de Ícones Vetoriais TikZ (`\ceiaicon`)
Ícones 100% vetoriais sem dependência de fontes externas:
Sintaxe: `\ceiaicon[cor][escala]{nome}`
```latex
\ceiaicon{brain}     % Rede neural / IA
\ceiaicon{shield}    % Seguranca / Governanca / LGPD
\ceiaicon{database}  % Banco de dados / Storage
\ceiaicon{code}      % Contratos / Codigo
\ceiaicon{server}    % Servidor / Soberania on-premise
\ceiaicon{user}      % Validador humano / Gate HITL
\ceiaicon{clock}     % Latencia / Tempo de resposta
\ceiaicon{lock}      % Criptografia / Autenticacao
```

---

### 6. Slides de Transição de Grandes Capítulos (`\ceiasectionframe`)
```latex
% Variante 1: Gotas na lateral direita (padrao) com logo no canto inferior esquerdo
\ceiasectionframe{02}{ARQUITETURA \& MULTI-AGENTE}{Orquestracao de Agentes e Contratos Formais}

% Variante 2: Gotas na horizontal inferior com logo no canto superior direito
\ceiasectionframe[bottom]{03}{BENCHMARKS \& ESPECIFICACOES}{Avaliacao Empirica de Modelos}
```

---

### 7. Janela de Código Compacto e Sincronizado (`ceiacodecompact`)
Ideal para layouts em 2 colunas (`0.49\textwidth`), asserções de testes e diffs cirúrgicos com realce semântico oficial estilo VSCode (`ceiavscode`):
- **Cabeçalho IDE Compacto:** 3 esferas TikZ e título monoespaçado ajustado (`\fontsize{6.0pt}{7.0pt}\ttfamily\bfseries`), permitindo exibir caminhos longos sem vazar a margem.
- **Equalização de Altura:** Suporta `[equal height group=...]` via argumento opcional para nivelar perfeitamente pares de caixas paralelas.
- **Regra de Largura:** Em colunas de $0.49\textwidth$, limite cada linha a no máximo **36 a 38 caracteres** para evitar `Overfull \hbox`.

```latex
\begin{columns}[T]
    \column{0.49\textwidth}
    \begin{ceiacodecompact}[equal height group=code_demo]{packages/core/src/agent.ts:15-28}
// Assercoes deterministicas de teste:
expect(result.status).toBe("APPROVED");
expect(result.tier).toBe("standard");
(*@\ceiaremoved{- result.fallbackHtml // legado}@*)
(*@\ceiaadded{+ result.tokens // conformidade}@*)
    \end{ceiacodecompact}
    \vspace{0.3em}
    {\scriptsize\textbf{Nota:} Validacao estrita em tempo de execucao.}

    \column{0.49\textwidth}
    \begin{ceiacodecompact}[equal height group=code_demo]{packages/core/src/schema.ts:50}
// Contrato Zod de auditoria:
export const AuditSchema = z.object({
  runId: z.string().min(8),
  hash: z.string().length(64),
});
    \end{ceiacodecompact}
    \vspace{0.3em}
    {\scriptsize\textbf{Rastreabilidade:} Schema compativel com EU AI Act.}
\end{columns}
```

---

## 📁 Estrutura do Repositório

```text
├── beamerthemeCeia.sty               # Tema Beamer Oficial v3.4 (Definicao central)
├── presentation_ceia.tex             # Showcase Canônico Completo (28 slides de referencia)
├── starter.tex                       # Template Minimalista de 7 slides para novos projetos
├── main.tex                          # Ponto de entrada padrao para o Overleaf
├── CLAUDE.md                         # Guia e instrucoes canonicas para Claude Code
├── install_skill.ps1                 # Instalador universal de IA para Windows (PowerShell)
├── install_skill.sh                  # Instalador universal de IA para Linux/macOS (Bash)
├── compile.ps1                       # Script de compilacao rapida (Windows PowerShell)
├── compile.sh                        # Script de compilacao rapida (Linux/macOS Bash)
├── scripts/
│   └── audit_layout.py               # Auditoria algorítmica de layout com PyMuPDF
├── .latexmkrc                        # Forca motor XeLaTeX automaticamente no Overleaf
├── .gitignore                        # Filtro de arquivos intermediarios do LaTeX
├── CEIA_Brand_Guidelines_compressed.pdf # Manual de Identidade Visual CEIA 2026
├── .agents/                          # Diretrizes para Agentes de IA
│   ├── rules/
│   │   ├── ceia_design_invariants.md # Regras invariantes (Zero dark mode, WCAG AAA, etc.)
│   │   └── project_isolation.md      # Regra de isolamento de apresentacoes (src, build, figs)
│   └── skills/
│       └── ceia-presentation/
│           └── SKILL.md              # Skill oficial v3.4 para Google Antigravity
├── .cursor/rules/                    # Regras automáticas de contexto para Cursor IDE
│   └── ceia-presentation.mdc
├── figs/                             # Previews dos slides em alta resolucao (PNG)
└── lib/                              # Ativos graficos vetoriais oficiais
    ├── fonts/                        # Fontes OpenType (Inter)
    ├── layouts/                      # Texturas e fundos oficiais
    └── logos/                        # Logotipos e simbolos vetoriais em PDF
```

---

## 🔬 Garantia de Qualidade e Auditoria Algorítmica de Layout

O repositório inclui um verificador algorítmico baseado em `pymupdf` (`scripts/audit_layout.py`) que valida automaticamente os limites geométricos oficiais do Beamer 16:9 ($453.54\text{ pt} \times 255.12\text{ pt}$):
- **Teto Vertical Seguro:** $y_1 \le 226.5\text{ pt}$ (garante respiro livre de pelo menos $12\text{ pt}$ antes do rodapé institucional).
- **Limite Horizontal Seguro:** $x_1 \le 433.0\text{ pt}$ (garante margem livre de pelo menos $20\text{ pt}$ antes da borda lateral direita).
- **Margem Esquerda Segura:** $x_0 \ge 15.0\text{ pt}$.

```bash
# Rodar auditoria na apresentacao compilada:
python scripts/audit_layout.py presentation_ceia.pdf
```

### Checklist Obrigatório de Pré-Commit / Pré-Entrega:
- [ ] **Código Isolado:** Todo trecho literal de código está encapsulado em `ceiacode` ou `ceiacodecompact` (zero código solto em texto corrido).
- [ ] **Rastreabilidade Completa:** Todo bloco de código cita explicitamente o caminho do arquivo e intervalo de linhas (`caminho/arquivo.ts:linhas`).
- [ ] **Syntax Highlighting Oficial:** Destaque de sintaxe ativo via `ceiavscode` nas cores do BrandBook CEIA (zero código preto monocromático).
- [ ] **Harmonia Tipográfica (8.2pt / 7.0pt):** Cartões de tópicos compactos utilizam `\fontsize{8.2pt}{10.2pt}\selectfont` para equilibrar a leitura com blocos de código em `7.0pt`.
- [ ] **Fundos Alinhados:** Caixas irmãs paralelas compartilham o mesmo `[equal height group=...]`.
- [ ] **Entrelinha Monumental da Capa:** Título da capa com `\fontsize{...}{...}\selectfont` explícito e quebras manuais controladas com `\\[3pt]`.
- [ ] **Auditoria PyMuPDF Verde:** Script `audit_layout.py` retorna exit code 0 com 0 extravasamentos.

---

## 📄 Licença e Créditos

Desenvolvido para o **Centro de Excelência em Inteligência Artificial (CEIA)** — Universidade Federal de Goiás (UFG), MCTI, FAPEG, EMBRAPII.  
Baseado estritamente no Manual de Identidade Visual CEIA (Goiânia, 2026).
