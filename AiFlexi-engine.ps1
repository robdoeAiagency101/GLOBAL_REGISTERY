param()

Write-Host "`nLambda AiAgency :: robdoe.com :: EXOTIC RACE NODE" -ForegroundColor Cyan
Write-Host "Mode: AiFlexi (Merged Hound + Flexi 0.05)" -ForegroundColor Yellow

# --- HOUND SECTION ---
$dogs = @(
    @{ name="Dog 1"; trap=1; medianTime=29.80; trackHistory=0.12; trainerWinPct=0.25 },
    @{ name="Dog 2"; trap=2; medianTime=30.10; trackHistory=0.08; trainerWinPct=0.10 },
    @{ name="Dog 3"; trap=3; medianTime=29.75; trackHistory=0.15; trainerWinPct=0.22 }
)

function Evaluate-Field {
    param($dogs)

    $output = @()

    foreach ($dog in $dogs) {

        if ($dog.trainerWinPct -gt 0.20) {
            $trainerEdge = 0.05
        } else {
            $trainerEdge = 0
        }

        $score = (1 / $dog.medianTime) + $dog.trackHistory + $trainerEdge

        $output += [PSCustomObject]@{
            name  = $dog.name
            trap  = $dog.trap
            score = [math]::Round($score,4)
        }
    }

    return $output | Sort-Object score -Descending
}

Write-Host "`n--- HOUND INTELLIGENCE (AiFlexi Mode) ---" -ForegroundColor Magenta
$field = Evaluate-Field -dogs $dogs
$field | Format-Table -AutoSize

# --- FLEXI SECTION ---
$CONFIG = @{
    unitStake = 0.05
    boxSize   = 6
}

function Calculate-Exotic {
    param($numDogs)

    $combos = 1
    for ($i = 0; $i -lt 4; $i++) {
        $combos *= ($numDogs - $i)
    }

    $totalCost = $combos * $CONFIG.unitStake

    Write-Host "`n--- FLEXI 0.05 EXOTIC ---" -ForegroundColor Cyan
    Write-Host "Box Size: $numDogs"
    Write-Host "Combinations: $combos"
    Write-Host "Total Outlay: $($totalCost.ToString('0.00'))"
}

Calculate-Exotic -numDogs $CONFIG.boxSize

Write-Host "`n[AiFlexi COMPLETE]`n" -ForegroundColor Green
