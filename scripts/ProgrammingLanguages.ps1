# Install programming languages
$toolsList = @(
    "python3 --version 3.6.6"
    "pip"
    "python2"
    "javaruntime"
    "java.jdk"
);

foreach ($tool in $toolsList) {
	choco install -y $tool
	Update-SessionEnvironment
}

# Update pip
python -m pip install --upgrade pip

if (Test-PendingReboot) { Invoke-Reboot }