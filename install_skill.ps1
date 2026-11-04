<#
.SYNOPSIS
    Instalador Universal de Skills e Regras de IA para o Tema CEIATeX.
.DESCRIPTION
    Configura automaticamente assistentes de IA (Google Antigravity, Claude Code, Cursor)
    para autorarem e compilarem apresentacoes oficiais do CEIA com fidelidade visual.
.PARAMETER Target
    Assistente alvo: 'all' (padrao), 'antigravity', 'claude', 'cursor'.
.EXAMPLE
    .\install_skill.ps1
    .\install_skill.ps1 -Target antigravity
#>
param(
    [ValidateSet("all", "antigravity", "claude", "cursor")]
    [string]$Target = "all"
)

$ErrorActionPreference = "Stop"
$repoRoot = $PSScriptRoot

Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "  Instalador de IA: Suíte Beamer CEIA Design System v3.4   " -ForegroundColor Cyan
Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "Diretorio do template detectado: $repoRoot`n" -ForegroundColor Gray

# ------------------------------------------------------------------------------
# 1. GOOGLE ANTIGRAVITY (Skill Global ~/.gemini/config/skills/ceia-presentation/)
# ------------------------------------------------------------------------------
if ($Target -eq "all" -or $Target -eq "antigravity") {
    $antigravityDir = Join-Path $HOME ".gemini\config\skills\ceia-presentation"
    if (-not (Test-Path $antigravityDir)) {
        New-Item -ItemType Directory -Path $antigravityDir -Force | Out-Null
    }

    $sourceSkill = Join-Path $repoRoot ".agents\skills\ceia-presentation\SKILL.md"
    if (Test-Path $sourceSkill) {
        $skillContent = Get-Content -Raw -Encoding UTF8 $sourceSkill
        
        # Ajusta o fallback de busca de template para o caminho real da maquina atual
        $escapedRepo = $repoRoot.Replace('\', '\\')
        $skillContent = $skillContent -replace '\$CEIA_TEMPLATE = "[^"]+"', "`$CEIA_TEMPLATE = `"$repoRoot`""
        
        $targetFile = Join-Path $antigravityDir "SKILL.md"
        [System.IO.File]::WriteAllText($targetFile, $skillContent, [System.Text.Encoding]::UTF8)
        Write-Host "[OK] Google Antigravity: Skill global instalada com sucesso!" -ForegroundColor Green
        Write-Host "     Destino: $targetFile" -ForegroundColor DarkGray
    } else {
        Write-Warning "Arquivo fonte da skill nao encontrado em $sourceSkill"
    }
}

# ------------------------------------------------------------------------------
# 2. CLAUDE CODE (CLAUDE.md local e perfil global ~/.claude/)
# ------------------------------------------------------------------------------
if ($Target -eq "all" -or $Target -eq "claude") {
    $claudeSource = Join-Path $repoRoot "CLAUDE.md"
    if (Test-Path $claudeSource) {
        # Configura no repositorio local
        Write-Host "[OK] Claude Code: Guia canônico ativo em $claudeSource" -ForegroundColor Green

        # Opcionalmente sincroniza no ~/.claude/ para sessoes globais
        $globalClaudeDir = Join-Path $HOME ".claude"
        if (Test-Path $globalClaudeDir) {
            $globalClaudeTarget = Join-Path $globalClaudeDir "ceiatex_guidelines.md"
            Copy-Item -Path $claudeSource -Destination $globalClaudeTarget -Force
            Write-Host "     Referencia global copiada para: $globalClaudeTarget" -ForegroundColor DarkGray
        }
    } else {
        Write-Warning "Arquivo CLAUDE.md nao encontrado na raiz do repositorio."
    }
}

# ------------------------------------------------------------------------------
# 3. CURSOR IDE (.cursor/rules/ceia-presentation.mdc)
# ------------------------------------------------------------------------------
if ($Target -eq "all" -or $Target -eq "cursor") {
    $cursorRulesDir = Join-Path $repoRoot ".cursor\rules"
    if (-not (Test-Path $cursorRulesDir)) {
        New-Item -ItemType Directory -Path $cursorRulesDir -Force | Out-Null
    }

    $cursorMdc = Join-Path $cursorRulesDir "ceia-presentation.mdc"
    $mdcContent = @"
---
description: Regras de autoria e compilacao Beamer do tema CEIA
globs: **/*.tex
---

# Invariantes de Design CEIA (Cursor Rule)
- Sempre use superfícies claras em conteúdo (Zero Dark Mode). Modo escuro restrito a capa, seções e encerramento.
- Alto contraste WCAG AAA (> 7:1) em badges e chips (\ceiachip). Fundo branco, borda saturada e texto bold em CEIADarkBlue.
- Distribuição de chips sempre em linha única com \hfill.
- Ícone de escudo (shield) com crista e checkmark centrado.
- Compilação via Tectonic com search-path para ${repoRoot}:
  tectonic -Z "search-path=${repoRoot}" presentation.tex
"@
    [System.IO.File]::WriteAllText($cursorMdc, $mdcContent, [System.Text.Encoding]::UTF8)
    Write-Host "[OK] Cursor IDE: Regras instaladas em $cursorMdc" -ForegroundColor Green
}

# ------------------------------------------------------------------------------
# 4. DIAGNÓSTICO DO COMPILADOR TECTONIC
# ------------------------------------------------------------------------------
Write-Host "`n--- Verificacao de Ambiente ---" -ForegroundColor Cyan
if (Get-Command tectonic -ErrorAction SilentlyContinue) {
    $ver = & tectonic --version
    Write-Host "[OK] Compilador Tectonic disponivel no PATH: $ver" -ForegroundColor Green
} else {
    Write-Warning @"
[ATENCAO] O compilador 'tectonic' ainda nao esta no PATH do seu Windows.
Para poder compilar de qualquer pasta sem configuracao manual, instale executando:
  winget install tectonic

(Ou use o executavel local em .\compile.ps1)
"@
}

Write-Host "`nPronto! Seus assistentes de IA agora estao aptos a criar slides perfeitos no tema CEIA." -ForegroundColor Green
