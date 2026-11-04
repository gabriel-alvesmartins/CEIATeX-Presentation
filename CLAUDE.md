# CLAUDE.md - CEIATeX Presentation Design System

> Canonical guidelines and operational instructions for Claude Code when authoring, modifying, or compiling LaTeX Beamer presentations using the official CEIA theme (`beamerthemeCeia.sty`).

---

## 🚀 Build & Compilation Commands

### 1. Tectonic (Recommended — Fast & Self-Contained)
```bash
# Compile starter template
tectonic starter.tex

# Compile reference showcase (28 slides)
tectonic presentation_ceia.tex

# Using project scripts (auto-detects local compiler)
# Windows PowerShell:
.\compile.ps1 starter.tex

# Linux / macOS Bash:
./compile.sh starter.tex
```

### 2. External Workspace Compilation
When compiling a `.tex` file located outside this repository, pass the search path to `CEIATeX-Presentation`:
```bash
tectonic -Z "search-path=/path/to/CEIATeX-Presentation" presentation.tex -o build/
```

### 3. XeLaTeX Traditional
```bash
xelatex -interaction=nonstopmode -synctex=1 starter.tex
```

---

## 📁 Mandatory Project Isolation Standards

When creating new presentations for the user, NEVER place working `.tex` files or output PDFs loose in the repository root. Follow the isolated project structure:

```text
projetos/<project_name>/
├── src/        # Presentation source (e.g. apresentacao.tex)
├── figs/       # Figures, diagrams, and project-specific assets
├── build/      # Compiled PDF (apresentacao.pdf) — keep root and src/ clean!
└── docs/       # User briefing, notes, and requirements
```

### Mandatory Rules for Claude Code:
1. **Root is Read-Only for Works:** `CEIATeX-Presentation` root holds only the canonical template engine and showcase files (`presentation_ceia.tex`, `starter.tex`, `beamerthemeCeia.sty`, `lib/`).
2. **Compile to `build/`:** Always compile using the output directory flag:
   `tectonic -Z "search-path=CEIATeX-Presentation" projetos/<project_name>/src/apresentacao.tex -o projetos/<project_name>/build/`
   Or:
   `.\compile.ps1 projetos/<project_name>/src/apresentacao.tex -OutputDir projetos/<project_name>/build/`
3. **Context Firewall:** Never read or inspect other folders inside `projetos/*` unless the user explicitly requests it.

---

## 🛡️ Mandatory Design Invariants (Non-Negotiable)

Every slide generated or edited MUST strictly adhere to these rules:

1. **Zero Dark Mode in Content Slides:**
   - Content slides (`\setLayout{content}` or `\setLayout{soft}`) MUST use light backgrounds (`white` or `CEIABgSoft` `#F8FAFC`).
   - `CEIADarkBlue` (`#1B3983`) is **strictly reserved** for:
     - Cover slide (`\setLayout{cover}`)
     - Section / Chapter dividers (`\setLayout{section}` and `\setLayout{section-bottom}`)
     - Closing slide (`\setLayout{closing}`)
   - **NEVER** create dark boxes or cards (`colback=CEIADarkBlue`) inside content slides.

2. **WCAG AAA Color Contrast (> 7:1):**
   - **NO pastel backgrounds:** Never use low-opacity pastel fills like `\col!15` or washed out pills.
   - **NO white icons on light backgrounds:** Never write `\ceiaicon[white]` on light surfaces.
   - **Chips & Badges (`\ceiachip`):** Always use `fill=white`, saturated border (`\chipcol!85`), full-color saturated icons (`CEIAGreen`, `CEIABrightBlue`, `CEIADarkBlue`), and bold text in `CEIADarkBlue`.

3. **Closed Vector Geometry for TikZ Icons:**
   - The `shield` icon has a classic crest silhouette with a sharp bottom tip at `(0, -0.22)` and a bold checkmark centered in the body. Never use truncated semi-circles.

4. **Continuous Vertical Rhythm in Cards (Anti-Vacuum):**
   - In `ceiasummarypunch`, keep all elements in the continuous flow of the card.
   - Spacing: **7pt to 8pt** between Chapeau and Title; **8pt to 10pt** between Title and Body; **11pt to 12pt** before Status Chips.

5. **Single-Row Chip Distribution:**
   - Always spread chips horizontally in a single row using `\hfill`. Never let a lone chip wrap awkwardly to a second line.

---

## 🎨 Official Palette Macros

| Macro | Hex | Usage |
|---|---|---|
| `CEIADarkBlue` | `#1B3983` | Covers, chapter frames, closing, primary titles, HITL gates |
| `CEIABlue` | `#1C4AB8` | Structural accents, headers, subtitles |
| `CEIABrightBlue` | `#2866E5` | LLM agents, metrics numbers, active chips |
| `CEIAGreen` | `#0CD4AA` | Success highlights, `\bestmetric`, tools, chapters label |
| `CEIATextDark` | `#1E293B` | Body text running copy (high legibility slate) |
| `CEIATextMuted` | `#64748B` | Eyebrow headers, captions, metadata footer |
| `CEIABorder` | `#E2E8F0` | Card borders and structural dividers |
| `CEIABgSoft` | `#F8FAFC` | Light soft background for modular cards and zebra tables |

---

## 🧩 Syntax Cheat Sheet

### Structure
```latex
\documentclass[aspectratio=169,t,xcolor=table]{beamer}
\usepackage{amsmath,amssymb}
\usetheme{Ceia}

\title{TITLE}
\subtitle{SUBTITLE}
\author{Author}
\institute{CEIA -- UFG}
\date{2026}

\begin{document}
% Slides go here
\end{document}
```

### Layout Switcher
Call `\setLayout{<layout>}` before `\begin{frame}`:
- `cover`: Institutional dark blue with parametric drops.
- `content`: Clean white with top header line and footer metadata.
- `section` / `section-right`: Section divider with vertical drops on the right.
- `section-bottom`: Section divider with horizontal drops at the bottom.
- `soft`: Soft `#F8FAFC` background for cards.
- `closing`: Final slide with `OBRIGADO :)` and institutional contacts.

### Key Components
```latex
% 1. Modular Cards (2, 3, or 4 columns)
\begin{ceiacards}[3]
    \ceiacarditem[1]{Title 1}{Description text.}
    \ceiacarditem[2]{Title 2}{Description text.}
    \ceiacarditem[3]{Title 3}{Description text.}
\end{ceiacards}

% 2. Declarative Multi-Agent Pipeline
% Roles: agent (blue), gate (navy HITL), tool (mint), db (slate)
\ceiapipelinethree{Discovery}{agent}{[G1] Gate}{gate}{Deploy}{tool}

% 3. Executive Matrix Table
\begin{ceiamatrixtable}{l c c c}
    \textbf{Item} & \textbf{Legacy} & \textbf{Cloud} & \textbf{CEIA} \\
    \midrule
    Governance & \matrixfail & \matrixwarn & \matrixok \\
    Latency & 3.2s & 1.4s & \bestmetric{120ms} \\
\end{ceiamatrixtable}

% 4. Callout Banners
\ceiabanner[ok]{Title}{Success message.}
\ceiabanner[warn]{Title}{Warning message.}
\ceiabanner[info]{Title}{Informational message.}

% 5. Hero Executive Summary (Punchy Card)
\begin{ceiasummarypunch}{CHAPEAU CATEGORY}{Main Headline Title}
    Body paragraph summarizing the verdict.
    \par\vspace{12pt}
    \ceiachip[CEIAGreen]{shield}{Chip 1}\hfill
    \ceiachip[CEIABrightBlue]{server}{Chip 2}\hfill
    \ceiachip[CEIADarkBlue]{clock}{Chip 3}
\end{ceiasummarypunch}

% 6. Chapter Divider Frame
\ceiasectionframe{02}{CHAPTER TITLE}{Descriptive Subtitle}

% 7. Native TikZ Icons (\ceiaicon[color][scale]{name})
% Available: brain, shield, database, code, server, user, clock, lock
\ceiaicon{shield}
\ceiaicon[CEIAGreen][1.2]{brain}
```
