FROM jenkins/agent:windowsservercore-ltsc2019

# IT DOESN'T WORK :(

RUN Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force ; \
    Install-Module -Name DockerMsftProvider -Repository PSGallery -Force ; \
    # Workaround for Install-Package failing on first attempt
    try { Install-Package -Name docker -ProviderName DockerMsftProvider -Force } catch { \
       Install-Package -Name docker -ProviderName DockerMsftProvider -Force } ; \ 
    git config --system core.longpaths true