## Active Directory User Management & Administration

### 1. User Creation Process
1. Open **Active Directory Users and Computers** (`dsa.msc`) on `DC01`.
2. Navigate to the target OU (e.g., `genitech.lab/Genitech/Users/HR`).
3. Right-click the OU -> **New** -> **User**.
4. Enter user details (First Name, Last Name, User Principal Name e.g., `hr.sara`).
5. Set initial secure password and check **"User must change password at next logon"**.
6. Click **Finish**.

### 2. Password Reset Procedure
1. Locate user account in `dsa.msc`.
2. Right-click the user -> **Reset Password**.
3. Enter new temporary password and confirm.
4. Check **"User must change password at next logon"**.
5. Uncheck **"Unlock the user's account"** (unless locked) and click **OK**.

### 3. Account Unlock Procedure
1. Locate the locked account in `dsa.msc`.
2. Right-click the user -> **Properties** -> Select **Account** tab.
3. Check the box **"Unlock account. This account is currently locked out on this Active Directory Domain Controller."**
4. Click **Apply** and **OK**.

### 4. Adding User to Security Group
1. Locate the user in `dsa.msc`.
2. Right-click the user -> **Add to a group...**
3. Type the group name (e.g., `GG-HR-Users`) and click **Check Names**.
4. Click **OK** upon successful validation.
5. Alternatively, open group properties -> **Members** tab -> **Add** -> Select user account.
