# Configure VS Code
code --install-extension ms-python.python

Update-SessionEnvironment
if (Test-PendingReboot) { Invoke-Reboot }