FROM ubuntu:latest
RUN apt-get update && apt-get install -y curl && apt-get install -y unzip && apt-get install -y python
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && mv ./kubectl /usr/local/bin/kubectl
RUN curl -o aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.10.3/2018-07-26/bin/linux/amd64/aws-iam-authenticator && \
    chmod +x ./aws-iam-authenticator && cp ./aws-iam-authenticator /usr/local/bin/aws-iam-authenticator && export PATH=$HOME/bin:$PATH
RUN curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip" && \
    unzip awscli-bundle.zip && \
    ./awscli-bundle/install -b ~/bin/aws
ARG aws_access_key_id
ARG aws_secret_access_key
ARG region=us-eat-1
ARG cluster=kue
ENV AWS_ACCESS_KEY_ID $aws_access_key_id
ENV AWS_SECRET_ACCESS_KEY $aws_secret_access_key
RUN $HOME/bin/aws eks update-kubeconfig --name $cluster --region $region
ADD sonarqube.yaml /tmp/
RUN kubectl create -f /tmp/sonarqube.yaml