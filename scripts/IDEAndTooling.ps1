# Using vscode as a default IDE
$toolsList = @(
    "notepadplusplus.install"
    "sublimetext3"
    "git --params '/GitAndUnixToolsOnPath /WindowsTerminal'"
    "git-credential-winstore"
    "github"
    "github-desktop"
    "Git-Credential-Manager-for-Windows"
    "p4v"
);

foreach ($tool in $toolsList) {
	choco install -y $tool
	Update-SessionEnvironment
}
if (Test-PendingReboot) { Invoke-Reboot }