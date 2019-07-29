# Using vscode as a default IDE
$toolsList = @(
    "vscode"
    "notepadplusplus.install"
    "sublimetext3"
    "git --params '/GitAndUnixToolsOnPath /WindowsTerminal'"
    "github-desktop"
    "Git-Credential-Manager-for-Windows"
    "p4v"
);

foreach ($tool in $toolsList) {
	choco install -y $tool
	Update-SessionEnvironment
}
if (Test-PendingReboot) { Invoke-Reboot }
