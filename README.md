# Infrastrture project for Azure DevOps Demo Project

## Initialize

Create sensitive-values.tfvars, follow sensitive-values.tfvars.example

```
terraform fmt -recursive
```

```
terraform validate
```
## Run

```
terraform init

terraform plan -var-file="env/dev.tfvars" -var-file="sensitive-values.tfvars" -out=tfplan

terraform apply -var-file="env/dev.tfvars" -var-file="sensitive-values.tfvars"
```