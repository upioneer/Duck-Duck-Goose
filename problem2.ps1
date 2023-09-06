$items = @(
1,
0,
1,
1,
0,
1,
1,
1
)

$target = 1 # gives us the flexibility to update the target value without reconstructing the entire function

function request-count {
    $maxConsecutiveOnes = $null
    $currentConsecutiveOnes = $null

    foreach ($item in $items) {
        if ($item -eq $target) {
            $currentConsecutiveOnes++
            if ($currentConsecutiveOnes -gt $maxConsecutiveOnes) {
                $maxConsecutiveOnes = $currentConsecutiveOnes
            }
        } else {
            $currentConsecutiveOnes = 0
        }
    }
    Write-Host "consecutive count of $target = " -NoNewline; Write-Host "$maxConsecutiveOnes" -ForegroundColor Yellow
}

request-count