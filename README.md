# PowerShellDocker
Experience the power of 'PowerShellDocker': PowerShell and Docker, seamlessly combined for script automation using supervisord for a continuously running script 🚀
Looking to run your favorite PowerShell scripts seamlessly within Docker containers on a Linux kernel, not as Windows container? Want to be able to put a powershell script in a kubernetes cluster?

With 'PowerShellDocker,' you can achieve continuous PowerShell automation, harnessing the flexibility and scalability of Docker. 
Whether it's scripting, testing, or automating tasks, you can do it! Supervisord ensures the script will run forever, or until you kill the container :)

## Updating modules & packages in Dockerfile

Edit the Dockerfile lines:
```
# Install Powershell modules - Update these to your required modules e.g. AzureRM
RUN pwsh -Command "Install-Module -Name AzureRM  -Force -Scope AllUsers"
```
```
# Install linux packages for system use e.g. nano
RUN apt-get update && \
    apt-get install -y nano
```

## Variables & Docker
You can add variables to the script that you'd like to be passed through from your docker run command:

Example:

```
$clientId = $env:CLIENT_ID
$clientSecret = $env:CLIENT_SECRET
$tenantId = $env:TENANT_ID
```

You can then provide these in your docker run command:
```
docker run -d \
    --name <dockercontainername> \
    -e CLIENT_ID=<your_client_id> \
    -e CLIENT_SECRET=<your_client_secret> \
    -e TENANT_ID=<your_tenant_id> \
    <yourregistrycontainername>

```


## Examples (code not provided)

**Real-time Database Logger:**

Keep a constant watch on your data and log updates to a database with ease. Monitor changes, events, or system activity and maintain a record in real-time using PowerShell and Docker synergy.

**Web Scraping on Autopilot:**

Automate web scraping tasks without missing a beat. 'PowerShellDocker' ensures your web scraper runs continuously, providing you with up-to-date data effortlessly.

**Scheduled Script Runner:**

Schedule and run your PowerShell scripts at regular intervals within Docker containers. 'PowerShellDocker' makes it a breeze to maintain tasks like backups, updates, or routine maintenance.

**Event-Driven Automation:**

Set up event-driven automation effortlessly. Whether it's responding to incoming data, triggering actions on specific events, or monitoring logs in real-time, 'PowerShellDocker' simplifies the process.

**Log Analyzer and Alert System:**

Use 'PowerShellDocker' to continuously analyze logs and take action when specific conditions are met. Receive alerts or perform actions based on log content, ensuring you stay on top of system health.

**Custom IoT Data Collector:**

Build a custom Internet of Things (IoT) data collector with 'PowerShellDocker.' Gather sensor data, device stats, or environmental metrics and store them efficiently for analysis.

**Resource Usage Tracker:**

Keep tabs on resource usage, such as CPU or memory, in real-time. 'PowerShellDocker' helps you monitor and log these metrics for better system management.

**Social Media Listener:**

Monitor social media channels for keywords, mentions, or trends and take automated actions in response. 'PowerShellDocker' lets you stay engaged with your online audience 24/7.
' lets you stay engaged with your online audience 24/7.

**Health Check Service**:

Create a continuous health check service for your applications or servers. Ensure your systems are always up and running by automating health checks and recovery procedures.

**Automated Content Updater**:

Keep your website or content platform fresh by automating content updates at regular intervals. 'PowerShellDocker' can fetch, format, and publish new content seamlessly.

