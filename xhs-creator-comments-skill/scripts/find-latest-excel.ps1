param(
  [string]$WorkspacePath = "."
)

$dataDir = Join-Path $WorkspacePath "data\\xhs"
if (-not (Test-Path -LiteralPath $dataDir)) {
  $workspaceRoot = Split-Path (Split-Path (Split-Path $PSScriptRoot -Parent) -Parent) -Parent
  $fallbackWorkspacePath = Join-Path $workspaceRoot "MediaCrawler"
  $fallbackDataDir = Join-Path $fallbackWorkspacePath "data\\xhs"

  if (Test-Path -LiteralPath $fallbackDataDir) {
    $WorkspacePath = $fallbackWorkspacePath
    $dataDir = $fallbackDataDir
  } else {
    Write-Error "Could not find data/xhs under: $WorkspacePath"
    exit 1
  }
}

$latest = Get-ChildItem -LiteralPath $dataDir -Filter "xhs_creator_*.xlsx" -File |
  Sort-Object LastWriteTime -Descending |
  Select-Object -First 1

if (-not $latest) {
  Write-Error "No xhs_creator_*.xlsx workbook found under: $dataDir"
  exit 1
}

Write-Output $latest.FullName
