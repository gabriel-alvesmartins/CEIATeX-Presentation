# ==============================================================================
# .latexmkrc - Configuração de Compilação para Overleaf e latexmk
# ==============================================================================
# O tema CEIATeX utiliza fontes OpenType nativas via fontspec (pacote inter),
# exigindo compilação através do motor XeLaTeX.
# Este arquivo garante que o Overleaf selecione automaticamente o XeLaTeX
# ao abrir ou importar o projeto.
# ==============================================================================
$xelatex = 'xelatex -interaction=nonstopmode -synctex=1 %O %S';
$pdf_mode = 5; # 5 = compilar diretamente para PDF usando xelatex
$post_script_mode = 0;
$dvi_mode = 0;
