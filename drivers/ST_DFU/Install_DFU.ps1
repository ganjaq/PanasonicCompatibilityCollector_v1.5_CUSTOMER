param(
    [ValidateSet('pl','en','de')][string]$Language,
    [switch]$CheckOnly
)
$ErrorActionPreference = 'Stop'
$taskRoot = $PSScriptRoot
if (-not $Language) { $Language = [Globalization.CultureInfo]::CurrentUICulture.TwoLetterISOLanguageName }
if ($Language -notin @('pl','en','de')) { $Language = 'en' }
$taskMessages = (Get-Content -LiteralPath (Join-Path $taskRoot 'messages.json') -Raw -Encoding UTF8 | ConvertFrom-Json).$Language
function Show-TaskMessage([string]$Message, [string]$Kind = 'Information') {
    Add-Type -AssemblyName System.Windows.Forms
    [System.Windows.Forms.MessageBox]::Show($Message, $taskMessages.title, 'OK', $Kind) | Out-Null
}
try {
    $taskExpectedFiles = @{
        'STtube.inf' = '5FAB6E7F2E6D7E62BC6A95D4F16E756974CDD43297887F0341ECA436BD975941'
        'sttube.cat' = 'E9C4304025CDE2E37AFE64816844B7851548130398260D522D84E6408240EF39'
        'x64\STTub30.sys' = 'C5A8B923657C61A657ED8FAC35505B5CA2D9D9A43019AC7ADD20E63DD382D340'
        'x86\STTub30.sys' = 'F89DD75BDE309737C01528D62DA8683152EB1C67AE50AEB7F794BFA32E03DD0D'
        'SLA0044.txt' = '99A4771080E7BC685C235151246C28A6C70802C6F4BE93BE7E447A622B6DE192'
    }
    foreach ($taskName in $taskExpectedFiles.Keys) {
        $taskPath = Join-Path $taskRoot $taskName
        if (-not (Test-Path -LiteralPath $taskPath -PathType Leaf) -or
            (Get-FileHash -LiteralPath $taskPath -Algorithm SHA256).Hash -ne $taskExpectedFiles[$taskName]) {
            throw ($taskMessages.integrity + ' ' + $taskName)
        }
    }
    if ((Get-AuthenticodeSignature -LiteralPath (Join-Path $taskRoot 'sttube.cat')).Status -ne 'Valid') {
        throw $taskMessages.signature
    }
    if ($CheckOnly) { Write-Output 'PACKAGE_CHECK_PASS; no installation performed'; exit 0 }
    if ([Environment]::OSVersion.Version.Major -lt 10 -or [Environment]::OSVersion.Version.Build -lt 14393) {
        throw $taskMessages.os
    }
    if ($env:PROCESSOR_ARCHITECTURE -eq 'ARM64' -or $env:PROCESSOR_ARCHITEW6432 -eq 'ARM64') {
        throw $taskMessages.arch
    }
    $taskIdentity = [Security.Principal.WindowsIdentity]::GetCurrent()
    $taskPrincipal = New-Object Security.Principal.WindowsPrincipal($taskIdentity)
    if (-not $taskPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
        Add-Type -AssemblyName System.Windows.Forms
        $taskAnswer = [System.Windows.Forms.MessageBox]::Show($taskMessages.confirm, $taskMessages.title, 'YesNo', 'Question')
        if ($taskAnswer -ne [System.Windows.Forms.DialogResult]::Yes) { exit 1223 }
        $taskArgs = '-NoProfile -ExecutionPolicy Bypass -File "' + $PSCommandPath + '" -Language ' + $Language
        $taskElevatedProcess = Start-Process -FilePath (Join-Path $env:SystemRoot 'System32\WindowsPowerShell\v1.0\powershell.exe') -ArgumentList $taskArgs -Verb RunAs -WindowStyle Hidden -PassThru -Wait
        exit $taskElevatedProcess.ExitCode
    }
    $taskPnpUtil = Join-Path $env:SystemRoot 'System32\pnputil.exe'
    & $taskPnpUtil /add-driver (Join-Path $taskRoot 'STtube.inf') /install
    $taskExitCode = $LASTEXITCODE
    if ($taskExitCode -notin @(0,3010)) { throw ($taskMessages.failed + ' ' + $taskExitCode) }
    if ($taskExitCode -eq 3010) { Show-TaskMessage $taskMessages.reboot; exit 3010 }
    # Package installation success alone is not proof that a connected display is accessible.
    $taskInterfaceText = (& $taskPnpUtil /enum-interfaces /enabled /class '{3FE809AB-FB91-4CB5-A643-69670D52366E}') -join "`n"
    if ($taskInterfaceText -match '(?i)vid_0483&pid_df11') {
        Show-TaskMessage $taskMessages.ready
    } else {
        Show-TaskMessage $taskMessages.installed
    }
    exit 0
} catch {
    if ($CheckOnly) { Write-Error $_.Exception.Message; exit 1 }
    Show-TaskMessage ($taskMessages.error + "`r`n" + $_.Exception.Message) 'Error'
    exit 1
}
