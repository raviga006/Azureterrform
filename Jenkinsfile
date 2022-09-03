pipeline{
    agent any 
    tools {
        "org.jenkinsci.plugins.terraform.TerraformInstallation" "terraform"
    }
    environment {
        TF_HOME = tool('terraform')
        TF_IN_AUTOMATION = "true"
        PATH = "$TF_HOME:$PATH"
    }
    stages {
    
        stage('Terraform Init'){
            
            steps {
                    ansiColor('xterm') {
                    withCredentials([azureServicePrincipal(
                    credentialsId: 'ravie',
                    subscriptionIdVariable: '0a396cb4-0e8c-43fe-86fc-346ce9f7dbb6',
                    clientIdVariable: '4286d482-63eb-4183-bf00-3c9e3ea89688',
                    clientSecretVariable: 'fFU8Q~JaU2vvYDThHUPLPibmDOV3NAsDLE3kqaph',
                    tenantIdVariable: 'b9fec68c-c92d-461e-9a97-3d03a0f18b82'
                ), string(credentialsId: 'access_key', variable: 'ARM_ACCESS_KEY')]) {
                        
                        sh """
                                
                        echo "Initialising Terraform"
                        terraform init -backend-config="access_key=$ARM_ACCESS_KEY"
                        """
                           }
                    }
             }
        }

        stage('Terraform Validate'){
            
            steps {
                    ansiColor('xterm') {
                    withCredentials([azureServicePrincipal(
                    credentialsId: 'Jenkins',
                    subscriptionIdVariable: 'ARM_SUBSCRIPTION_ID',
                    clientIdVariable: 'ARM_CLIENT_ID',
                    clientSecretVariable: 'ARM_CLIENT_SECRET',
                    tenantIdVariable: 'ARM_TENANT_ID'
                ), string(credentialsId: 'access_key', variable: 'ARM_ACCESS_KEY')]) {
                        
                        sh """
                                
                        terraform validate
                        """
                           }
                    }
             }
        }

        stage('Terraform Plan'){
            steps {

                    ansiColor('xterm') {
                    withCredentials([azureServicePrincipal(
                    credentialsId: 'Jenkins',
                    subscriptionIdVariable: 'ARM_SUBSCRIPTION_ID',
                    clientIdVariable: 'ARM_CLIENT_ID',
                    clientSecretVariable: 'ARM_CLIENT_SECRET',
                    tenantIdVariable: 'ARM_TENANT_ID'
                ), string(credentialsId: 'access_key', variable: 'ARM_ACCESS_KEY')]) {
                        
                        sh """
                        
                        echo "Creating Terraform Plan"
                        terraform plan -var "client_id=$ARM_CLIENT_ID" -var "client_secret=$ARM_CLIENT_SECRET" -var "subscription_id=$ARM_SUBSCRIPTION_ID" -var "tenant_id=$ARM_TENANT_ID"
                        """
                        }
                }
            }
        }

        stage('Waiting for Approval'){
            steps {
                timeout(time: 10, unit: 'MINUTES') {
                    input (message: "Deploy the infrastructure?")
                }
            }
        
        }
    

        stage('Terraform Apply'){
            steps {
                    ansiColor('xterm') {
                    withCredentials([azureServicePrincipal(
                    credentialsId: 'ravie',
                    subscriptionIdVariable: 'ARM_SUBSCRIPTION_ID',
                    clientIdVariable: 'ARM_CLIENT_ID',
                    clientSecretVariable: 'ARM_CLIENT_SECRET',
                    tenantIdVariable: 'ARM_TENANT_ID'
                ), string(credentialsId: 'access_key', variable: 'ARM_ACCESS_KEY')]) {

                        sh """
                        echo "Applying the plan"
                        terraform apply -auto-approve -var "client_id=$ARM_CLIENT_ID" -var "client_secret=$ARM_CLIENT_SECRET" -var "subscription_id=$ARM_SUBSCRIPTION_ID" -var "tenant_id=$ARM_TENANT_ID"
                        """
                                }
                }
            }
        }

    }
}
