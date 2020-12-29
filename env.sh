echo "========"

echo "Terraform Initializing...."

terraform version

terraform init \
    -get-plugins=true \
	-verify-plugins=true
	
echo "completed"
