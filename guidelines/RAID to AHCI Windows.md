1. Right-click the Windows Start Menu. Choose Command Prompt (Admin).
2. Type this command and press ENTER: bcdedit /set {current} safeboot minimal
3. Restart the computer and enter BIOS Setup (the key to press varies between systems).
4. Change the SATA Operation mode to AHCI from either IDE or RAID (again, the language varies).
5. Save changes and exit Setup and Windows will automatically boot to Safe Mode.
6. Right-click the Windows Start Menu once more. Choose Command Prompt (Admin).
7. Type this command and press ENTER: bcdedit /deletevalue {current} safeboot
8. Reboot once more and Windows will automatically start with AHCI drivers enabled.

Solution found in: http://triplescomputers.com/blog/uncategorized/solution-switch-windows-10-from-raidide-to-ahci-operation/
