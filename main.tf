#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
#*                 Root Module                         *#
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#

# Terraform Block

terraform{
    required_providers {
      azurerm = {
          source = "hashicorp/azurerm"
          version = "2.81.0"
      }
        backend "azurerm" {
        resource_group_name = "polo"
        storage_account_name = "terrasave"
        container_name = "tfback"
        key = "prod.terraform.tfstate"
    
      
    }
    }
}

provider "azurerm"{
    features{

    }
}




