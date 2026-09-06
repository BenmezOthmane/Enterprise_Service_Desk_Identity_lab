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



