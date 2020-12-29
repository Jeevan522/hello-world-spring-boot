echo "========"

echo "Terraform Initializing...."

terraform version

terraform init \
    -backend-config=storage_account_name\=demo10 \
    -backend-config=resource_group_name\=demo \
    -backend-config=key\=terraform.tfstate \
    -backend-config=container_name\=devops\
    -get=true \
    -get-plugins=true \
    -verify-plugins=true
    
	
echo "completed"
