# Description: Boxstarter Script
# Author: Naqushab
# Dev Env Setup
Enable-RemoteDesktop
Disable-UAC
Update-ExecutionPolicy Unrestricted

# Get the base URI path from the ScriptToCall value
$bstrappackage = "-bootstrapPackage"
$helperUri = $Boxstarter['ScriptToCall']
$strpos = $helperUri.IndexOf($bstrappackage)
$helperUri = $helperUri.Substring($strpos + $bstrappackage.Length)
$helperUri = $helperUri.TrimStart("'", " ")
$helperUri = $helperUri.TrimEnd("'", " ")
$helperUri = $helperUri.Substring(0, $helperUri.LastIndexOf("/"))
write-host "Helper script base URI: $helperUri"

function executeScript {
	Param ([string]$script)
	$scriptUri = $helperUri + "/scripts"
	write-host "Executing Script: $scriptUri/$script"
	iex ((new-object net.webclient).DownloadString("$scriptUri/$script"))
}

function executeConfig {
	Param ([string]$config)
	$configUri = $helperUri + "/configs"
	write-host "Executing Config: $configUri/$config ..."
	iex ((new-object net.webclient).DownloadString("$configUri/$config"))
}

$scriptsList = @(
	"Fonts.ps1"
	"Browsers.ps1"
	"CommonTools.ps1"
	"IDEAndTooling.ps1"
	"ProgrammingLanguages.ps1"
	"HyperV.ps1"
	"WSL.ps1"
	"Docker.ps1"
);

$configsList = @(
	"Adblock.ps1"
	"RemoveDefaultApps.ps1"
	"SystemConfiguration.ps1"
	"TaskBar.ps1"
	"FileExplorerSettings.ps1"
	"Git.ps1"
	"VSCode.ps1"
);

#--- Setting up Windows ---
foreach ($script in $scriptsList) {
	executeScript $script
	Update-SessionEnvironment
}

foreach ($config in $configsList) {
	executeConfig $config
	Update-SessionEnvironment
}

#--- reenabling critial items ---
Enable-UAC
Enable-MicrosoftUpdate
Install-WindowsUpdate -acceptEula