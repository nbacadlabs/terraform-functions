pipeline {
    agent any

    environment {
        // Define AWS credentials and region
        AWS_REGION = 'us-east-1'
        // Make sure these credentials are stored securely in Jenkins
        AWS_ACCESS_KEY_ID = credentials('aws-access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/nbacadlabs/terraform-functions.git'
            }
        }

        stage('Install Terraform') {
            steps {
                sh '''
                if ! terraform -v > /dev/null 2>&1; then
                    curl -o terraform.zip https://releases.hashicorp.com/terraform/1.6.6/terraform_1.6.6_linux_amd64.zip
                    unzip terraform.zip
                    sudo mv terraform /usr/local/bin/
                fi
                '''
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'cd ./bootstrap'
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'cd ./bootstrap'
                sh 'terraform plan -out=tfplan'
            }
        }

        stage('Terraform Destroy') {
            steps {
                input message: 'Approve Terraform Destroy?'
                sh 'cd ./bootstrap'
                sh 'terraform destroy'
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}