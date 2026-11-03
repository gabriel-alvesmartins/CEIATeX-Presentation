<#
.SYNOPSIS
    Script de compilacao local para a apresentacao CEIATeX.
.DESCRIPTION
    Compila presentation_ceia.tex usando Tectonic (recomendado) ou XeLaTeX.
.PARAMETER Engine
    Motor de compilacao: 'tectonic' (padrao) ou 'xelatex'.
.EXAMPLE
    .\compile.ps1
    .\compile.ps1 -Engine xelatex
#>
param(
    [ValidateSet("tectonic", "xelatex")]
    [string]$Engine = "tectonic",
    [string]$File = "presentation_ceia.tex"
)

$ErrorActionPreference = "Stop"

Write-Host "==> Compilando $File com $Engine..." -ForegroundColor Cyan

if ($Engine -eq "tectonic") {
    if (Get-Command tectonic -ErrorAction SilentlyContinue) {
        & tectonic $File
    } elseif (Test-Path "..\bin\tectonic.exe") {
        & "..\bin\tectonic.exe" $File
    } else {
        Write-Warning "Tectonic nao encontrado no PATH nem em ..\bin\tectonic.exe. Tentando xelatex..."
        & xelatex -interaction=nonstopmode -synctex=1 $File
        & xelatex -interaction=nonstopmode -synctex=1 $File
    }
} else {
    & xelatex -interaction=nonstopmode -synctex=1 $File
    & xelatex -interaction=nonstopmode -synctex=1 $File
}

if ($LASTEXITCODE -eq 0 -or $? -eq $true) {
    Write-Host "==> Compilacao concluida com sucesso! Gerado: presentation_ceia.pdf" -ForegroundColor Green
} else {
    Write-Error "==> Falha na compilacao."
}
