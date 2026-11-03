#!/usr/bin/env bash
# Script de compilacao local para Linux e macOS
set -e

ENGINE="${1:-tectonic}"
FILE="${2:-presentation_ceia.tex}"

echo "==> Compilando $FILE com $ENGINE..."

if [ "$ENGINE" = "tectonic" ]; then
    if command -v tectonic >/dev/null 2>&1; then
        tectonic "$FILE"
    else
        echo "Tectonic nao encontrado. Utilizando xelatex..."
        xelatex -interaction=nonstopmode -synctex=1 "$FILE"
        xelatex -interaction=nonstopmode -synctex=1 "$FILE"
    fi
else
    xelatex -interaction=nonstopmode -synctex=1 "$FILE"
    xelatex -interaction=nonstopmode -synctex=1 "$FILE"
fi

echo "==> Compilacao concluida com sucesso! Gerado: presentation_ceia.pdf"
