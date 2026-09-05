## Active Directory & Group Policy Setup 

* **Domain Controller:** `DC01.genitech.lab` (Windows Server 2022)
* **Domain Name:** `genitech.lab`
...

![Active Directory Domain Setup](evidence/screenshots/02-ad-domain-configured.png)
![Group Policy Configuration](evidence/screenshots/07-gpo-applied-on-client.png)

---
* **Organizational Unit (OU) Structure:**
  * `Genitech` (Root OU)
    * `Users` -> Sub-OUs: `HR`, `IT`, `Finance`, `Sales`
    * `Groups` -> Security Groups: `GG-HR-Users`, `GG-IT-Users`, `GG-Sales-Users`, `GG-Finance-Users`
    * `Computers` -> Workstations: `WIN-USER-01`
* **Group Policy Objects (GPOs):**
  * `Default Domain Policy` (Linked to `genitech.lab` domain)
  * **Configured Enforcements:** Password Password complexity enabled, Maximum password age set to 30 days, Minimum password age set to 1 day, Minimum password length set to 7 characters.
* **Shared Storage & NTFS Permissions:**
  * Folder path: `C:\HR_Data`
  * Security Permissions: Full Access to `Administrators`, Modify/Read access restricted to `GG-HR-Users` domain security group.
* **Client Verification:** Domain join and GPO inheritance confirmed on `WIN-USER-01` via `gpresult /r` for computer scope.

---

## GLPI ITSM & Active Directory Integration Setup

### Why GLPI?
GLPI was selected as the IT Service Management (ITSM) solution because it is an open-source, robust, ITIL v4-compliant platform that seamlessly integrates IT Asset Management (ITAM) with Helpdesk Service Requests, Incident Management, and native LDAP/Active Directory authentication.

### LDAP / Active Directory Integration
* **Directory Server:** `DC01.genitech.lab` (`192.168.10.10`)
* **Base DN:** `DC=genitech,DC=lab`
* **Root DN (Bind User):** `CN=Administrator,CN=Users,DC=genitech,DC=lab`
* **Port:** `389` (Standard LDAP)
* **User Filter:** `(&(objectClass=user)(objectCategory=person)(!(userAccountControl:1.2.840.113556.1.4.803:=2)))`
* **Field Mapping:** Synchronized `samaccountname` to GLPI Login, `mail` to Email, and `givenname`/`sn` to User Profile.

### Ticket Categories
Standardized ITIL categories configured to route incidents effectively:
* **Access & Identity:** Permissions, account lockouts, active directory access issues.
* **Hardware:** Physical workstation, monitor, or peripheral failures.
* **Software:** Operating system, office applications, and line-of-business software errors.
* **Network:** Connectivity, Wi-Fi, VPN, and DNS/IP conflicts.
* **Service Request:** General requests for hardware/software provisioning.

### Priority & SLA Policy Matrix
Priorities are calculated automatically based on **Impact** $\times$ **Urgency**:

| Priority Level | Description | Target Response (TTO) | Target Resolution (TTR) |
| :--- | :--- | :--- | :--- |
| **P1 - Critical** | Enterprise-wide outage / Core server down | 15 minutes | 2 hours |
| **P2 - High** | Departmental workflow blocked / Major feature down | 30 minutes | 4 hours |
| **P3 - Medium** | Single user work impaired with workarounds | 2 hours | 8 hours |
| **P4 - Low** | Minor issue / Non-urgent request | 4 hours | 24 hours |
