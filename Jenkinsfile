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
            sh 'kubectl get svc/svc-sonarqube -o wide'
            sh 'echo Append :9000/sonar to external ip from above'
        }
    }
  }
}



