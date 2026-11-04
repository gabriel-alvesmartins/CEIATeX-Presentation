# ==============================================================================
# latexmkrc - Configuração Oficial de Compilação para Overleaf
# ==============================================================================
# O Overleaf exige que este arquivo NÃO tenha ponto no início (latexmkrc).
# O parâmetro $pdf_mode = 5 força automaticamente o motor XeLaTeX, necessário
# para renderização das fontes OpenType nativas (Inter).
# ==============================================================================
$pdf_mode = 5;
$post_script_mode = 0;
$dvi_mode = 0;
$xelatex = 'xelatex -interaction=nonstopmode -synctex=1 %O %S';
