Enable-WindowsOptionalFeature -Online -FeatureName containers -All
RefreshEnv
if (Test-PendingReboot) { Invoke-Reboot }
choco install -y docker-for-windows
RefreshEnv
if (Test-PendingReboot) { Invoke-Reboot }