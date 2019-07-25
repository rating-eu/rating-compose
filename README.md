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


