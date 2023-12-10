# Local Minikube Environment setup

### Install Hyperkit On MacOs
`brew install hyperkit`

### Start Minikube with hyperkit
`minikube start --vm=true  --driver=hyperkit`

### Enable minikube ingress (nginx) addon
`minikube addons enable ingress`

### Enable Minikube DNS addon
`minikube addons enable ingress-dns`

# List Minikube addons
`minikube addons list`

### Minikube Environment configure
`eval $(minikube -p minikube docker-env)`

### Get Minikube IP
`minikube ip`

### Map Minikube IP with domain for local
`echo "$(minikube ip) myapp.local" | sudo tee -a /etc/hosts`


### Access Application

Once application is deployed to access the laravel application run below command:

`kubectl port-forward service/nginx-service 8080:80`

the reason to port forward is load balancer is not available on local system so we use above method to access application.
