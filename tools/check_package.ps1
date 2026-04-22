$ErrorActionPreference = "Stop"

$RepoRoot = Resolve-Path (Join-Path $PSScriptRoot "..")
$RExe = "C:\Program Files\R\R-4.5.3\bin\R.exe"
$PackageVersion = "0.0.0.9000"
$Tarball = Join-Path $RepoRoot "ColorPhage_$PackageVersion.tar.gz"
$CheckDir = Join-Path $RepoRoot "ColorPhage.Rcheck"

if (-not (Test-Path -LiteralPath $RExe)) {
  throw "R executable not found at: $RExe"
}

Push-Location $RepoRoot
try {
  if (Test-Path -LiteralPath $Tarball) {
    Remove-Item -LiteralPath $Tarball -Force
  }
  if (Test-Path -LiteralPath $CheckDir) {
    Remove-Item -LiteralPath $CheckDir -Recurse -Force
  }

  & $RExe CMD build .
  if ($LASTEXITCODE -ne 0) {
    throw "R CMD build failed."
  }

  & $RExe CMD check --no-manual $Tarball
  if ($LASTEXITCODE -ne 0) {
    throw "R CMD check failed."
  }

  if (Test-Path -LiteralPath $Tarball) {
    Remove-Item -LiteralPath $Tarball -Force
  }
  if (Test-Path -LiteralPath $CheckDir) {
    Remove-Item -LiteralPath $CheckDir -Recurse -Force
  }

  Write-Host "ColorPhage package check completed: Status OK"
}
finally {
  Pop-Location
}
