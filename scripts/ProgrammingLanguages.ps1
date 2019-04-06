# Install programming languages
$toolsList = @(
    "python3"
    "pip"
    "python2"
    "javaruntime" 
);

foreach ($tool in $toolsList) {
	choco install -y $tool
	Update-SessionEnvironment
}

# Update pip
python -m pip install --upgrade pip

if (Test-PendingReboot) { Invoke-Reboot }