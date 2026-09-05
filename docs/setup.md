## Active Directory & Group Policy Setup 

* **Domain Controller:** `DC01.genitech.lab` (Windows Server 2022)
* **Domain Name:** `genitech.lab`
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
