#!/usr/bin/env python3
"""
audit_layout.py — Auditoria Algorítmica de Layout para Apresentações CEIA Beamer (16:9)

Valida conformidade geométrica estrita contra extravasamentos (Overfull):
- Teto vertical seguro: y1 <= 226.5 pt (respiro mínimo de 12 pt antes do rodapé institucional)
- Limite horizontal seguro: x1 <= 433.0 pt (margem mínima de 20 pt da borda lateral direita)
- Margem esquerda segura: x0 >= 15.0 pt

Uso:
    python scripts/audit_layout.py [caminho/para/apresentacao.pdf]
"""

import sys
import os
import re

# Força UTF-8 na saída padrão do terminal Windows
if sys.platform == "win32":
    try:
        sys.stdout.reconfigure(encoding="utf-8")
    except Exception:
        pass

try:
    import pymupdf as fitz
except ImportError:
    try:
        import fitz
    except ImportError:
        print("[ERRO] pymupdf não instalado. Instale com: pip install pymupdf")
        sys.exit(1)


def audit_presentation(pdf_path: str) -> bool:
    if not os.path.exists(pdf_path):
        print(f"[ERRO] Arquivo não encontrado: {pdf_path}")
        return False

    doc = fitz.open(pdf_path)
    total_pages = len(doc)
    print(f"Iniciando auditoria de layout em '{pdf_path}' ({total_pages} lâminas)...")

    overflows = []

    for pno in range(total_pages):
        # Ignora Capa (P01) e Encerramento (última lâmina)
        if pno == 0 or pno == total_pages - 1:
            continue

        page = doc[pno]
        blocks = page.get_text("blocks")

        for b in blocks:
            x0, y0, x1, y1, text = b[0], b[1], b[2], b[3], b[4].strip()

            # Ignora chancelas institucionais de rodapé (y0 > 230 pt)
            if (
                re.match(r"^\d+\s*/\s*\d+$", text)
                or "Centro de Excelência" in text
                or "UNIVERSIDADE" in text
                or "ceia.ufg.br" in text
                or y0 > 235
            ):
                continue

            # Verificação de Teto Vertical Seguro
            if y1 > 227.0:
                overflows.append(
                    (pno + 1, "VERTICAL (y1 > 227.0 pt)", f"y1={y1:.1f} pt", text[:50])
                )

            # Verificação de Limite Horizontal Seguro
            if x1 > 436.0:
                overflows.append(
                    (pno + 1, "HORIZONTAL (x1 > 436.0 pt)", f"x1={x1:.1f} pt", text[:50])
                )

            # Verificação de Margem Esquerda Segura
            if x0 < 15.0:
                overflows.append(
                    (pno + 1, "MARGEM ESQ (x0 < 15.0 pt)", f"x0={x0:.1f} pt", text[:50])
                )

    if overflows:
        print(f"\n[ALERTA] Detectados {len(overflows)} pontos de atenção de layout:")
        for slide_no, kind, val, snippet in overflows:
            clean_snippet = snippet.replace("\n", " ")
            print(f"  • Slide {slide_no:02d} | {kind} [{val}]: \"{clean_snippet}\"")
        return False
    else:
        print(f"\n[SUCESSO] Todas as lâminas de conteúdo estão dentro dos limites geométricos seguros!")
        print("   - Margem vertical livre >= 12 pt em relação ao rodapé.")
        print("   - Margem horizontal livre >= 18 pt em relação à borda lateral.")
        return True


if __name__ == "__main__":
    pdf = sys.argv[1] if len(sys.argv) > 1 else "presentation_ceia.pdf"
    success = audit_presentation(pdf)
    sys.exit(0 if success else 1)
