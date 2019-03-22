# Using vscode as a default IDE
$toolsList = @(
    "vscode"
    "notepadplusplus.install"
    "git --package-parameters="'/GitAndUnixToolsOnPath /WindowsTerminal'""
    "poshgit"
    "git-credential-winstore"
    "github"
    "Git-Credential-Manager-for-Windows"
    "p4v"
);

foreach ($tool in $toolsList) {
	choco install -y $tool
	Update-SessionEnvironment
}
if (Test-PendingReboot) { Invoke-Reboot }