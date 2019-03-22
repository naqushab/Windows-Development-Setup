#--- Browsers ---
$toolsList = @(
    "googlechrome"
    "firefox"
);

foreach ($tool in $toolsList) {
	choco install -y $tool
	Update-SessionEnvironment
}

if (Test-PendingReboot) { Invoke-Reboot }