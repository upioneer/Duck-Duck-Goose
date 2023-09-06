$firstTues = $null # resetting the var will allow script to be run multiple times in succession in a session when selecting/testing against different months

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object Windows.Forms.Form -Property @{
    StartPosition = [Windows.Forms.FormStartPosition]::CenterScreen
    Size          = New-Object Drawing.Size 243, 230
    Text          = 'Select a Date'
    Topmost       = $true
}

$calendar = New-Object Windows.Forms.MonthCalendar -Property @{
    ShowTodayCircle   = $false
    MaxSelectionCount = 1
}
$form.Controls.Add($calendar)

$okButton = New-Object Windows.Forms.Button -Property @{
    Location     = New-Object Drawing.Point 38, 165
    Size         = New-Object Drawing.Size 75, 23
    Text         = 'OK'
    DialogResult = [Windows.Forms.DialogResult]::OK
}
$form.AcceptButton = $okButton
$form.Controls.Add($okButton)

$cancelButton = New-Object Windows.Forms.Button -Property @{
    Location     = New-Object Drawing.Point 113, 165
    Size         = New-Object Drawing.Size 75, 23
    Text         = 'Cancel'
    DialogResult = [Windows.Forms.DialogResult]::Cancel
}
$form.CancelButton = $cancelButton
$form.Controls.Add($cancelButton)

$result = $form.ShowDialog()

if ($result -eq [Windows.Forms.DialogResult]::OK) {
    $date = $calendar.SelectionStart
    Write-Host "Date selected: $($date.ToShortDateString())"
}

# loop until Tues is matched
if ($date.DayOfWeek -eq "Tuesday") {
    $firstTues = Get-Date -Month $date.Month -Day 1
    while($firstTues.DayOfWeek -ne 'Tuesday') {
        $firstTues = $firstTues.AddDays(1)
        $secondTues = $firstTues.AddDays(7)
    }

    $dateSelected = $Date.ToString("yyyyMMdd")
    $ft = $firstTues.ToString("yyyyMMdd")
    $st = $secondTues.ToString("yyyyMMdd")

    if ($dateSelected -ne $ft -and $dateSelected -ne $st) {
        Write-Host "False" -ForegroundColor Yellow
    } else {
        Write-Host "True" -ForegroundColor Green
    }
}
