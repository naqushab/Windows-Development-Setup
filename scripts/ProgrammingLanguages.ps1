# Install programming languages
choco install -y python --version 3.6.6
choco install -y pip
choco install -y python2
choco install -y javaruntime
choco install -y java.jdk

# Refresh path
refreshenv

# Update pip
python -m pip install --upgrade pip