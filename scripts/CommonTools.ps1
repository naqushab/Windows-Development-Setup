# tools we expect devs across many scenarios will want
$toolsList = @(
    "7zip.install"
    "sysinternals"
    "bitvise-ssh-client"
    "putty"
    "ccleaner"
    "procexp"
    "curl"
    "wget"
    "awscli"
    "awstools.powershell"
    "lockhunter"
    "ditto"
    "conemu"
    "clink"
);

foreach ($tool in $toolsList) {
	choco install -y $tool
	Update-SessionEnvironment
}

if (Test-PendingReboot) { Invoke-Reboot }