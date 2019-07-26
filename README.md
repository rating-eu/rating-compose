
## RATING Compose
Docker Compose project for deploying the full RATING framework.

## System requirements
### Hardware requirements
The current version of the Tool requires one virtual or physical machine with the following specifications:

* **CPU**: 4 64-bit cores or more
* **RAM**: 8 GB or more
* **Disk**: 40GB or more
* **OS**: CentOS 7.4.1708

### Network requirements
The RATING risk assessment tool user interface is exposed as a web application that must be reachable by users. In addition, the tool needs outbound internet connectivity for running updates checks and sending emails, as well as inbound connectivity for receiving results form (possible) external tools.

Basically, network requirements are:

* SSH or local console access to the machine, for system administrators.
* 1 static IP and corresponding DNS name that will be used to reach the tool.
* HTTPS access to the IP above the tool to access the web UI.
* SMTP server for sending email notifications. The SMTP server is configurable so both internal or external SMTP can be used.

### Software requirements
Note: in principle, any Linux distribution capable of running Docker should work, but at this time we are testing and providing installation instructions for the CentOS only. We will not provide support for different distributions. Moreover, we will not provide instruction to set-up Docker or Git services.
The required software programs are:

* Docker v.18.06.01-ce or later versions
* Docker-compose v.1.22.0 or later versions
* Git v.2.17.1 or later versions

## License
The framework is released under the **Apache 2.0 License**.

## Quick Start Configuration
This section explains how to quickly get the tool up and running on a machine that meets the requirements described in the above section.

Installation procedure:

 1. Prepare the host machine according to the requirements described in the above section.
 2. Clone the RATING-Compose repository and checkout the latest release:
~~~sh
git clone https://github.com/rating-eu/rating-compose.git rating-compose
cd rating-compose
git checkout 1.4.3
~~~
 3. Set persistent environment variables used by the Compose file:
~~~sh
cat > .env << EOF
HERMENEUT_IMAGE=rating/rating
HERMENEUT_VERSION=1.4.3
EMAIL_HOST=smtp.your_host.your_domain
EMAIL_PORT=your_smtp_port
EMAIL_USERNAME=your_smtp_username
EMAIL_ADDRESS=your_smtp_email_address
EMAIL_PASSWORD=your_smtp_password
EMAIL_PROTOCOL=smtp
EMAIL_TLS=true|false
EMAIL_AUTH=true|false
SERVER_URL=https://application.base-url[:port_number]
EOF
~~~
 4. Pull the Docker images:
 ~~~sh
docker-compose pull
~~~
 5. Start up the application
 ~~~sh
docker-compose up -d
~~~
 6. Wait for the application to start up (seeing the logs)
 ~~~sh
docker-compose logs –f
~~~
The system is fully operational when you read:
 ~~~sh
hermeneut-app_1 | Application 'hermeneut' is running! 
~~~
Use CTRL+C to detach from the logs when done.
