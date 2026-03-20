$ErrorActionPreference = "Stop"

$TempBuildDir = "build_tmp_windows"
$OutputDir = "Builds/WindowsBuild"

# cleanup old temp build
if (Test-Path $TempBuildDir) {
    Remove-Item $TempBuildDir -Recurse -Force
}

# cleanup old output
if (Test-Path $OutputDir) {
    Remove-Item $OutputDir -Recurse -Force
}

# build
cmake -S . -B $TempBuildDir
cmake --build $TempBuildDir

# create output dir
New-Item -ItemType Directory -Force -Path $OutputDir | Out-Null

# copy exe
Get-ChildItem -Path $TempBuildDir -Recurse -File | Where-Object {
    $_.Extension -eq ".exe"
} | ForEach-Object {
    Copy-Item $_.FullName $OutputDir -Force
}

# copy dll
Get-ChildItem -Path $TempBuildDir -Recurse -File | Where-Object {
    $_.Extension -eq ".dll"
} | ForEach-Object {
    Copy-Item $_.FullName $OutputDir -Force
}

# copy lib
Get-ChildItem -Path $TempBuildDir -Recurse -File | Where-Object {
    $_.Extension -eq ".lib"
} | ForEach-Object {
    Copy-Item $_.FullName $OutputDir -Force
}

# cleanup temp build
Remove-Item $TempBuildDir -Recurse -Force

Write-Host "DONE"
Write-Host "Output:"
Get-ChildItem $OutputDir