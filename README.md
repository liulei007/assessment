# assessment
helm-s3-and-k8s


# This instructurion is to build helm repository on S3, list s3 contents on http web browser

*pre-requirements to set up an environment:
  . terraform version 1.0 and above
  . docker engine and Kubernetes environment(minikube), helm 
  . python, flask, and pip

##  1.  Set up S3 with Terraform, and initial as helm repository
      Terraform will build s3 bucket and grant access for this user account, also will initialize the helm repository by uploading the index.html into the S3 bucket.
Use follow commands to initialize and apply terraform to build s3.
```shell
terraform init
terraform plan
terraform appply
```
 ## 2.  Docker, and Kubernetes
 . DockerFile has all essential run environments set up for HTTP app running.
 . HTTP app will use python-boto3, flask to query the S3 bucket, and return JSON into the browser.
 .  The deployment use Kubernetes  """configmap""" ,and """secret"""  to hide sensitive information such as URL, and accesskey pair.
.  Use helm chart as package management. 

To build with Dockerfile

** docker login

** docker build -t k8s-s3-inf .

** docker tag k8s-s3-inf leisworld/k8s-s3-inf

** docker push leisworld/k8s-s3-inf

Modify your helm file with docker's image url and use helm to deploy app.


To deplete deployment
** kubectl delete svc s3-info 
** kubectl delete deployment s3-info-app

## 3.  Set up GitHub action with auto-upload helm package when triggered.
