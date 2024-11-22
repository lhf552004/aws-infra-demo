# Infrastrture project for AWS DevOps Demo Project

# Create Backend in S3 Bucket

```
aws s3api create-bucket --bucket terraform-state-bucket-demo2024 --region us-west-2 --create-bucket-configuration LocationConstraint=us-west-2

aws s3api put-bucket-versioning --bucket terraform-state-bucket-demo2024 --versioning-configuration Status=Enabled


```

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