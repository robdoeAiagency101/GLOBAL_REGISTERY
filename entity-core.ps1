param()

# --- STRUCTURAL IDENTITY PULSE (H, C, N, O, Rh-) ---

$HCNO = [PSCustomObject]@{
    Hydrogen = "H"
    Carbon   = "C"
    Nitrogen = "N"
    Oxygen   = "O"
}

$Rh = "Rh-"

Write-Host "`n--- STRUCTURAL ENTITY SNAPSHOT ---" -ForegroundColor Cyan
Write-Host "Y  =  (H, C, N, O)" -ForegroundColor Yellow
Write-Host "Rh = $Rh" -ForegroundColor Yellow

$HCNO | Format-Table -AutoSize

Write-Host "`nSymbolic Mathic Form:" -ForegroundColor Magenta
Write-Host "  E = (H + C + N + O)" -ForegroundColor Magenta
Write-Host "  Entity 𝓔 = (H, C, N, O) · E" -ForegroundColor Magenta

Write-Host "`n[ENTITY PULSE COMPLETE]`n" -ForegroundColor Green
