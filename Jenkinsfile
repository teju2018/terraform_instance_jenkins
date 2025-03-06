pipeline {
    agent any

    parameters {
  string defaultValue: 'Apply', name: 'ACTION'
}

    environment {
        PROJECT_ID = "paul2018"
    }

    stages {
        stage('Setup GCP Credentials') {
            steps {
                withCredentials([file(credentialsId: 'GCP_JSON_KEY', variable: 'GCP_KEY_FILE')]) {
                    sh 'cp $GCP_KEY_FILE terraform-key.json'
                }
            }
        }

        stage('Initialize Terraform') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan'
            }
        }

        stage('Terraform Apply or Destroy') {
            steps {
                script {
                    if (params.ACTION == 'apply') {
                        sh 'terraform apply -auto-approve'
                    } else if (params.ACTION == 'destroy') {
                        sh 'terraform destroy -auto-approve'
                    }
                }
            }
        }
    }
}
