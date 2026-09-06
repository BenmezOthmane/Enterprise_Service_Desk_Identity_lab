<#
.SYNOPSIS
    Enterprise IT Support & Incident Remediation Automation Suite
.DESCRIPTION
    Consolidated PowerShell utilities for resolving common enterprise IT incidents 
    including AD Management, Networking, Security Isolation, and System Maintenance.
#>

# --- INC-001: Unlock AD User Account ---
function Unlock-ADUserAccount {
    param ([string]$Username = "hr.sara")
    Unlock-ADUser -Identity $Username
    Get-ADUser -Identity $Username -Properties LockedOut | Select-Object Name, LockedOut
}

# --- INC-004: Enforce Group Policy Update ---
function Sync-GroupPolicy {
    gpupdate /force
}

# --- INC-005: Restart Print Spooler Service ---
function Restart-PrintSpooler {
    Restart-Service -Name "Spooler" -Force
    Get-Service -Name "Spooler" | Select-Object Name, Status
}

# --- INC-006: Disk Cleanup & Temp Purge ---
function Clear-SystemTemp {
    Remove-Item -Path "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "C:\Windows\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue
}

# --- INC-009: Security Domain Block & Defender Status ---
function Invoke-PhishingMitigation {
    param ([string]$MaliciousDomain = "phishing-attck-site.test")
    Add-Content -Path "C:\Windows\System32\drivers\etc\hosts" -Value "127.0.0.1 $MaliciousDomain"
    Get-MpComputerStatus | Select-Object AntivirusEnabled, RealTimeProtectionEnabled
}

# --- INC-010: Reset DNS & Flush Resolver Cache ---
function Reset-NetworkDNS {
    Get-NetAdapter | Set-DnsClientServerAddress -ResetServerAddresses
    ipconfig /flushdns
}

