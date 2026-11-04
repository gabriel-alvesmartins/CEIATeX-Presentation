<#
.SYNOPSIS
    Script de compilacao oficial para a apresentacao CEIATeX.
.DESCRIPTION
    Compila arquivos .tex do tema CEIA usando Tectonic (recomendado) ou XeLaTeX.
    Funciona a partir de qualquer pasta ou terminal.
.PARAMETER File
    Arquivo .tex a ser compilado (padrao: starter.tex).
.PARAMETER Engine
    Motor de compilacao: 'tectonic' (padrao) ou 'xelatex'.
.PARAMETER OutputDir
    Diretorio de saida para os PDFs (opcional).
.EXAMPLE
    .\compile.ps1
    .\compile.ps1 presentation_ceia.tex
    .\compile.ps1 starter.tex -Engine xelatex
#>
param(
    [Parameter(Position=0)]
    [string]$File = "starter.tex",

    [Parameter(Position=1)]
    [ValidateSet("tectonic", "xelatex")]
    [string]$Engine = "tectonic",

    [string]$OutputDir = ""
)

$ErrorActionPreference = "Stop"

# Resolve caminho do arquivo relativo a pasta do script caso nao exista no PWD
$targetFile = if (Test-Path $File) { (Resolve-Path $File).Path } elseif (Test-Path (Join-Path $PSScriptRoot $File)) { (Join-Path $PSScriptRoot $File) } else { $File }

if (-not (Test-Path $targetFile)) {
    Write-Error "==> Erro: Arquivo '$File' nao encontrado."
    exit 1
}

$fileName = [System.IO.Path]::GetFileName($targetFile)
$baseName = [System.IO.Path]::GetFileNameWithoutExtension($targetFile)
$outPath = if ($OutputDir) { $OutputDir } else { [System.IO.Path]::GetDirectoryName($targetFile) }

Write-Host "==> Compilando $fileName com motor $Engine..." -ForegroundColor Cyan

if ($Engine -eq "tectonic") {
    $tectonicCmd = $null
    if (Get-Command tectonic -ErrorAction SilentlyContinue) {
        $tectonicCmd = "tectonic"
    } else {
        $searchCandidates = @(
            (Join-Path $PSScriptRoot "..\bin\tectonic.exe"),
            (Join-Path $PSScriptRoot "bin\tectonic.exe"),
            (Join-Path $env:USERPROFILE "bin\tectonic.exe"),
            "C:\ProgramData\chocolatey\bin\tectonic.exe",
            (Join-Path $env:LOCALAPPDATA "Microsoft\WinGet\Links\tectonic.exe")
        )
        foreach ($cand in $searchCandidates) {
            if (Test-Path $cand) {
                $tectonicCmd = $cand
                break
            }
        }
    }

    if ($tectonicCmd) {
        $extraArgs = @("-Z", "search-path=$PSScriptRoot")
        if ($OutputDir) {
            $extraArgs += @("-o", $OutputDir)
        }
        & $tectonicCmd @extraArgs $targetFile
    } else {
        Write-Warning @"
==> Tectonic nao encontrado no PATH do sistema.
Dica: Instale em 1 comando com:
  winget install tectonic
Tentando compilar com XeLaTeX como alternativa...
"@
        if (Get-Command xelatex -ErrorAction SilentlyContinue) {
            Push-Location $PSScriptRoot
            try {
                & xelatex -interaction=nonstopmode -synctex=1 $targetFile
                & xelatex -interaction=nonstopmode -synctex=1 $targetFile
            } finally {
                Pop-Location
            }
        } else {
            Write-Error @"
Nenhum compilador compativel foi localizado.
Por favor, instale o Tectonic executando no terminal:
  winget install tectonic
Apos instalar, feche e reabra o terminal e execute novamente .\compile.ps1.
"@
            exit 1
        }
    }
} else {
    if (Get-Command xelatex -ErrorAction SilentlyContinue) {
        Push-Location $PSScriptRoot
        try {
            & xelatex -interaction=nonstopmode -synctex=1 $targetFile
            & xelatex -interaction=nonstopmode -synctex=1 $targetFile
        } finally {
            Pop-Location
        }
    } else {
        Write-Error "Comando 'xelatex' nao encontrado. Instale o TeX Live / MiKTeX ou use tectonic."
        exit 1
    }
}

$pdfName = "$baseName.pdf"
$expectedPdf = Join-Path $outPath $pdfName

if (Test-Path $expectedPdf) {
    Write-Host "==> Compilacao concluida com sucesso!" -ForegroundColor Green
    Write-Host "    PDF gerado: $expectedPdf" -ForegroundColor Green
} else {
    Write-Host "==> Processo finalizado." -ForegroundColor Yellow
}
