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
            sh 'AWS_SECRET_ACCESS_KEY=$AWS_KEY_PSW AWS_ACCESS_KEY_ID=$AWS_KEY_USR docker build --build-arg aws_access_key_id=$aws_access_key_id --build-arg aws_secret_access_key=$aws_secret_access_key --build-arg region=us-east-1 --build-arg cluster=kube .'
            //archiveArtifacts artifacts: 'build/libs/*.jar', fingerprint: true
        }
    }
  }
}



