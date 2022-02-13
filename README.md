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
For this project, I will create a new Kubernetes cluster
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

1. Fork the repo 

2. Configure "Secrets" 
   ```sh
    AWS_ACCESS_KEY_ID
    AWS_SECRET_ACCESS_KEY
    KUBE_CONFIG_DATA (cat $HOME/.kube/config | base64)
   ```
3. Open terraform cloud account, create TF_API_TOKEN-        https://app.terraform.io/app/settings/tokens 


    Create environment variables of aws:
      
      AWS_ACCESS_KEY_ID
      
      AWS_SECRET_ACCESS_KEY

    Add Secret "TF_API_TOKEN" in your github repo settings.
   
4. 
   Make a commit and push it , A github actions pipeline should now apply your Infrastructure

5. Configure kubectl with aws:
    ```sh
    aws eks update-kubeconfig --region region-code --name cluster-name
    ```
4. After helm deployment test UI of Grafana/Prometheus/     Alertmanager
    ```sh
    kubectl port-forward deployment/monitoring-grafana 3000
    kubectl port-forward svc/prometheus-k8s 9090
    kubectl port-forward svc/alertmanager-main 9093

    user: admin
    password: prom-operator
    ```

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- USAGE EXAMPLES -->
## Usage

Every change you wish to make should be in eks/env/variables.tfvars file just change the values as you want. 


<p align="right">(<a href="#top">back to top</a>)</p>






