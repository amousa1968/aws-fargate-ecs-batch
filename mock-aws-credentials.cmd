@echo off
REM Mock AWS credentials for Terraform testing without real AWS access

set AWS_ACCESS_KEY_ID=mock_access_key_id
set AWS_SECRET_ACCESS_KEY=mock_secret_access_key
set AWS_DEFAULT_REGION=us-east-1

echo Mock AWS credentials set for Terraform testing.
echo You can now run terraform plan or apply with these mock credentials.
