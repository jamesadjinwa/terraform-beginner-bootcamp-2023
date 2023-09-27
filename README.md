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
