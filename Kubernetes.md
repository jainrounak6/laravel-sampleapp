# Kubernetes Deployment


#### To run pod from local image
1. Command to configure your shell to use the Docker daemon running in the Minikube VM instead of the local Docker daemon
`eval $(minikube docker-env)`
`eval $(minikube -p minikube docker-env)` # Working with new versions




## To Deploy application on AWS EKS

### Setup AWS Profile for EKS Cluster

Before creating an EKS cluster, ensure that you have configured your AWS profile with the appropriate access.

### Steps:

1. **Install AWS CLI:**

   Make sure you have the AWS CLI installed. If not, download and install it from [AWS CLI Installation Guide](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html).


2. **Configure AWS CLI:**

   Run the following command to configure your AWS CLI with your AWS credentials:

   ```bash
   aws configure --profile aws_rounak
   ```

   It will prompt you to enter your AWS Access Key ID, Secret Access Key, default region, and output format.


## Launch AWS EKS Cluster and node with default setting.

Now that your AWS profile is configured, you can launch an EKS cluster.

### Steps:

1. **Install eksctl:**

   Install `eksctl` using the instructions provided [here](https://docs.aws.amazon.com/eks/latest/userguide/eksctl.html).

2. **Create EKS Cluster:**

   Run the following command to create an EKS cluster:

   ```
   eksctl create cluster --name <cluster-name> \
    --version <version> \
    --region <region> \
    --nodegroup-name <nodegroup-name> \
    --node-type <instance type> \
    --nodes <node_numbers> \
    --profile <aws_profile>
   ```

   ##### Example

   ```
   eksctl create cluster --name sample-app \
    --version 1.28 \
    --region ap-south-1 \
    --nodegroup-name node-1 \
    --node-type t2.medium \
    --nodes 2 \
    --profile aws_rounak
   ```

3. **Verify Cluster Creation:**

   After the command completes, verify that the cluster is created:

   ```bash
   kubectl get nodes
   ```

   It should display the nodes in your EKS cluster.


---

#### Connect with existing EKS cluster from local system.

Run below command if you have existing cluster or you have lauched via AWS console. It will download and configure cluster config file.

`aws eks update-kubeconfig --region ap-south-1 --name sample-app --profile aws_rounak`

---

Copy and paste these commands and explanations into your README file. Ensure that users replace placeholder values with their specific configurations.
