#!/usr/bin/env bash
# Instalador Universal de Skills e Regras de IA para o Tema CEIATeX (Linux/macOS)
set -e

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET="${1:-all}"

echo "=========================================================="
echo "  Instalador de IA: Suíte Beamer CEIA Design System v3.4   "
echo "=========================================================="
echo "Diretorio do template detectado: $REPO_ROOT"
echo ""

# 1. Google Antigravity
if [ "$TARGET" = "all" ] || [ "$TARGET" = "antigravity" ]; then
    ANTIGRAVITY_DIR="$HOME/.gemini/config/skills/ceia-presentation"
    mkdir -p "$ANTIGRAVITY_DIR"
    SOURCE_SKILL="$REPO_ROOT/.agents/skills/ceia-presentation/SKILL.md"
    if [ -f "$SOURCE_SKILL" ]; then
        sed "s|\$CEIA_TEMPLATE = \".*\"|\$CEIA_TEMPLATE = \"$REPO_ROOT\"|g" "$SOURCE_SKILL" > "$ANTIGRAVITY_DIR/SKILL.md"
        echo "[OK] Google Antigravity: Skill global instalada em $ANTIGRAVITY_DIR/SKILL.md"
    fi
fi

# 2. Claude Code
if [ "$TARGET" = "all" ] || [ "$TARGET" = "claude" ]; then
    if [ -f "$REPO_ROOT/CLAUDE.md" ]; then
        echo "[OK] Claude Code: Guia canônico ativo em $REPO_ROOT/CLAUDE.md"
        if [ -d "$HOME/.claude" ]; then
            cp "$REPO_ROOT/CLAUDE.md" "$HOME/.claude/ceiatex_guidelines.md"
            echo "     Referencia global copiada para ~/.claude/ceiatex_guidelines.md"
        fi
    fi
fi

# 3. Cursor IDE
if [ "$TARGET" = "all" ] || [ "$TARGET" = "cursor" ]; then
    mkdir -p "$REPO_ROOT/.cursor/rules"
    cat <<EOF > "$REPO_ROOT/.cursor/rules/ceia-presentation.mdc"
---
description: Regras de autoria e compilacao Beamer do tema CEIA
globs: **/*.tex
---

# Invariantes de Design CEIA (Cursor Rule)
- Sempre use superfícies claras em conteúdo (Zero Dark Mode). Modo escuro restrito a capa, seções e encerramento.
- Alto contraste WCAG AAA (> 7:1) em badges e chips (\ceiachip).
- Distribuição de chips sempre em linha única com \hfill.
- Compilação via Tectonic com search-path para $REPO_ROOT:
  tectonic -Z "search-path=$REPO_ROOT" presentation.tex
EOF
    echo "[OK] Cursor IDE: Regras instaladas em $REPO_ROOT/.cursor/rules/ceia-presentation.mdc"
fi

# 4. Verificação de Ambiente
echo ""
echo "--- Verificacao de Ambiente ---"
if command -v tectonic >/dev/null 2>&1; then
    echo "[OK] Compilador Tectonic disponivel: $(tectonic --version)"
else
    echo "[ATENCAO] Tectonic nao encontrado no PATH."
    echo "Instale no macOS com: brew install tectonic"
    echo "Instale no Linux com: cargo install tectonic"
fi

echo ""
echo "Pronto! Seus assistentes de IA agora estao aptos a criar slides perfeitos no tema CEIA."
