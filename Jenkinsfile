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
                withCredentials([file(credentialsId: 'GCP_JSON_KEY', variable: 'GOOGLE_APPLICATION_CREDENTIALS')]) {
                    sh 'gcloud auth activate-service-account --key-file=$GOOGLE_APPLICATION_CREDENTIALS'
                    sh 'gcloud config set project $PROJECT_ID'
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
