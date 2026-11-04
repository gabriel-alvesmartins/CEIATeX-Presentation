#!/usr/bin/env bash
# Script de compilacao oficial para Linux e macOS
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FILE="${1:-starter.tex}"
ENGINE="${2:-tectonic}"

# Se o arquivo for relativo e nao existir no PWD, procura no diretorio do script
if [ ! -f "$FILE" ] && [ -f "$SCRIPT_DIR/$FILE" ]; then
    FILE="$SCRIPT_DIR/$FILE"
fi

if [ ! -f "$FILE" ]; then
    echo "==> Erro: Arquivo '$FILE' nao encontrado."
    exit 1
fi

BASENAME=$(basename "$FILE" .tex)
DIRNAME=$(dirname "$FILE")

echo "==> Compilando $(basename "$FILE") com motor $ENGINE..."

if [ "$ENGINE" = "tectonic" ]; then
    if command -v tectonic >/dev/null 2>&1; then
        tectonic -Z "search-path=$SCRIPT_DIR" "$FILE"
    else
        echo "==> Tectonic nao encontrado no PATH."
        echo "Dica: Instale via Homebrew no macOS: brew install tectonic"
        echo "      Ou via Cargo no Linux: cargo install tectonic"
        echo "Tentando compilar com XeLaTeX como alternativa..."
        if command -v xelatex >/dev/null 2>&1; then
            cd "$SCRIPT_DIR"
            xelatex -interaction=nonstopmode -synctex=1 "$FILE"
            xelatex -interaction=nonstopmode -synctex=1 "$FILE"
        else
            echo "==> Erro: Nenhum compilador localizado. Instale o Tectonic ou TeX Live."
            exit 1
        fi
    fi
else
    if command -v xelatex >/dev/null 2>&1; then
        cd "$SCRIPT_DIR"
        xelatex -interaction=nonstopmode -synctex=1 "$FILE"
        xelatex -interaction=nonstopmode -synctex=1 "$FILE"
    else
        echo "==> Erro: Comando 'xelatex' nao encontrado."
        exit 1
    fi
fi

if [ -f "$DIRNAME/$BASENAME.pdf" ]; then
    echo "==> Compilacao concluida com sucesso!"
    echo "    PDF gerado: $DIRNAME/$BASENAME.pdf"
fi
