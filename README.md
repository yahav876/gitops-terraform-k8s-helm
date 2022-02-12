<div id="top"></div>

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
  </ol>
</details>




<!-- ABOUT THE PROJECT -->
## About The Project


The product owners are all about the new buzz word: GitOps!
For this assignment, you will need to create a new Kubernetes cluster
on AWS, deploy a monitoring tool using Helm chart and go everything
the GitOps way.

The end goal, provide a demonstration on how you are committing a
code in your source control and the changes will be deployed to the
infrastructure without manual intervention.

<p align="right">(<a href="#top">back to top</a>)</p>



### Built With

This section should list any major frameworks/libraries used to bootstrap my project.

* [Terraform](https://www.terraform.io/)
* [Helm](https://helm.sh/)
* [AWS](https://aws.amazon.com/)



<p align="right">(<a href="#top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Getting Started

This is an example of how you may give instructions on setting up your project locally.
To get a local copy up and running follow these simple example steps.

### Prerequisites

This is an example of how to list things you need to use the software and how to install them.
* terraform
  ```sh
  brew tap hashicorp/tap
  brew install hashicorp/tap/terraform
  ```
* helm
  ```sh
  curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
  chmod 700 get_helm.sh
  ./get_helm.sh
  ```

### Installation

1. Clone the repo
   ```sh
   git clone https://github.com/yahav876/gitops-terraform-k8s-helm.git
   ```
2. Configure kubectl with aws:
    ```sh
    aws eks update-kubeconfig --region region-code --name cluster-name
    ```
3. Configure "Secrets" 
   ```sh
    AWS_ACCESS_KEY_ID
    AWS_SECRET_ACCESS_KEY
    KUBE_CONFIG_DATA (cat $HOME/.kube/config | base64)
    TF_API_TOKEN
   ```
4. Test  UI of Grafana
    ```sh
    kubectl port-forward deployment/monitoring-grafana 3000

    user: admin
    password: prom-operator
    ```

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- USAGE EXAMPLES -->
## Usage

Just make a "push" and your EKS cluster with Prometheus monitoring helm chart will be deployed to your aws account.


<p align="right">(<a href="#top">back to top</a>)</p>






