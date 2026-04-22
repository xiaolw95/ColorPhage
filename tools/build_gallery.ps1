$ErrorActionPreference = "Stop"

$RepoRoot = Resolve-Path (Join-Path $PSScriptRoot "..")
$RScript = "C:\Program Files\R\R-4.5.3\bin\Rscript.exe"
$GalleryScript = Join-Path $RepoRoot "inst\gallery\build_simple_modes_gallery.R"

if (-not (Test-Path -LiteralPath $RScript)) {
  throw "Rscript executable not found at: $RScript"
}

if (-not (Test-Path -LiteralPath $GalleryScript)) {
  throw "Gallery script not found at: $GalleryScript"
}

Push-Location $RepoRoot
try {
  & $RScript $GalleryScript
  if ($LASTEXITCODE -ne 0) {
    throw "Gallery generation failed."
  }

  Write-Host "ColorPhage gallery generated successfully."
}
finally {
  Pop-Location
}
