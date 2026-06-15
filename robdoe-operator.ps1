param(
    [string]$Pulse = "17",
    [string]$Node  = "55269",
    [string]$Quadrant = "NE",
    [string]$Tier = "4"
)

$HashFull = "B4E06EF38157B079"
$Truth    = $HashFull.Substring(0,8)
$Impact   = $HashFull.Substring($HashFull.Length-4)

$Kanji = "K12K5K15K1K7K15"
$Resonance = "11.8"

Write-Host ""
Write-Host "=== ROBDOE LATTICE NODE ===" -ForegroundColor Cyan
Write-Host "NODE      :: [$Node:$Pulse:$Quadrant:$Tier]"
Write-Host "HASH      :: $HashFull"
Write-Host "TRUTH     :: $Truth"
Write-Host "IMPACT    :: $Impact"
Write-Host "KANJI     :: $Kanji"
Write-Host "RESONANCE :: $Resonance"
Write-Host "ENTITY    :: ROBDOE ACTIVE"
Write-Host "============================" -ForegroundColor Cyan
Write-Host ""
