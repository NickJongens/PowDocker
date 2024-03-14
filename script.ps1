$clientId = $env:CLIENT_ID
$clientSecret = $env:CLIENT_SECRET
$tenantId = $env:TENANT_ID
$ipToMonitor = $env:IP_TO_MONITOR

$checkedEventsFile = "checked_events.txt"
$trackedLogsFile = "tracked_logs.txt"

# Check if the files exist, and create them if not
if (-not (Test-Path $checkedEventsFile)) {
    New-Item -ItemType File -Path $checkedEventsFile | Out-Null
}

if (-not (Test-Path $trackedLogsFile)) {
    New-Item -ItemType File -Path $trackedLogsFile | Out-Null
}

# Load checked events
$checkedEvents = Get-Content $checkedEventsFile

try {
    # Obtain an access token for Microsoft Graph
    $tokenUrl = "https://login.microsoftonline.com/$tenantId/oauth2/v2.0/token"
    $tokenParams = @{
        client_id     = $clientId
        scope         = "https://graph.microsoft.com/.default"
        client_secret = $clientSecret
        grant_type    = "client_credentials"
    }

    $tokenResponse = Invoke-RestMethod -Uri $tokenUrl -Method Post -ContentType "application/x-www-form-urlencoded" -Body $tokenParams
    $accessToken = $tokenResponse.access_token
    # Use the access token to call Microsoft Graph and retrieve sign-in logs
    $graphApiUri = "https://graph.microsoft.com/v1.0/auditLogs/signIns"

    $signInLogs = Invoke-RestMethod -Uri $graphApiUri -Headers @{ "Authorization" = "Bearer $accessToken" }

    foreach ($log in $signInLogs.value) {
        $ipAddress = $log.ipAddress
        $eventId = $log.id

        # Check if the event has already been checked
        if ($checkedEvents -contains $eventId) {
            continue
        }

        # Check if the IP address matches the one to monitor
        if ($ipAddress -eq $ipToMonitor) {
            # Output the full log entry to the tracked logs file
            Add-Content $trackedLogsFile ($log | ConvertTo-Json)
        }

        # Add the event to the list of checked events
        Add-Content $checkedEventsFile $eventId
    }
} catch {
    Write-Host "Error occurred: $_"
}
