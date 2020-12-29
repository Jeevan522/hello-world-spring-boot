terraform{
	required_version = "=0.12.3"
	backend "azurerm" {
	   resource_group_name = "demo" 
	   container_name = "devops"
	   storage_account_name = "demo10"
	   key = "terraform.tfstate"
	}
}

provider "azurerm"{
  version = "~>2.0"
  features {}
  
}

resource "azurerm_resource_group" "rg-name" {
  name = "Hello-Word-ResourceGroup"
  location = "Central-US"
}

resource "azurerm_kubernetes_cluster" "aks" {
  name = "Hello-World-AKS"
  location = "Central-US"
  resource_group_name = rg-name.name
  kubernetes_version = "1.18.8"
  node_resource_group = "Node-RG"
  
  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}
