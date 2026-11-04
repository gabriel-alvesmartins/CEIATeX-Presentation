# ==============================================================================
# .latexmkrc - Configuração de Compilação para latexmk local
# ==============================================================================
$pdf_mode = 5;
$post_script_mode = 0;
$dvi_mode = 0;
$xelatex = 'xelatex -interaction=nonstopmode -synctex=1 %O %S';
