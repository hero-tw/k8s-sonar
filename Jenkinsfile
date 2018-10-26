pipeline {
  agent {
    label 'autoscale'
  }
  environment {
    AWS_KEY = credentials('aws-keys')
  }
  stages {

    stage('Init') {
        steps {
            checkout scm
        }
    }

    stage('Deploy SonarQube to AWS') {
        steps {
            sh 'kubectl apply -f sonarqube.yaml'
            sh 'echo http://$(kubectl get svc/svc-sonarqube | grep svc-sonarqube | awk -F" " '{print $4}'):9000/sonar'
        }
    }
  }
}



