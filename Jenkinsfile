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
            sh './gradlew clean'
        }
    }

    stage('Deploy SonarQube to AWS') {
        steps {
            sh 'docker build --build-arg aws_access_key_id=$aws_access_key_id --build-arg aws_secret_access_key=$aws_secret_access_key --build-arg region=us-east-1 --build-arg cluster=kube .'
            //archiveArtifacts artifacts: 'build/libs/*.jar', fingerprint: true
        }
    }
  }
}



