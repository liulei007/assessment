

Install helm s3 plugin on your local 

For use curl install helm:
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

For Mac:
brew install helm

Install helm s3 plugin
helm plugin install https://github.com/hypnoglow/helm-s3.git

terraform init

terraform apply


Once terraform complete set up bucket, you can use your access keys and secret to access the helm s3 bucket.


You will need to get secret and config the aws key pair for your helm repo accesses.

terraform output bucket_aws_secret

Terraform will upload and initial the helm s3 repo by upload the index.yaml into s3.

Will need add bucket into Helm as following command on your console

helm repo add my-charts s3://helm-repository-20211126/charts

You should see this message once added repository
"my-charts" has been added to your repositories


you may need add stable repo to be able pull stable repository.
helm repo add stable https://charts.helm.sh/stable


pull a test repo
helm fetch stable/rabbitmq

To push test repo into our own s3 repository

helm s3 push rabbitmq-6.18.2.tgz my-charts


  490  brew install hyperkit
  491  brew install minikube\n\n# Install Docker CLI\nbrew install docker\nbrew install docker-compose\n\n# Start minikube\nminikube start\n\n# Tell Docker CLI to talk to minikube's VM\neval $(minikube docker-env)\n\n# Save IP to a hostname\necho "`minikube ip` docker.local" | sudo tee -a /etc/hosts > /dev/null\n
  492  brew install minikube\n\n# Install Docker CLI\nbrew install docker\nbrew install docker-compose\n\n# Start minikube\nminikube start\n\n# Tell Docker CLI to talk to minikube's VM\neval $(minikube docker-env)
  493  pwd
  494  cd ~/Documents/projects
  495  ls
  496  mkdir test
  497  brew install minikube;\nbrew install docker;\nbrew install docker-compose;\nminikube start
  498  eval $(minikube docker-env)
  499  echo "`minikube ip` docker.local" | sudo tee -a /etc/hosts > /dev/null
  500  docker ps
  501  docker images ls
  502  kubectl
  503  kubectl get pods --all-namespaces
  504  helm
  505  helm plugin install https://github.com/hypnoglow/helm-s3.git