# PSDocker
Experience the power of **PSDocker**: PowerShell and Docker, seamlessly combined for script automation using supervisord for a continuously running script 🚀
Looking to run your favorite PowerShell scripts seamlessly within Docker containers on a Linux kernel, not as Windows container? Want to be able to put a powershell script in a kubernetes cluster?

With 'PSDocker,' you can achieve continuous PowerShell automation, harnessing the flexibility and scalability of Docker. 
Whether it's scripting, testing, or automating tasks, you can do it! Supervisord ensures the script will run forever, or until you kill the container :)

## Installing modules & packages

Edit the **Dockerfile** lines:
```
# Install Powershell modules - Update these to your required modules e.g. AzureRM
RUN pwsh -Command "Install-Module -Name **AzureRM**  -Force -Scope AllUsers"
```
```
# Install linux packages for system use e.g. nano
RUN apt-get update && \
    apt-get install -y **nano**
```

## Variables & Docker
You can add variables to the **script.ps1** that you'd like to be passed through from your docker run command:

Script Variable Example:

```
$clientId = $env:CLIENT_ID
$clientSecret = $env:CLIENT_SECRET
$tenantId = $env:TENANT_ID
```

## Build your container
```
docker build <containernametotag> .
docker tag <containernametotag:tag <dockerhubuser>/<containerregistryname>:<tag>
```

## Deploy your container

You can then provide variables in your docker run command:
```
docker run -d \
    --name <dockercontainername> \
    -e CLIENT_ID=<your_client_id> \
    -e CLIENT_SECRET=<your_client_secret> \
    -e TENANT_ID=<your_tenant_id> \
    <registrycontainername:<tag>>

```


## Examples (code not provided)

**Real-time Database Logger:**

Keep a constant watch on your data and log updates to a database with ease. Monitor changes, events, or system activity and maintain a record in real-time using PowerShell and Docker synergy.

**Log Analyser and Alert System:**

Use 'PSDocker' to continuously analyse logs and take action when specific conditions are met. Receive alerts or perform actions based on log content, ensuring you stay on top of system health.

**Custom IoT Data Collector:**

Build a custom Internet of Things (IoT) data collector with 'PSDocker.' Gather sensor data, device stats, or environmental metrics and store them efficiently for analysis.

**Health Check Service**:

Create a continuous health check service for your applications or servers. Ensure your systems are always up and running by automating health checks and recovery procedures.
