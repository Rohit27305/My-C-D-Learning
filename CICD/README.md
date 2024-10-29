
# What is Jenkins?

Jenkins is an open-source automation server that enables developers to build, test, and deploy their software reliably. It is used to automate parts of the software development process, including building code, running tests, and deploying applications.

## Features of Jenkins

- **Easy Installation**: Jenkins can be easily installed through native system packages, Docker, or even run standalone by any machine with a Java Runtime Environment (JRE) installed.
- **Extensible**: With hundreds of plugins in the Update Center, Jenkins integrates with practically every tool in the continuous integration and continuous delivery (CI/CD) toolchain.
- **Distributed Builds**: Jenkins can distribute build/test loads to multiple machines, improving performance and reliability.
- **Pipeline as Code**: Jenkins pipelines can be defined in a simple, human-readable text format, making it easy to version and review CI/CD pipelines.
- **Extensive Community Support**: Being open-source, Jenkins has a large and active community that contributes plugins, documentation, and support.

## Why Do We Need Jenkins?

- **Automation**: Jenkins automates repetitive tasks, reducing the risk of human error and freeing up developer time for more critical tasks.
- **Continuous Integration**: Jenkins enables continuous integration, allowing developers to frequently merge code changes into a shared repository, where automated builds and tests are run.
- **Continuous Delivery**: Jenkins supports continuous delivery, enabling automated deployment of applications to production environments.
- **Improved Collaboration**: Jenkins facilitates better collaboration among team members by providing a central platform for managing and monitoring the CI/CD pipeline.
- **Scalability**: Jenkins can scale to handle large projects and multiple teams, making it suitable for organizations of all sizes.

# Install Jenkin
Follow the given instructions
[https://www.jenkins.io/doc/book/installing/linux/#debianubuntu](https://www.jenkins.io/doc/book/installing/linux/#debianubuntu)

# Setup Jenkin
- First enable port 8080 if you are using ec2
- ```/var/lib/jenkins/secrets/initialAdminPassword``` copy test form given path use ```sudo cat /var/lib/jenkins/secrets/initialAdminPassword``` to get passowrd
- 

