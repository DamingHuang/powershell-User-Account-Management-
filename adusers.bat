@echo off
echo Script started at %date% %time% >> \\WIN-PO0QFHEI7V0\CleanDesktop\Administrator\Desktop\users\log.txt
powershell.exe -ExecutionPolicy Bypass -File "\\WIN-PO0QFHEI7V0\CleanDesktop\Administrator\Desktop\users\adusers.ps1" >> \\WIN-PO0QFHEI7V0\CleanDesktop\Administrator\Desktop\users\errlog.txt 2>&1
echo Script finished at  %date% %time% >> \\WIN-PO0QFHEI7V0\CleanDesktop\Administrator\Desktop\users\log.txt