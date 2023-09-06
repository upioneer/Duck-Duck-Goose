# renamed function to verb-noun format
function add-Numbers {

    param (
        [parameter(Mandatory=$true)][int]$integer1, # declared var as int instead of string
        [parameter(Mandatory=$true)][int]$integer2 # declared var as int instead of string
    )

    Write-Host "integer1 = $integer1"
    Write-Host "integer2 = $integer2"
    $sum = $integer1 + $integer2 # calc of int1 + int2
    Write-Host "Sum = $integer1 + $integer2 = " -NoNewline; Write-Host "$sum" -ForegroundColor Yellow # added the actual sum
}

add-Numbers 5 9