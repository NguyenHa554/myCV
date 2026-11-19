$ErrorActionPreference = 'Stop'
$projectRoot = Split-Path -Parent $PSScriptRoot
$compiler = Get-Command xelatex -ErrorAction SilentlyContinue
if ($compiler) {
    $compilerPath = $compiler.Source
} else {
    $candidates = @(
        "$env:LOCALAPPDATA\Programs\MiKTeX\miktex\bin\x64\xelatex.exe",
        "$env:ProgramFiles\MiKTeX\miktex\bin\x64\xelatex.exe"
    )
    $compilerPath = $candidates | Where-Object { Test-Path -LiteralPath $_ } | Select-Object -First 1
}
if (-not $compilerPath) {
    throw 'XeLaTeX was not found. Add your TeX distribution bin directory to PATH and restart VS Code.'
}
$env:Path = (Split-Path -Parent $compilerPath) + [IO.Path]::PathSeparator + $env:Path
$outputDirectory = Join-Path $projectRoot 'build'
New-Item -ItemType Directory -Path $outputDirectory -Force | Out-Null
Push-Location $projectRoot
try {
    # A second pass resolves links and references.
    for ($pass = 1; $pass -le 2; $pass++) {
        & $compilerPath '-synctex=1' '-interaction=nonstopmode' '-halt-on-error' '-file-line-error' "-output-directory=$outputDirectory" 'main.tex'
        if ($LASTEXITCODE -ne 0) {
            throw "XeLaTeX failed. See build/main.log for details."
        }
    }
    Write-Host "PDF ready: $outputDirectory\main.pdf"
} finally {
    Pop-Location
}
