# Use a Linux base image
FROM ubuntu:lunar

# Install PowerShell
RUN apt-get update && \
    apt-get install -y wget && \
    wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb && \
    dpkg -i packages-microsoft-prod.deb && \
    apt-get update && \
    apt-get install -y powershell && \
    rm packages-microsoft-prod.deb

# Install Powershell modules - Update these to your required modules
RUN pwsh -Command "Install-Module -Name <modulename> -Force -Scope AllUsers"

# Install linux packages for system use e.g. nano
RUN apt-get update && \
    apt-get install -y nano

# Copy your PowerShell script into the container
COPY script.ps1 /app/

# Install supervisord
RUN apt-get install -y supervisor

# Copy the supervisord configuration file
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Start supervisord
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
