# Diretrizes Invariantes de Design CEIA (CEIATeX)

Este documento estabelece as regras universais de design, contraste e diagramação para todas as apresentações baseadas no tema CEIATeX (`CEIATeX-Presentation`). Todos os agentes de IA (Google Antigravity, Claude Code, Cursor, Copilot) operando neste repositório ou utilizando este tema devem seguir estritamente estes invariantes.

---

## 1. Padrão Estrito de Modo Claro (Zero Dark Mode em Conteúdo)
- **Superfícies de Conteúdo Claras:** Todos os slides de conteúdo, síntese técnica, métricas, tabelas, código e diagramas devem utilizar exclusivamente superfícies claras:
  - Fundo principal: `white` (#FFFFFF) ou `CEIABgSoft` (#F8FAFC).
  - Bordas de caixas: `CEIABorder` (#E2E8F0) com frisos institucionais (`borderline west`).
- **Escopo Exclusivo do Modo Escuro:** O fundo escuro nobre (`CEIADarkBlue`, #1B3983) é **estritamente restrito** a:
  - Slide de Abertura / Capa (`\setLayoutCover` ou `\setLayout{cover}`).
  - Slides de Seção / Divisores de Capítulo (`\setLayoutSection` e `\setLayoutSectionBottom` ou `\ceiasectionframe`).
  - Slide de Conclusão / Encerramento (`\setLayoutClosing` ou `\setLayout{closing}`).
- **Proibição em Cards Internos:** É terminantemente proibido utilizar caixas ou blocos com `colback=CEIADarkBlue` dentro de slides de conteúdo claro, para preservar a harmonia e o respiro do deck.

---

## 2. Acessibilidade e Contraste Cromático (Mínimo WCAG AAA > 7:1)
- **Proibição de Pastéis Desbotados:** Fica expressamente vedado o uso de fundos leitosos ou pastéis de baixa opacidade (como `\ceiatagcol!15`).
- **Proibição de Ícones Brancos sobre Fundos Claros:** NUNCA renderize símbolos ou ícones em branco (`\ceiaicon[white]`) sobre superfícies brancas ou claras.
- **Estrutura de Chips e Badges (`\ceiachip`):**
  - Fundo: `fill=white` nítido.
  - Borda: Saturada na cor oficial da marca (`\chipcol!85`).
  - Ícone: Renderizado na cor plena oficial (`CEIAGreen`, `CEIABrightBlue`, `CEIADarkBlue`), atingindo contraste superior a 7:1.
  - Tipografia: Sempre em `CEIADarkBlue` (#1B3983) com peso bold.
- **Cores de Texto:** Textos sobre fundo claro devem utilizar exclusivamente `CEIADarkBlue` (#1B3983) para títulos/destaques e `CEIATextDark` (#1E293B) para corpo.

---

## 3. Geometria Icônica Vetorial Fechada
- Todos os ícones vetoriais desenvolvidos em TikZ (`\ceiaicon`) devem possuir traçados e silhuetas completas e fechadas.
- O ícone de escudo (`shield`) deve obrigatoriamente utilizar a silhueta clássica de crista com ponta inferior nítida em `(0, -0.22)` e checkmark bold perfeitamente centrado no bojo, evitando geometrias semicirculares que possam parecer "cortadas" ou "incompletas" em escalas reduzidas (8pt a 12pt).

---

## 4. Ritmo Vertical em Caixas de Destaque (Anti-Vácuo)
- Em componentes compostos (como `ceiasummarypunch`), **não fragmente** o conteúdo entre as opções `title={...}` e `after title={...}` do `tcolorbox`, pois os espaçamentos internos nativos da biblioteca (`middle`, `boxsep`) criam vácuos vazios no meio da caixa.
- Todo o conteúdo deve ser diagramado no fluxo contínuo da caixa com proporções tipográficas balanceadas:
  - Distância entre Chapéu e Título Principal: **7pt a 8pt**.
  - Distância entre Título Principal e Parágrafo Descritivo: **8pt a 10pt**.
  - Distância entre Parágrafo e Fileira de Chips: **11pt a 12pt**.

---

## 5. Distribuição Horizontal e Anti-Crowding
- **Linha Única para Tags:** Grupos de pílulas ou chips (`\ceiachip`) devem ser distribuídos horizontalmente em linha única via `\hfill` ou grids calculados. NUNCA permita que um chip isolado quebre para a linha seguinte de forma assimétrica.
- **Princípio Anti-Crowding em Slides de Síntese:** Um slide dedicado a uma grande conclusão executiva ("Hero Summary") deve conter unicamente o card monumental com margens nobres, sem dividir o espaço vertical com banners ou notas adicionais.
