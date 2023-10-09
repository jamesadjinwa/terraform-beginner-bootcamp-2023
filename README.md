# Terraform Beginner Bootcamp 2023

## Semantic Versioning :mage:

Given a version number MAJOR.MINOR.PATCH, increment the:

1. MAJOR version when you make incompatible API changes
2. MINOR version when you add functionality in a backward compatible manner
3. PATCH version when you make backward compatible bug fixes

Additional labels for pre-release and build metadata are available as extensions to the MAJOR.MINOR.PATCH format.
Source: [Semantic Versioning](https://semver.org).

## Terraform CLI Refactoring

**Terraform CLI installation** [documentation](https://developer.hashicorp.com/terraform/downloads) for **Linux > Ubuntu/Debian**.

### GPG Command
* Was getting the following when running 
```
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg -y
```
>  File '/usr/share/keyrings/hashicorp-archive-keyring.gpg' exists. Overwrite? (y/N)
* This message shows up at second run if the gpg key already exists
* Use `-y` parameter with gpg to force command execution even if the key already exists.

## Working with Environment variables

* List all environment variables (env vars) using `env` command.
* Set env vars using `export VARIABLE_NAME=VALUE`
* Unset env vars using `unset VARIABLE_NAME`
* Print env vars using `echo $VARIABLE_NAME`

### Set Env vars globally

* Make env vars persistent across terminals by using bash profile
* Make env vars persistent in **Gitpod secrets** by using `gp`. An example is:
    ```bash
    gp env VARIABLE_NAME=VALUE`
    ```

## AWS CLI installation

* Installation Reference [documentation](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html).
* Setup env vars for AWS configuration. ***Don't*** use `aws configure` for production environment.
* Check if AWS credentials are set up correctly by running the following:
    ```sh
    aws sts get-caller-identity
    ```
    * For this command to be successful you need to generate AWS credentials and add to env vars as shown in [.env.example](./.env.example).

    * If it is succesful you should see a json payload like this:
        > ```json
        > {
        > "UserId": "ABCDEFGHEJKLMNOPR",
        > "Account": "123456789012",
        > "Arn": "arn:aws:iam::123456789012:user/terraform-beginner-bootcamp"
        > }
        > ```
* [Environment variables to configure the AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html).

## Terraform Basics

### Terraform Registry

* [Registry.terraform.io](https://registry.terraform.io)
* [Providers](https://registry.terraform.io/browse/providers)
* [Modules](https://registry.terraform.io/browse/modules)

* `terraform init`
* `terraform plan`
* `terraform apply` → Without prompting for 'yes' run `terraform apply --auto-approve`
* *terraform.tfstate* → State file, current state of the infrastructure. This file should not never be commit to version control system (vcs) because 
    it contains very sensitive information. This file should never be lost for an exisitng infrastructure. 
* *.terraform.lock.hcl* → Lock file
* `terraform destroy`


### Terraform Cloud

* To use Terraform cloud add the following in the terraform block:
    ```
    cloud {
        organization = "NameOfOrganization"
        
        workspaces {
        name = "NameOfWorkspace"
        }
    }
    ```
* Goto this [page](https://app.terraform.io/app/settings/tokens?source=terraform-login) to generate a Terraform cloud token. 
* Gitpod stores the token in `/home/gitpod/.terraform.d/credentials.tfrc.json`
* To manually create `credentials.tfrc.json`:
    ```bash
    touch /home/gitpod/.terraform.d/credentials.tfrc.json
    open /home/gitpod/.terraform.d/credentials.tfrc.json
    ```
* Content of `/home/gitpod/.terraform.d/credentials.tfrc.json`:
    ```
    {
        "credentials": {
            "app.terraform.io": {
                "token": "YOUR-TERRAFORM-CLOUD-TOKEN"
            }
        }
    }
    ```

### Automate Terraform login

* Script to generate credentials [bin/generate_tfrc_creds](./bin/generate_tfrc_creds)
* For the script to generate the json file, setup the env var `TERRAFORM_CLOUD_TOKEN`


### Terraform cloud organization

* The Default Execution Mode should be set up as **Local** not ~~Remote~~.

![Terraform Cloud Execution mode](./media/terracloudexecmode.png)

* Setting Remote execution mode will cause a credentials error when executing `Terraform plan`
```
Error: No valid credential sources found
│ 
│   with provider["registry.terraform.io/hashicorp/aws"],
│   on main.tf line 22, in provider "aws":
│   22: provider "aws" {
│ 
│ Please see https://registry.terraform.io/providers/hashicorp/aws
│ for more information about providing credentials.
│ 
│ Error: failed to refresh cached credentials, no EC2 IMDS role found,
│ operation error ec2imds: GetMetadata, request canceled, context deadline
│ exceeded
│ 
```

## Root Module Structure

Our root module structure is as follows:

PROJECT_ROOT
│
├── main.tf                 # everything else.
├── variables.tf            # stores the structure of input variables
├── terraform.tfvars        # the data of variables we want to load into our terraform project
├── providers.tf            # defined required providers and their configuration
├── outputs.tf              # stores our outputs
└── README.md               # required for root modules


## Terraform import and configuration drift

* Removed `random` resource (Use this [site](https://www.gigacalculator.com/randomizers/random-string-generator.php) to generate random strings)
* Add terraform veriable `bucket.name`

## What happens if we lose our state file?

* If you lose your statefile, you most likley have to tear down all your cloud infrastructure manually.
* You can use terraform import but it won't work for all cloud resources. You need check the terraform providers documentation for which resources support import.

### Fix Missing Resources with Terraform Import

`terraform import aws_s3_bucket.bucket <bucket-name>`

[Terraform Import](https://developer.hashicorp.com/terraform/cli/import)
[AWS S3 Bucket Import](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket#import)

### Fix Manual Configuration

* If someone goes and deletes or modifies your cloud resource manually through ClickOps. 
* If we run Terraform plan it will attempt to put our infrastructure back into the expected state fixing the *Configuration Drift*.