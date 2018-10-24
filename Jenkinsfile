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
            // sh 'env aws_secret_access_key=$AWS_KEY_PSW '
            // sh 'echo aws_secret_access_key'
            // sh 'aws_access_key_id=$AWS_KEY_USR docker build --build-arg aws_access_key_id=$aws_access_key_id --build-arg aws_secret_access_key=$aws_secret_access_key --build-arg region=us-east-1 --build-arg cluster=kube .'
            sh 'kubectl create -f sonarqube.yaml'
            //sh 'docker build --build-arg aws_access_key_id=$AWS_KEY_USR --build-arg aws_secret_access_key=$AWS_KEY_PSW --build-arg region=us-east-1 --build-arg cluster=kube .'
            //archiveArtifacts artifacts: 'build/libs/*.jar', fingerprint: true
        }
    }
  }
}



