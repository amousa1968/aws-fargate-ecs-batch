# PowerShell script to set mock AWS credentials for Terraform testing

$env:AWS_ACCESS_KEY_ID = "mock_access_key_id"
$env:AWS_SECRET_ACCESS_KEY = "mock_secret_access_key"
$env:AWS_DEFAULT_REGION = "us-east-1"

Write-Host "Mock AWS credentials set for Terraform testing."
Write-Host "You can now run terraform plan or apply in this PowerShell session."
