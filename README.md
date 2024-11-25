# Infrastrture project for AWS DevOps Demo Project

# Create Backend in S3 Bucket

```
aws s3api create-bucket --bucket terraform-state-bucket-demo2024 --region us-west-2 --create-bucket-configuration LocationConstraint=us-west-2

aws s3api put-bucket-versioning --bucket terraform-state-bucket-demo2024 --versioning-configuration Status=Enabled

{
  "Effect": "Allow",
  "Action": [
    "dynamodb:PutItem",
    "dynamodb:GetItem",
    "dynamodb:DeleteItem"
  ],
  "Resource": "arn:aws:dynamodb:us-west-2:<account id>:table/terraform-lock"
}

{
  "Effect": "Allow",
  "Action": [
    "s3:GetObject",
    "s3:PutObject",
    "s3:DeleteObject",
    "s3:ListBucket"
  ],
  "Resource": [
    "arn:aws:s3:::my-terraform-state-bucket",
    "arn:aws:s3:::my-terraform-state-bucket/*"
  ]
}


aws dynamodb create-table \
  --table-name terraform-lock \
  --attribute-definitions AttributeName=LockID,AttributeType=S \
  --key-schema AttributeName=LockID,KeyType=HASH \
  --billing-mode PAY_PER_REQUEST \
  --region us-west-2


aws ec2 create-key-pair --key-name "dev-ssh-key"  --region us-west-2 --query "KeyMaterial" --output text > dev-ssh-key.pem


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
terraform init -backend-config="backend-dev.hcl"

terraform plan -var-file="env/dev.tfvars" -var-file="sensitive-values.tfvars" -out=tfplan

terraform apply -var-file="env/dev.tfvars" -var-file="sensitive-values.tfvars"
```