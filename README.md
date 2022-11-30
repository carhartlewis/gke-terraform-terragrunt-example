# gke-terraform-terragrunt-example with GitHub Actions Workflow

### Layout

- modules - contains terraform configuration files to build the Kubernetes cluster.
- production - contains all of our production instances

### How to add a new instance

1.  Create a new branch, typically call it the name of the new instance e.g. `instance-name.example.com`
2.  Create a new folder in the production folder, name it the instance name e.g. `instance-name.example.com` and create a file called `terragrunt.hcl`
3.  The `terragrunt.hcl` file should contain a reference to the terraform module and inputs:

        terraform {
        source = "../../../modules/gcp/gke"
        }


        inputs = {
            env_name  = "instance-name-example"
            node_poolname  = "test-instance-node-pool"
            project_id  = "google-cloud-project-id"
            region	= "europe-west1"
            network = "gke-network"
            subnetwork = "gke-subnet"
            ip_range_pods_name = "ip-range-pods"
            ip_range_services_name = "ip-range-services"
        }

4.  Push your changes, create a pull request and wait for the tests to be run.
5.  If the tests all pass, and the terraform plan output looks okay (e.g. no instances are going to be deleted!) then merge your branch to main and GitHub actions will run terragrunt apply and create the infrastructure.

### How to remove an instance

1. Clone the git repository
2. Move to the correct directory (e.g. ./production/instance-name.example.com)
3. Run ```terragrunt destory ```
