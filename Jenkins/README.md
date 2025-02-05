# Jenkins for Beginners

## Introduction
Jenkins is an open-source automation server that helps automate the parts of software development related to building, testing, and deploying, facilitating continuous integration and continuous delivery (CI/CD). It is a widely used tool in DevOps practices.

## Key Features
- **Easy Installation**: Jenkins can be installed through native system packages, Docker, or even run standalone by any machine with a Java Runtime Environment (JRE) installed.
- **Extensible**: With hundreds of plugins in the Update Center, Jenkins integrates with practically every tool in the continuous integration and continuous delivery toolchain.
- **Distributed Builds**: Jenkins can distribute build/test loads to multiple machines, improving performance and reliability.

## Getting Started
1. **Installation**:
    - Download Jenkins from the [official website](https://jenkins.io/).
    - Follow the installation instructions for your operating system.

2. **Setup**:
    - After installation, start Jenkins and complete the setup wizard.
    - Install suggested plugins or select specific plugins based on your needs.

3. **Creating a Job**:
    - Go to the Jenkins dashboard and click on "New Item".
    - Enter a name for your job and select the type of project (e.g., Freestyle project).
    - Configure the job by specifying the source code repository, build triggers, and build steps.

4. **Running a Job**:
    - Once the job is configured, you can run it manually by clicking "Build Now" or set up triggers for automatic builds.

## Conclusion
Jenkins is a powerful tool for automating the software development process. Its flexibility and extensibility make it suitable for projects of all sizes. By integrating Jenkins into your workflow, you can improve the efficiency and reliability of your development and deployment processes.

For more detailed information, refer to the [Jenkins documentation](https://www.jenkins.io/doc/).

## What are Jobs in Jenkins?

In Jenkins, a job represents a task or a set of tasks that Jenkins executes. Jobs are the fundamental building blocks in Jenkins and can be configured to perform various activities such as building code, running tests, deploying applications, and more. There are different types of jobs in Jenkins, including:

- **Freestyle Project**: A flexible and easy-to-configure job type that allows you to define build steps and post-build actions.
- **Pipeline**: A job type that uses a Groovy-based DSL to define a series of steps in a Jenkinsfile, providing more complex and robust build workflows.
- **Multibranch Pipeline**: A job type that automatically creates pipelines for branches and pull requests in a source code repository.
- **Folder**: A job type that allows you to organize multiple jobs into a single folder, making it easier to manage large numbers of jobs.

Each job can be configured with various settings, such as source code repositories, build triggers, build steps, and post-build actions. Jobs can be triggered manually, scheduled to run at specific times, or triggered by events such as code commits or pull requests.

## Shared Libraries in Jenkins

Shared Libraries in Jenkins allow you to create reusable code that can be shared across multiple Jenkins pipelines. This helps in maintaining consistency, reducing code duplication, and simplifying the management of common tasks.

### Creating a Shared Library

1. **Repository Structure**:
    - Create a new Git repository for your shared library.
    - The repository should have the following structure:
      ```
      (root)
      ├── vars/
      │   └── mySharedFunction.groovy
      └── src/
          └── org/
              └── foo/
                  └── Bar.groovy
      ```

2. **Defining Functions**:
    - In the `vars` directory, create Groovy files with the functions you want to share. For example, `mySharedFunction.groovy`:
      ```groovy
      def call(String name) {
          echo "Hello, ${name}!"
      }
      ```

3. **Using Classes**:
    - In the `src` directory, you can define Groovy classes. For example, `Bar.groovy`:
      ```groovy
      package org.foo

      class Bar {
          static void sayHello(String name) {
              println "Hello, ${name}!"
          }
      }
      ```

### Using Shared Libraries in Pipelines

1. **Configure the Library**:
    - In Jenkins, go to "Manage Jenkins" > "Configure System" > "Global Pipeline Libraries".
    - Add a new library with the name of your repository and specify the source code repository details.

2. **Importing the Library**:
    - In your Jenkinsfile, you can import and use the shared library:
      ```groovy
      @Library('my-shared-library') _
      mySharedFunction('World')
      ```

3. **Using Classes from the Library**:
    - You can also use classes defined in the shared library:
      ```groovy
      @Library('my-shared-library') _
      import org.foo.Bar

      pipeline {
          agent any
          stages {
              stage('Example') {
                  steps {
                      script {
                          Bar.sayHello('World')
                      }
                  }
              }
          }
      }
      ```

Shared Libraries provide a powerful way to modularize and reuse code across multiple Jenkins pipelines, making your CI/CD processes more efficient and maintainable.


## Managing Credentials in Jenkins

Jenkins provides a secure way to manage credentials, such as passwords, SSH keys, and API tokens, which are required for various tasks like accessing source code repositories, deploying applications, and integrating with external services.

### Adding Credentials

1. **Global Credentials**:
    - Go to "Manage Jenkins" > "Manage Credentials".
    - Select the appropriate domain (e.g., "Global").
    - Click on "Add Credentials" and fill in the required fields:
      - **Kind**: Select the type of credential (e.g., Username with password, SSH Username with private key, Secret text).
      - **Scope**: Choose the scope (e.g., Global, System).
      - **ID**: Optionally, provide an ID for the credential.
      - **Description**: Provide a description for the credential.
      - **Username/Password/Secret**: Enter the credential details.

2. **Folder-Level Credentials**:
    - Navigate to the specific folder where you want to add credentials.
    - Click on "Credentials" in the sidebar.
    - Follow the same steps as adding global credentials.

### Using Credentials in Jobs

1. **Freestyle Projects**:
    - In the job configuration, go to the section where credentials are required (e.g., Source Code Management, Build Environment).
    - Select the appropriate credential from the dropdown list.

2. **Pipeline Jobs**:
    - Use the `credentialsId` parameter to reference the credential in your Jenkinsfile:
      ```groovy
      pipeline {
          agent any
          stages {
              stage('Checkout') {
                  steps {
                      git credentialsId: 'my-credential-id', url: 'https://github.com/my-repo.git'
                  }
              }
          }
      }
      ```

3. **WithCredentials Step**:
    - Use the `withCredentials` step to bind credentials to environment variables:
      ```groovy
      pipeline {
          agent any
          stages {
              stage('Deploy') {
                  steps {
                      withCredentials([usernamePassword(credentialsId: 'my-credential-id', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                          sh 'echo $USERNAME'
                          sh 'echo $PASSWORD'
                      }
                  }
              }
          }
      }
      ```

### Best Practices

- **Use Specific Scopes**: Limit the scope of credentials to the minimum necessary (e.g., folder-level instead of global) to reduce the risk of exposure.
- **Rotate Credentials**: Regularly update and rotate credentials to minimize the impact of potential leaks.
- **Audit Usage**: Monitor and audit the usage of credentials to detect any unauthorized access.

By securely managing credentials in Jenkins, you can ensure that sensitive information is protected while enabling seamless integration with various tools and services in your CI/CD pipeline.


