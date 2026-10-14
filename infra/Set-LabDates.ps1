<#
.SYNOPSIS
    Computes the LAB671 scenario dates relative to the lab launch day and publishes them as Skillable lab variables.

.DESCRIPTION
    Work IQ evaluates phrases such as "last 30 days" and "no activity in 14+ days" against the real current date,
    so every seeded date is an offset from launch day (Day 0, Central Time). See infra/README.md for the date model.

    Run as a Skillable life cycle action before the M365 and Dynamics seeding step. The returned object (or the
    -OutFile JSON) gives the seeding scripts the same ISO dates that the instructions display.

.PARAMETER Today
    Overrides Day 0 for testing. Defaults to the current date in Central Time.

.PARAMETER OutFile
    Optional path to write the computed dates as JSON.

.EXAMPLE
    ./Set-LabDates.ps1 -Today 2026-11-17 -OutFile lab-dates.json
#>
[CmdletBinding()]
param(
    [datetime]$Today,
    [string]$OutFile
)

$ErrorActionPreference = 'Stop'

function Get-CentralToday {
    foreach ($id in 'Central Standard Time', 'America/Chicago') {
        try {
            $tz = [TimeZoneInfo]::FindSystemTimeZoneById($id)
            return [TimeZoneInfo]::ConvertTimeFromUtc([datetime]::UtcNow, $tz).Date
        } catch { }
    }
    throw 'Central Time zone not found.'
}

function Get-Holidays([int]$Year) {
    $nov1 = [datetime]::new($Year, 11, 1)
    $thanksgiving = $nov1.AddDays(((4 - [int]$nov1.DayOfWeek) + 7) % 7 + 21)
    @(
        $thanksgiving, $thanksgiving.AddDays(1),
        [datetime]::new($Year, 12, 24), [datetime]::new($Year, 12, 25),
        [datetime]::new($Year, 12, 31), [datetime]::new($Year, 1, 1)
    )
}

function Test-BusinessDay([datetime]$Date) {
    $Date.DayOfWeek -notin 'Saturday', 'Sunday' -and (Get-Holidays $Date.Year) -notcontains $Date.Date
}

# Past dates move earlier (only makes items older); future dates move later.
function Get-BusinessDay([datetime]$Date, [ValidateSet('Back', 'Forward')][string]$Direction) {
    $step = if ($Direction -eq 'Back') { -1 } else { 1 }
    while (-not (Test-BusinessDay $Date)) { $Date = $Date.AddDays($step) }
    $Date
}

if (-not $PSBoundParameters.ContainsKey('Today')) { $Today = Get-CentralToday }
$d0 = $Today.Date

function Past([int]$Days)   { Get-BusinessDay $d0.AddDays(-$Days) 'Back' }
function Future([int]$Days) { Get-BusinessDay $d0.AddDays($Days) 'Forward' }

$preBookDeadline = Future 14
$holidayLaunch = $preBookDeadline.AddDays(1)
while ($holidayLaunch.DayOfWeek -ne 'Monday') { $holidayLaunch = $holidayLaunch.AddDays(1) }
$holidayLaunch = Get-BusinessDay $holidayLaunch 'Forward'

$dates = [ordered]@{
    LabToday              = $d0
    PreBookAnnounced      = Past 16
    ShipmentIssue         = Past 13
    AdeleQuestion         = Past 9
    FollowUpDue           = Future 8
    PreBookDeadline       = $preBookDeadline
    HolidayLaunch         = $holidayLaunch
    CloseBy               = $d0.AddDays(75)
    NorthwindLastActivity = Past 21
    WideWorldLastActivity = Past 17
    FourthCoffeeLastActivity = Past 15
    TailwindLastActivity  = Past 8
    AlpineLastActivity    = Past 7
    ContosoLastActivity   = Past 6
    NorthwindClose        = Future 27
    ContosoClose          = Future 34
    WideWorldClose        = Future 48
    TailwindClose         = Future 55
    FourthCoffeeClose     = Future 62
    AlpineClose           = Future 67
}

function DaysAgo([string]$Key) { ($d0 - $dates[$Key]).Days }

# Guard the scenario's expected results for any launch day.
$checks = @(
    @{ Ok = (DaysAgo NorthwindLastActivity) -ge 14 -and (DaysAgo WideWorldLastActivity) -ge 14 -and (DaysAgo FourthCoffeeLastActivity) -ge 14; Msg = 'Stalled West renewals must be 14+ days old.' }
    @{ Ok = (DaysAgo TailwindLastActivity) -lt 14 -and (DaysAgo AlpineLastActivity) -lt 14 -and (DaysAgo ContosoLastActivity) -lt 14; Msg = 'Active West renewals must be under 14 days old.' }
    @{ Ok = (DaysAgo PreBookAnnounced) -le 30 -and (DaysAgo ShipmentIssue) -le 30 -and (DaysAgo AdeleQuestion) -le 30; Msg = 'M365 evidence must fall in the last 30 days.' }
    @{ Ok = $dates.AdeleQuestion -gt $dates.PreBookAnnounced; Msg = "Adele's question must follow the Pre-Book announcement." }
    @{ Ok = $dates.FollowUpDue -lt $dates.PreBookDeadline -and $dates.PreBookDeadline -lt $dates.HolidayLaunch; Msg = 'Follow-up must precede the deadline, which must precede the Holiday Blend launch.' }
    @{ Ok = $dates.PreBookDeadline -lt $dates.NorthwindClose -and $dates.AlpineClose -le $dates.CloseBy; Msg = 'Renewals must close after the deadline and by the CloseBy filter.' }
)
foreach ($c in $checks) { if (-not $c.Ok) { throw "LAB671 date check failed for $($d0.ToString('yyyy-MM-dd')): $($c.Msg)" } }

$culture = [Globalization.CultureInfo]::GetCultureInfo('en-US')
$display = [ordered]@{}
foreach ($key in $dates.Keys) { $display[$key] = $dates[$key].ToString('MMMM d', $culture) }
$display['PreBookAnnouncedLong'] = $dates.PreBookAnnounced.ToString('dddd, MMMM d', $culture)
$display['HolidayLaunchLong'] = $dates.HolidayLaunch.ToString('dddd, MMMM d', $culture)
$display['NorthwindDaysSince'] = "$(DaysAgo NorthwindLastActivity)"
$display['WideWorldDaysSince'] = "$(DaysAgo WideWorldLastActivity)"
$display['FourthCoffeeDaysSince'] = "$(DaysAgo FourthCoffeeLastActivity)"

if (Get-Command Set-LabVariable -ErrorAction SilentlyContinue) {
    foreach ($key in $display.Keys) { Set-LabVariable -Name $key -Value $display[$key] }
}

$result = [pscustomobject]@{
    Iso     = [ordered]@{}
    Display = $display
}
foreach ($key in $dates.Keys) { $result.Iso[$key] = $dates[$key].ToString('yyyy-MM-dd') }

if ($OutFile) { $result | ConvertTo-Json -Depth 3 | Set-Content -Path $OutFile -Encoding utf8 }
$result
