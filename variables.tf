#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
#*                 Root Module                         *#
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#

# Service Principal Variables

variable "client_id" {
    description =   "4286d482-63eb-4183-bf00-3c9e3ea89688"
    type        =   string
}

variable "client_secret" {
    description =   "fFU8Q~JaU2vvYDThHUPLPibmDOV3NAsDLE3kqaph"
    type        =   string
}

variable "subscription_id" {
    description =   "0a396cb4-0e8c-43fe-86fc-346ce9f7dbb6"
    type        =   string
}

variable "tenant_id" {
    description =   "b9fec68c-c92d-461e-9a97-3d03a0f18b82"
    type        =   string
}
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*
# Linux VM - Variables
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*

# Prefix and Tags

variable "prefix" {
    description =   "Prefix to append to all resource names"
    type        =   string
    default     =   "Terraform"
}

}

# Resource Group

variable "location" {
    description =   "Location of the resource group"
    type        =   string
    default     =   "East US"
}

# VM 

variable "virtual_machine_size" {
    description =   "Size of the VM"
    type        =   string
    default     =   "Standard_B1s"
}

variable "computer_name" {
    description =   "Computer name"
    type        =   string
    default     =   "Linuxvm"
}

variable "admin_username" {
    description =   "Username to login to the VM"
    type        =   string
    default     =   "linuxadmin"
}

variable "admin_password" {
    description =   "Password to login to the VM"
    type        =   string
    default     =   "P@$$w0rD2020*"
}

variable "os_disk" {
    description =   "Os Disk Details"
    type        =   object({
        name    =   string
        caching =   string
        storage_account_type =  string
        size    = number
    })

    default     =   {
        name                 =   "linuxvm-disk"
        caching              =   "ReadWrite"
        storage_account_type =   "StandardSSD_LRS"
        size                 =   64
    }
}

resource "azurerm_resource_group" "demo-rg"{
    name = "polo"
   
}

variable "os_image" {
    description     =   "OS image details"
    type        =       object({
        publisher   =   string
        offer       =   string
        sku         =   string
        version     =   string})
    
    default         =       {
        publisher   =   "Canonical"
        offer       =   "UbuntuServer"
        sku         =   "16.04-LTS"
        version     =   "latest"
    }
}



