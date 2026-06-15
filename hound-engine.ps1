param()

Write-Host "`nLambda AiAgency :: robdoe.com :: RACE NODE" -ForegroundColor Cyan
Write-Host "Engine: Greyhound Intelligence Engine v7.0" -ForegroundColor Yellow

$dogs = @(
    @{ name="Dog 1"; trap=1; last5Med=29.80; trainerWinPct=0.18; lastTwo=@(1,3) },
    @{ name="Dog 2"; trap=2; last5Med=30.10; trainerWinPct=0.12; lastTwo=@(4,2) },
    @{ name="Dog 3"; trap=3; last5Med=29.75; trainerWinPct=0.22; lastTwo=@(2,1) }
)

$track = @{
    recordTime = 29.50
    trapStats  = @{
        1=0.15; 2=0.12; 3=0.10; 4=0.08;
        5=0.09; 6=0.11; 7=0.14; 8=0.21
    }
}

function Get-Rating {
    param($dog, $track)

    $speedScore = ($track.recordTime / $dog.last5Med) * 100

    $trackScore = $track.trapStats[$dog.trap] * 100
    $coachScore = $dog.trainerWinPct * 100
    $solarScore = ($trackScore * 0.6) + ($coachScore * 0.4)

    $formScore = 0
    foreach ($pos in $dog.lastTwo) {
        if ($pos -eq 1) { $formScore += 10 }
        elseif ($pos -eq 2) { $formScore += 7 }
        elseif ($pos -eq 3) { $formScore += 4 }
        else { $formScore += 2 }
    }

    $final = ($speedScore * 0.40) + ($solarScore * 0.35) + ($formScore * 0.25)

    return [PSCustomObject]@{
        name=$dog.name
        trap=$dog.trap
        rating=[math]::Round($final,2)
    }
}

$ratings = foreach ($d in $dogs) { Get-Rating -dog $d -track $track }
$ranked = $ratings | Sort-Object rating -Descending

Write-Host "`nTop 4 (3–4–5 Weighted):" -ForegroundColor Magenta
$ranked | Select-Object -First 4 | Format-Table -AutoSize

$topTraps = ($ranked | Select-Object -First 4).trap -join ", "
Write-Host "`nSuggested Bet: Boxed First Four (Traps: $topTraps)" -ForegroundColor Yellow
Write-Host "----------------------------------------------`n"
