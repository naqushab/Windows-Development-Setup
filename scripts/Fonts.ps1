# install fonts

$toolsList = @(
    "inconsolata"
    "firacode"
    "SourceCodePro"
);

foreach ($tool in $toolsList) {
	choco install -y $tool
	Update-SessionEnvironment
}