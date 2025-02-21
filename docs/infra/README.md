1. Set Google Cloud Storage bucket as a terraform state backend in the `backend.tf` file
```
terraform {
  backend "gcs" {
    bucket = "<your_bucket>"
    prefix = "terraform/state/website"
  }
}
```


2. Init terraform modules:

```
terraform init
```


3. Apply 

```
terraform apply -var-file default_env.tfvars
```
