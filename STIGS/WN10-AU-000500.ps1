<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Corey Hall
    LinkedIn        : https://www.linkedin.com/in/corey-hall-a03337241/
    GitHub          : https://github.com/coreyhallbtrt
    Date Created    : 2025-03-04
    Last Modified   : 2025-03-04
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000500

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-AU-000500).ps1 
#>

# YOUR CODE GOES HERE

# Define registry path and desired value
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application"
$propertyName = "MaxSize"
$desiredSizeKB = 32768  # 0x8000 in hex

# Create the registry key if it doesn't exist
If (-Not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the MaxSize value
Set-ItemProperty -Path $regPath -Name $propertyName -Value $desiredSizeKB -Type DWord

# Confirm the change
$currentValue = Get-ItemProperty -Path $regPath -Name $propertyName
Write-Host "MaxSize has been set to $($currentValue.MaxSize) KB"
