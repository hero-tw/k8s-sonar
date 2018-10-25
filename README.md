# k8s-sonar
This project deploys a sonarqube instance into a kubernetes cluster.  It creates a PersistentVolume and claim, a postgres installation and a sonarqube installation

## Docker build
- Ensure the environment variables aws_access_key_id and aws_secret_access_key are set to a user that has access to the k8s cluster
- Region defaults to us-east-1 and cluster to kube.  You can change values in command below
- docker build --build-arg aws_access_key_id=$aws_access_key_id --build-arg aws_secret_access_key=$aws_secret_access_key --build-arg region=us-east-1 --build-arg cluster=kube .

##kubectl build 
- kubectl create sonarqube.yaml

## Validate deployment:
- [ $(wget $(kubectl get svc/svc-sonarqube | grep svc-sonarqube | awk -F" " '{print $4}'):9000/sonar 2>&1 | grep 'awaiting response' | tail -1 | awk -F" " '{print $6}') == '200' ]  && echo "Accessible" || echo "Inaccessible"
- Output should be "Accessible"

## Outstanding Items
- Create image that contains curl, aws cli, aws-iam-authenticator, python, and kubectlS
