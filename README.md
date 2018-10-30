# k8s-sonar
This project deploys a sonarqube instance into a kubernetes cluster.  It creates a PersistentVolume and claim, a postgres installation and a sonarqube installation

## kubectl build
- kubectl apply -f sonarqube.yaml

## Validate deployment:
- Ensure wget is installed (brew install wget on MacOS)
- [ $(wget $(kubectl get svc/svc-sonarqube | grep svc-sonarqube | awk -F" " '{print $4}'):9000/sonar 2>&1 | grep 'awaiting response' | tail -1 | awk -F" " '{print $6}') == '200' ]  && echo "Accessible" || echo "Inaccessible"
- Output should be "Accessible"

## Notes
- Ensure that the default:jenkins account has the proper role bindings: kubectl create rolebinding jenkins-admin-binding --clusterrole=admin --user=jenkins --namespace=default
 
## Outstanding Items
- pv is commented out right now since we're getting a permission issue in our pipeline. Our k8s config currently allows dynamic pv so this is not an issue as of now 
- The loadbalancer urls generated for the svc-sonarqube should ideally be stored in a location where it can be consumed by application pipelines
- Create image that contains curl, aws cli, aws-iam-authenticator, python, and kubectl.  This might not be necessary given that our jenkins worker has kubectl installed
