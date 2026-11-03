---
name: ceia-presentation
description: Use when authoring, designing, or editing slides for the CEIA (Centro de Excelência em Inteligência Artificial) Beamer template — layout selection, color rules, typography hierarchy, column ratios, stat metrics, TikZ pipelines, or blocks in presentation_ceia.tex.
---

# Guia Oficial do Construtor de Slides CEIA (Beamer 16:9 - Design System v3.0)

Template oficial desenvolvido com fidelidade estrita às diretrizes do **Manual de Uso da Marca CEIA (Centro de Excelência em Inteligência Artificial - Goiânia, 2026)** e concebido como um **Design System completo de apresentações (v3.0)** para **Pesquisa Científica, Inteligência Artificial e Engenharia de Software**.

---

## 🚀 Como Iniciar uma Nova Apresentação

**Nunca edite `CEIATeX-Presentation/presentation_ceia.tex` diretamente.** Ele é o showcase canônico do template.

Para iniciar uma apresentação dentro de um projeto isolado no workspace (`projetos/<nome_do_projeto>/`):

1. Crie a estrutura de diretórios e o arquivo `src/apresentacao.tex`:
```latex
\documentclass[aspectratio=169,t,xcolor=table]{beamer}
\usepackage[brazil]{babel}
\usepackage{booktabs}
\usepackage{listings}
\usepackage{tikz}
\usetikzlibrary{positioning, arrows.meta, shapes}
\usepackage{amsmath,amssymb}

% Carrega o tema oficial CEIA v3.0
\usetheme{Ceia}

\title{TÍTULO DA APRESENTAÇÃO}
\subtitle{SUBTÍTULO TÉCNICO OU INSTITUCIONAL}
\author{Nome do Autor ou Equipe}
\institute{Centro de Excelência em Inteligência Artificial -- UFG}
\date{Goiânia, 2026}

\begin{document}
...
\end{document}
```

2. Compile via PowerShell a partir da raiz do repositório:
```powershell
& .\bin\tectonic.exe -Z "search-path=CEIATeX-Presentation" projetos\<nome_do_projeto>\src\apresentacao.tex -o projetos\<nome_do_projeto>\build\
```

---

## 🎨 Paleta Cromática Institucional Obrigatória

Toda a coloração dos slides deve seguir rigorosamente as cores declaradas em `beamerthemeCeia.sty`:

| Cor TeX | HEX | RGB | Semântica de Uso em Engenharia & IA |
|---|---|---|---|
| `CEIADarkBlue` | `#1B3983` | `27, 57, 131` | Fundos escuros (`cover`, `closing`, `section`), títulos de alto impacto, gates de decisão humana |
| `CEIABlue` | `#1C4AB8` | `28, 74, 184` | Títulos primários dos slides, palavras-chave em código, bordas de cards |
| `CEIABrightBlue` | `#2866E5` | `40, 102, 229` | Agentes LLM, badges de ID (`ceiaspec`), números de métricas (`\ceiastat`) |
| `CEIAGreen` | `#0CD4AA` | `12, 212, 170` | Tools, linters, testes de integração, código adicionado (`\ceiaadded`), métricas destaque (`\bestmetric`) |
| `CEIATextDark` | `#1E293B` | `30, 41, 59` | Slate neutro oficial para texto corrido e máxima legibilidade |
| `CEIATextMuted` | `#64748B` | `100, 116, 139` | Eyebrow headers, comentários de código, legendas e metadados de rodapé |
| `CEIABorder` | `#E2E8F0` | `226, 232, 240` | Bordas sutis de cards e divisórias |
| `CEIABgSoft` | `#F8FAFC` | `248, 250, 252` | Fundo de cards modulares, linhas alternadas de tabelas |
| `CEIADarkIDE` | `#0F172A` | `15, 23, 42` | Fundo para blocos de código em dark mode (`ceiacodedark`) |

---

## 🔤 Tipografia Oficial: OpenType Inter e Actay Wide

- **Inter**: Família sans-serif oficial (carregada nativamente via `fontspec` pelo `inter.sty`).
  1. **Títulos Principais**: `\Large\bfseries\color{CEIADarkBlue}\MakeUppercase{...}` (Manual pág. 19: Inter Extra Bold ALL CAPS aplicado automaticamente pelo tema).
  2. **Subtítulos**: `\footnotesize\mdseries\color{CEIABlue}\MakeUppercase{...}` (Manual pág. 19: Inter Medium ALL CAPS aplicado automaticamente pelo tema).
  3. **Eyebrow Headers**: `\color{CEIABrightBlue}\fontsize{7.5}{9}\bfseries\MakeUppercase{...}` (Azul Elétrico no modo claro e `CEIAGreen` no modo escuro).
  4. **Corpo do Texto**: `\footnotesize` ou `\small` em `CEIATextDark` com `\raggedright` (hifenização automática é desativada por padrão).
- **Actay Wide**: Tipografia eventual de alto impacto para manifesto e encerramento (Manual pág. 20).
  - Use o comando vetorial `\ceiaweareceia[height=2.2cm]` no layout `statement`.

---

## 📐 Design System v3.0: Catálogo Completo de Componentes

Para evitar monotonia estrutural ("apenas caixas fechadas"), o v3.0 oferece componentes especializados:

### 1. Listas Hierárquicas Abertas (`ceiaitemize`)
Listas limpas, sem bordas de caixas ao redor, com espaçamento vertical respirável e marcadores com o DNA visual do CEIA:
- **1º Nível**: Mini-gota vetorial do CEIA em Azul Elétrico (`\ceiaminidrop`)
- **2º Nível**: Círculo sólido em Verde Menta (`\ceiaminicircle`)
- **3º Nível**: Traço fino em Azul Escuro (`\ceiaminidash`)

```latex
\begin{ceiaitemize}
    \item \textbf{Modelos Fundacionais Auditáveis}
    \begin{itemize}
        \item Treinamento sob soberania informacional
        \begin{itemize}
            \item Trilha de proveniência de dados ponta a ponta
        \end{itemize}
    \end{itemize}
    \item \textbf{Engenharia Orientada a Specs}
\end{ceiaitemize}
```

### 2. Passos Sequenciais de Processos (`\ceiastep`)
Para pipelines, algoritmos, cronogramas de execução e fluxos metodológicos:
```latex
\ceiastep{01}{Especificação Formal}{Definição de interfaces e contratos inequívocos.}
\ceiastep{02}{Execução por Agentes}{Delegação modular para LLMs com validação de AST.}
\ceiastep{03}{Homologação HITL}{Aprovação humana assistida por testes automatizados.}
```

### 3. Checklist de Auditoria e Requisitos (`ceiachecklist` & `\checkitem`)
Itens de verificação de requisitos com ícones vetoriais padronizados em geometria circular e cores estritamente derivadas da paleta oficial do CEIA (sem cores estranhas como laranja ou amarelo):
- `[ok]`: Verde Menta (`CEIAGreen`) com checkmark vetorial em `CEIADarkBlue`.
- `[warn]`: Azul Elétrico (`CEIABrightBlue`) com exclamação vetorial em `CEIADarkBlue`.
- `[fail]`: Azul Escuro (`CEIADarkBlue`) com cruz vetorial em `CEIADarkBlue`.
- `[info]`: Slate Neutro (`CEIATextMuted`) com ponto indicador em `CEIATextDark`.

```latex
\begin{ceiachecklist}
    \checkitem[ok]{Isolamento Criptográfico}{Hashes SHA-256 gerados para cada requisição.}
    \checkitem[ok]{Validação Sintática}{Schemas Zod com cobertura total em runtime.}
    \checkitem[warn]{Latência p99}{Fallback local ativado quando resposta externa $> 2.5\text{s}$.}
\end{ceiachecklist}
```

### 4. Comparação Lado a Lado (`ceiavs`) & Barras de Trade-off (`\ceiaprogress`)
Comparação estruturada entre duas abordagens ("Antes vs. Depois", "Legado vs. SDD"):
```latex
\ceiavs{Abordagem Legada (Ad-hoc)}{%
    \begin{itemize}
        \item Prompts soltos sem versionamento
        \item Parsing frágil de strings via regex
    \end{itemize}
}{Engenharia SDD (Padrão CEIA)}{%
    \begin{itemize}
        \item Contratos declarativos via Zod / Pydantic
        \item Structured Outputs com garantia formal
    \end{itemize}
}
\vspace{0.2em}
\ceiaprogress{94}{Conformidade com Critérios de Aceite}
\ceiaprogress[CEIAGreen]{100}{Aderência à LGPD & EU AI Act}
```

### 5. Arquitetura em Camadas (`\ceialayer`) & Linha do Tempo (`\ceiatimelinefour`)
Visualização de arquitetura de software em camadas horizontais empilhadas e linha do tempo de 4 milestones:
```latex
\ceialayer[CEIABrightBlue!8]{Camada 03: Orquestração}{LangGraph + Multi-Agente com snapshotting}
\ceialayer{Camada 02: Contratos}{JSON Schema, Pydantic v2 e validação em runtime}
\ceialayer{Camada 01: Execução}{Runners assíncronos isolados em sandbox}

\vspace{-0.1cm}
\ceiatimelinefour{Q1 2024}{Contratos Zod}{Q2 2024}{AST Validator}{Q3 2024}{Multi-Agent}{Q4 2024}{Release v3.0}
```

### 6. Rigor Científico e Teoremas (`ceiatheorem` & `ceiaformula`)
Para formulações matemáticas, otimizações, hipóteses e definições formais:
```latex
\begin{ceiatheorem}{Convergência Sob Gramática Formal}
    Dada uma gramática $G$ e um modelo $P_\theta$, a amostragem mascarada restringe o suporte à linguagem $L(G)$ com probabilidade $1$.
\end{ceiatheorem}

\begin{ceiaformula}{Otimização com Regularização KL}
    \[
        \mathcal{L}(\theta) = -\mathbb{E}\left[\log P_\theta(y \mid x)\right] + \lambda \, D_{\text{KL}}(P_\theta \,||\, P_{\text{ref}})
    \]
    \vspace{1pt}
    {\scriptsize\color{CEIATextMuted} Onde $\theta$ são os parâmetros adaptados e $P_{\text{ref}}$ o modelo congelado.}
\end{ceiaformula}
```

### 7. Cards Modulares Generalistas (`ceiacards` & `\ceiacarditem`) & Pilares
Ambiente flexível de cartões com altura perfeitamente sincronizada (`equal height group`), aceitando dinamicamente **2, 3 ou 4 colunas**:
```latex
% Layout de 3 colunas (padrão)
\begin{ceiacards}[3]
    \ceiacarditem[1]{Pesquisa Aplicada}{Algoritmos estado-da-arte com publicação de impacto.}
    \ceiacarditem[2]{Governança \& Ética}{Trilhas auditáveis e total conformidade com a LGPD.}
    \ceiacarditem[3]{Engenharia de IA}{Sistemas escaláveis e observabilidade ponta a ponta.}
\end{ceiacards}

% Ou para 2 colunas amplas: \begin{ceiacards}[2] ... \end{ceiacards}
% Ou para 4 colunas de pipeline: \begin{ceiacards}[4] ... \end{ceiacards}
% O comando \ceiapillars{1}{T1}{D1}{2}{T2}{D2}{3}{T3}{D3} é mantido como atalho canônico.
```

### 8. Divisão Inteligente de Conteúdo em Grade (`\ceiasplit`)
Divisão de slide em duas colunas sem necessidade de cálculos manuais de `columns`:
```latex
\ceiasplit[0.48]{%
    % Coluna da esquerda (48% largura útil)
    \begin{ceiacard}{Contexto} ... \end{ceiacard}
}{%
    % Coluna da direita (calculada automaticamente com compensação de gutter)
    \begin{ceiacard}{Solução} ... \end{ceiacard}
}
```

### 9. Otimização de Densidade e Espaço Vertical (`ceiadense` & `ceiaitemizecompact`)
Para slides com alto volume de texto ou elementos múltiplos, previna `Overfull \vbox` sem reescrever o conteúdo:
```latex
\begin{ceiadense}
    \begin{ceiaitemizecompact}
        \item Primeiro tópico conciso com entrelinha reduzida
        \item Segundo tópico com respiro compacto padronizado
    \end{ceiaitemizecompact}
\end{ceiadense}
```

### 10. Metadados e Customização do Rodapé (`\ceiafooter`)
Permite alterar a chancela do rodapé em nível de apresentação ou por slide:
```latex
\ceiafooter{CEIA Academy --- Programa de Residência em IA}
% Se omitido, utiliza por padrão a afiliação do autor principal.
```

### 11. Biblioteca de Gráficos Nativos e Responsivos em TikZ
Gráficos 100% vetoriais, estritamente alinhados à paleta cromática do CEIA:

#### A. Barras Horizontais com Metas e Benchmarks (`\ceiahbar`)
```latex
\ceiahbar[CEIAGreen]{Claude 3.5 Sonnet}{92.4}{100}{\%}
\ceiahbar[CEIABrightBlue]{GPT-4o}{90.2}{100}{\%}
\ceiahbar[CEIABlue]{DeepSeek-Coder-V2}{88.7}{100}{\%}
\ceiahbar[CEIATextMuted]{Llama-3-70B Local}{82.6}{100}{\%}
```

#### B. Barras Verticais Comparativas (`\ceiavbarsfour` & `\ceiavbarsthree`)
```latex
% 4 Barras com categorias, valores e grid sutil
\ceiavbarsfour{42}{Q1 2025}{65}{Q2 2025}{81}{Q3 2025}{96}{Q4 2025}

% Ou para 3 períodos: \ceiavbarsthree{55}{Fase 1}{78}{Fase 2}{94}{Fase 3}
```

#### C. Gráfico de Rosca / Donut de Distribuição (`\ceiadonutthree` & `\ceiadonuttwo`)
```latex
\ceiadonutthree{70}{CEIABrightBlue}{20}{CEIAGreen}{10}{CEIADarkBlue}{1.5M\\Tokens}
```

#### D. Curva de Treinamento e Convergência (`\ceiatrainingchart`)
```latex
\ceiatrainingchart{(0.5, 95) (1.5, 60) (2.5, 38) (3.5, 22) (4.5, 14)}% Loss
                   {(0.5, 30) (1.5, 75) (2.5, 88) (3.5, 94) (4.5, 97)} % Acurácia
```

### 12. Pílulas Semânticas Inline (`\ceiatag`)
Tags modernas para tecnologias, tiers e status:
```latex
\ceiatag[CEIABlue]{v3.0} \ceiatag[CEIAGreen]{PROD} \ceiatag{XeTeX}
```

### 13. Janela de IDE e Code Diffs (`\begin{ceiacode}`)
Caixa simulando janela de editor de código com highlight de diffs:
```latex
\begin{frame}[fragile]{CONTRATOS DE DADOS E CODE DIFF}{REFACTORING E VALIDAÇÃO VIA ZOD}
\begin{ceiacode}[language=Java]{packages/core/src/agentContract.ts}
export const AgentVerdictSchema = z.object({
  specId: z.string(),
(*@\ceiaremoved{- approved: z.boolean(), // obsoleto: faltava trilha de auditoria}@*)
(*@\ceiaadded{+ status: z.enum(["APPROVED", "BLOCKED", "NEEDS\_REVISION"]),}@*)
(*@\ceiaadded{+ auditHash: z.string().min(32), // conformidade EU AI Act Art. 12}@*)
  issues: z.array(z.string()).default([]),
});
\end{ceiacode}
\end{frame}
```

### 14. Especificações SDD (`\ceiaspec`)
Cards estruturados para rastreabilidade de requisitos técnicos e governança:
```latex
\ceiaspec{REQ-0101}{Isolamento Criptográfico e Trilha Auditável}{CONCLUÍDO}
\ceiaspec{REQ-0102}{Contratos de Dados com Schemas Zod}{CONCLUÍDO}
\ceiaspec{REQ-0103}{Fallback Determinístico com Retry Bounded}{EM EXECUÇÃO}
```

### 15. Prompts de Agentes e Políticas (`ceiaprompt`)
Contêiner dark institucional estilizado para system prompts, personas e diretrizes de agentes:
```latex
\begin{ceiaprompt}[ROLE: ORCHESTRATOR]{Diretrizes do Coordenador de Execução}
    Você é o orquestrador do pipeline de decisão autônoma. Decomponha o objetivo em etapas atômicas verificáveis. Nunca execute chamadas destrutivas sem aprovação no gate humano G1.
\end{ceiaprompt}
```

### 16. Indicadores Numéricos de Impacto (`\ceiastatfour`, `\ceiastatthree`, `\ceiastat`)
Bloco de métricas executivas para resultados quantitativos de alta visibilidade com centralização geométrica perfeita:
```latex
% Recomendado: 4 métricas com espaçamento e alinhamento geométrico perfeito via TikZ
\ceiastatfour{99.1\%}{F1-Score Geral}{4.2x}{Throughput}{18ms}{Inferência}{0}{Falhas Críticas}

% Ou para 3 métricas de grande destaque:
\ceiastatthree{99.1\%}{Precisão}{4.2x}{Aceleração}{18ms}{Latência}
```

### 17. Submarcas Oficiais e Régua de Parceiros (`\ceiasubmarca` e `\ceiaregua`)
Submarcas com espaçamento proporcional de segurança ($2x$) e régua institucional vetorial autêntica:
```latex
\begin{columns}[c]
    \column{0.48\textwidth}
    \begin{ceiacard}{Unidade Educacional}
        \centering\ceiasubmarca{Academy}\par
        {\scriptsize Formação técnica avançada em IA.}
    \end{ceiacard}
    \column{0.48\textwidth}
    \begin{ceiacard}{Internacionalização}
        \centering\ceiasubmarca{Global}\par
        {\scriptsize Cooperação científica global.}
    \end{ceiacard}
\end{columns}
\par\vspace{0.2em}
\begin{ceiacard}{Régua Institucional de Parceiros}
    \centering\ceiaregua[width=0.75\textwidth]\par
\end{ceiacard}
```

### 18. Slide de Encerramento Oficial (`\setLayout{closing}`)
O layout de encerramento projeta a textura oficial de ondas de pontos luminosos (*halftone wave*) com gradiente radial no fundo, posiciona "OBRIGADO :)" como protagonista central e a régua institucional na base:
```latex
\setLayout{closing}
\begin{frame}[noframenumbering]
    \vspace{0.20\paperheight}
    \begin{center}
        {\fontsize{38}{44}\selectfont\bfseries\color{white} OBRIGADO :)}\par\vspace{0.7cm}
        {\fontsize{11}{14}\selectfont\color{CEIAGreen}\bfseries ceia.ufg.br \quad\textbar\quad contato@ceia.ufg.br}\par\vspace{0.35cm}
        {\fontsize{8.5}{11}\selectfont\color{white!70} Centro de Excelência em Inteligência Artificial --- UFG\par}
    \end{center}
\end{frame}
```

### 19. Tabelas Executivas e Marcadores Vetoriais de Status (`ceiamatrixtable`, `ceiadatatable`)
Tabelas com zebra-striping institucional suave (`CEIABgSoft`), linhas de grade executivas (`booktabs`) e marcadores de conformidade vetoriais:
- `\matrixok`: Círculo verde com checkmark institucional.
- `\matrixwarn`: Círculo azul com ponto de exclamação.
- `\matrixfail`: Círculo cinza com barra de não-conformidade.
- `\bestmetric{valor}`: Destaque em fundo verde-menta suave com texto escuro em negrito.

```latex
\begin{ceiamatrixtable}{l c c c}
    \textbf{Capacidade Avaliada} & \textbf{Abordagem Legada} & \textbf{Cloud Proprietária} & \textbf{Padrão CEIA} \\
    \midrule
    \ceiaicon{shield}\hspace{4pt} Governança \& LGPD & \matrixfail & \matrixwarn & \matrixok (Local) \\
    \ceiaicon{code}\hspace{4pt} Contratos Zod Tipados & \matrixfail & \matrixfail & \matrixok (Formal) \\
    \ceiaicon{server}\hspace{4pt} Soberania de Dados & \matrixwarn & \matrixfail & \matrixok (100\%) \\
    \ceiaicon{clock}\hspace{4pt} Latência de Inferência & 3.2s & 1.8s & \bestmetric{0.45s} \\
\end{ceiamatrixtable}
```

Para tabelas com texto descritivo longo que necessite de quebra automática de linha, utilize `ceiadatatable` com colunas `p{largura}`:
```latex
\begin{ceiadatatable}{l c p{8.2cm}}
    \textbf{Módulo} & \textbf{Status} & \textbf{Diretriz Operacional do Sistema} \\
    \midrule
    \ceiaicon{brain}\hspace{3pt} Runtime LLM & \bestmetric{ATIVO} & Execução local com quantização 4-bit para isolamento. \\
    \ceiaicon{database}\hspace{3pt} Base Vetorial & \bestmetric{ATIVO} & Indexação HNSW de embeddings com rotação de chaves. \\
\end{ceiadatatable}
```

### 20. DSL Declarativa de Multi-Agent Pipeline (`\ceiapipelinefour`, `\ceiapipelinethree`)
Desenhe fluxos e pipelines multi-agente de forma semântica sem calcular coordenadas manuais em TikZ.
Roles suportados:
- `agent`: Fundo azul suave com texto escuro institucional.
- `gate`: Fundo azul marinho sólido (`CEIADarkBlue`) com texto branco para portais de validação humana (HITL).
- `tool`: Fundo verde-menta (`CEIAGreen!20`) com texto escuro para linters, bancos e ferramentas.
- `db`: Fundo cinza suave (`CEIABgSoft`) com borda sutil.

```latex
% Pipeline de 4 nós:
\ceiapipelinefour{Discovery\\Agent}{agent}{[G1] Decision\\Gate}{gate}{Software\\Architect}{agent}{Automated\\Deploy}{tool}

% Ou para 3 nós:
\ceiapipelinethree{Elicitação}{agent}{Auditoria}{gate}{Deploy}{tool}
```

### 21. Biblioteca Nativa de Ícones Vetoriais TikZ (`\ceiaicon`)
Ícones 100% vetoriais em TikZ puro, desenhados para métricas, tabelas, cards e tópicos. Não requer pacotes externos e escala de forma suave:
Sintaxe: `\ceiaicon[cor][escala]{nome}` (Padrão: cor=`CEIABrightBlue`, escala=`1.0`).
- `\ceiaicon{brain}`: Rede neural / IA / Modelos fundacionais.
- `\ceiaicon{shield}`: Segurança / Governança / LGPD.
- `\ceiaicon{database}`: Banco de dados / Base vetorial / Storage.
- `\ceiaicon{code}`: Sintaxe `< / >` / Contratos de código.
- `\ceiaicon{server}`: Servidores em rack / Soberania de infraestrutura.
- `\ceiaicon{user}`: Validador humano / HITL / Papéis de usuário.
- `\ceiaicon{clock}`: Relógio / Latência / Tempo de resposta.
- `\ceiaicon{lock}`: Cadeado / Criptografia / Trilha imutável.

```latex
\ceiaicon{brain} Rede Neural \quad
\ceiaicon[CEIAGreen]{shield} Segurança Homologada \quad
\ceiaicon[CEIADarkBlue][1.2]{database} Armazenamento Vetorial
```

### 22. Linha do Tempo e Roadmap Modular (`\ceiaroadmapthree`, `\ceiaroadmapfour`)
Cronograma horizontal com marcos cronológicos e indicação de status visual (Concluído = Verde, Em Andamento = Azul, Planejado = Muted):

```latex
% 3 Fases:
\ceiaroadmapthree{FASE 1 (CONCLUÍDO)}{Elicitação \& Contratos}{FASE 2 (EM ANDAMENTO)}{Orquestração Local}{FASE 3 (PLANEJADO)}{Auditoria \& Escala}

% 4 Fases:
\ceiaroadmapfour{Q1 2026}{Especificação}{Q2 2026}{Protótipo Local}{Q3 2026}{Homologação}{Q4 2026}{Lançamento}
```

### 23. Banners Executivos Institucionais (`\ceiabanner`)
Avisos, destaques e callouts horizontais elegantes para notas de conformidade, premissas de projeto e sínteses executivas:
Sintaxe: `\ceiabanner[tipo]{Título}{Mensagem}`
- `[ok]`: Tarja verde com fundo menta sutil para conformidade assegurada e garantias atendidas.
- `[warn]`: Tarja azul elétrico com fundo azul sutil para alertas de governança e atenções de arquitetura.
- `[alert]`: Tarja vermelha para avisos críticos de risco ou violação de contrato.
- `[info]` (ou omitido): Tarja azul padrão para sínteses e teses centrais.

```latex
\ceiabanner[ok]{Conformidade Legal Assegurada}{Todas as métricas atendem integralmente ao Art. 12 do EU AI Act.}
\ceiabanner[warn]{Atenção}{Modelos externos não devem receber dados protegidos pela LGPD.}
\ceiabanner[info]{Tese Central}{Arquiteturas baseadas em contratos reduzem o tempo de depuração em até 70\%.}
```

### 24. Layout Canônico de Figura Lateral (`ceiasidefigure`)
Ambiente de composição canônica: figura ou diagrama técnico emoldurado à esquerda com legenda formal, e pontos explicativos ou bullets à direita com cálculo automático de proporções:
Sintaxe: `\begin{ceiasidefigure}[fracao_largura]{caminho_imagem}{legenda_figura} ... \end{ceiasidefigure}` (Padrão de fração: `0.46`).

```latex
\begin{ceiasidefigure}{lib/logos/ceia_simbolo.pdf}{Símbolo Oficial CEIA}
    {\small\bfseries\color{CEIADarkBlue} Princípios de Identidade Visual}\par\vspace{0.3em}
    \begin{itemize}
        \setlength{\itemsep}{0.3em}
        \item \textbf{Cérebro Conectado}: Sinergia entre pesquisa e ecossistema produtivo.
        \item \textbf{Geometria Oficial}: Arcos com raio $R = W/2$ e ângulo reto de $90^\circ$.
        \item \textbf{Área de Proteção}: Distância mínima de $2x$ mantida em todas as aplicações.
    \end{itemize}
\end{ceiasidefigure}
```

### 25. Agenda e Sumário Institucional (`\tableofcontents` estilizado)
O sumário oficial do CEIA estiliza automaticamente chamadas a `\tableofcontents` com círculos numerados em Azul Elétrico (`CEIABrightBlue`) e títulos em maiúsculas com a tipografia Inter Extra Bold:
> [!TIP]
> Em apresentações executivas, declare apenas de **3 a 5 grandes capítulos temáticos** com `\section{...}` para garantir uma agenda limpa, elegante e sem quebras verticais.

```latex
\begin{frame}{AGENDA DA APRESENTAÇÃO}{ESTRUTURAÇÃO DOS GRANDES CAPÍTULOS}
    \vspace{0.8em}
    \begin{center}
    \begin{minipage}{0.85\linewidth}
        \tableofcontents
    \end{minipage}
    \end{center}
\end{frame}
```

---

### 26. Sistema de Sumarização e Conclusões Moduláveis (Adaptável ao Volume de Texto)
Para solucionar o clássico problema do Beamer (pouco texto deixa o slide vazio; muito texto estoura o layout), o CEIATeX oferece 3 padrões de síntese executiva:

#### A. Modelo Punchy / Hero (ceiasummarypunch) — Para Pouco Texto / 1 Grande Veredito
Um card monumental com tipografia expandida, fundo nobre (dark com CEIADarkBlue ou light com CEIABgSoft), borda em Verde Menta (CEIAGreen) e pílulas semânticas:
`latex
\begin{ceiasummarypunch}[dark]{Veredito Consolidado}{Arquitetura Homologada para Produção}
    A migração para orquestração declarativa garantiu estabilidade determinística e 100\% de tipagem.
    \par\vspace{0.6em}
    \ceiatag[ok]{\ceiaicon[white][0.7]{shield}\hspace{2pt} Conformidade LGPD}\hspace{6pt}
    \ceiatag[info]{\ceiaicon[white][0.7]{server}\hspace{2pt} On-Premise}
\end{ceiasummarypunch}
`

#### B. Modelo Split (ceiasummarysplit) — Para Texto Médio (Veredito + 3 Evidências)
Layout assimétrico: card executivo em CEIADarkBlue à esquerda e desdobramentos modulares à direita:
`latex
\begin{ceiasummarysplit}[0.38]{Veredito Final}{99.4\%}{Sistema validado em estresse.}{shield}
    \ceiasplititem[CEIABrightBlue]{Orquestração}{Fallback automático para modelos locais.}
    \ceiasplititem[CEIAGreen]{Eficiência}{Redução de 68\% no consumo de tokens.}
    \ceiasplititem[CEIADarkBlue]{Observabilidade}{Trilhas OpenTelemetry fim a fim.}
\end{ceiasummarysplit}
`

#### C. Modelo Compacto (\ceiacompactitem) — Para Grande Volume de Texto (4 a 6 Pontos)
Distribuição em 2 colunas balanceadas com marcadores vetoriais (\matrixok, \matrixwarn), sem estourar o slide:
`latex
\begin{columns}[T]
    \begin{column}{0.485\textwidth}
        \ceiacompactitem{\matrixok}{Contratos Tipados}{Validação estrita em tempo de compilação.}
        \ceiacompactitem{\matrixok}{HITL Gates}{Aprovação mandatória antes do deploy.}
    \end{column}
    \begin{column}{0.485\textwidth}
        \ceiacompactitem{\matrixok}{Latência Sob SLA}{Tempo de inferência p95 < 180ms.}
        \ceiacompactitem{\matrixwarn}{Cache Semântico}{Homologação final para economia de tokens.}
    \end{column}
\end{columns}
`

---

### 27. Slides de Transição de Seção (`\ceiasectionframe`) e Fundo Suave (`\setLayout{soft}`)

#### A. Transição Canônica de Capítulos (`\ceiasectionframe`)
Para abrir novos capítulos com identidade visual robusta e respiração tipográfica:
- Fundo nobre `CEIADarkBlue` com iluminação radial suave.
- **Padrão Oficial de Gotas do CEIA (Manual pág. 23)** no canto inferior direito.
- Tag de capítulo em pílula `CAPÍTULO XX`, título em caixa alta com espaçamento vertical generoso, barra de acento em verde menta (`CEIAGreen`) e subtítulo descritivo.

```latex
\section{ARQUITETURA \& MULTI-AGENTE}
\ceiasectionframe{02}{ARQUITETURA \& MULTI-AGENTE}{Orquestração de Agentes, Contratos Formais e HITL Gates}
```

#### B. Fundo Suave Institucional (`\setLayout{soft}`)
Aplica o fundo suave `#F8FAFC` (`CEIABgSoft`), ideal para visualização de cards, tabelas e submarcas com contraste agradável e moderno:
```latex
\setLayout{soft}
\begin{frame}{TÍTULO DO SLIDE}{SUBTÍTULO}
    % Conteúdo sobre fundo suave
\end{frame}
\setLayout{content} % Retorna ao fundo branco padrão
```

---

## 📏 Orçamento Rígido de Altura Vertical (Vertical Clearance)

> [!IMPORTANT]
> A área útil vertical de um frame Beamer 16:9 é de **~5.5 cm** entre o cabeçalho e a `footline`.
> Mantenha sempre folga mínima de **~12 pt (4.2 mm)** em relação à linha do rodapé.

---

## 🛡️ Regras de Ouro de Compilação no Beamer (XeTeX / Tectonic)

1. **`[fragile]` Obrigatório para Código:** Todo frame com `\begin{ceiacode}` DEVE ter `[fragile]`.
2. **Escapes em Code Diffs:** Caracteres especiais como `_` dentro de `\ceiaadded` ou `\ceiaremoved` DEVEM ser escapados como `\_`.
3. **`\textbar` e não `\vert` em Texto:** Em modo texto puro, use `\textbar` para barras divisórias verticais.
4. **Zero Overfull:** A compilação no `tectonic` deve passar com `0 Overfull \vbox` e `0 Overfull \hbox`.
