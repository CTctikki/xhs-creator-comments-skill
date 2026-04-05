param(
  [Parameter(Mandatory = $true)]
  [string]$WorkspacePath
)

$required = @(
  "main.py",
  "media_platform\\xhs\\core.py",
  "media_platform\\xhs\\login.py",
  "store\\xhs\\__init__.py"
)

if (-not (Test-Path -LiteralPath $WorkspacePath)) {
  Write-Error "Workspace path does not exist: $WorkspacePath"
  exit 1
}

$missing = @()
foreach ($item in $required) {
  $full = Join-Path $WorkspacePath $item
  if (-not (Test-Path -LiteralPath $full)) {
    $missing += $item
  }
}

if ($missing.Count -gt 0) {
  Write-Error ("Workspace is missing required files: " + ($missing -join ", "))
  exit 1
}

Write-Output "MediaCrawler workspace looks valid: $WorkspacePath"
