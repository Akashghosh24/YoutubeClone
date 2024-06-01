

#!/bin/bash

# Variables
Subscription="z02-ps-dev"
resourceGroup="YoutubeClone2"
appName="youtubecloneakas2"
location="Central India"
planName="ASP-Pricing-Plan2"
sku="B1"
linuxFxVersion="NODE:20-lts"


ServicePrincipal="<mention the client ID>"
Secret="<mention the secret value>"
TenantID="f3eecbb4-2c11-4444-9d12-620a608677ef"

#We are logging in using service principle. you can also use az login with your credentials
az login --service-principal -u $ServicePrincipal -p $Secret --tenant $TenantID

az account set --subscription $Subscription
# Create Resource Group
az group create --name $resourceGroup --location "$location"

# Create App Service Plan
az appservice plan create --name $planName --resource-group $resourceGroup --location "$location" --sku $sku --is-linux

# Create Web App
az webapp create --name $appName --resource-group $resourceGroup --plan $planName --runtime $linuxFxVersion



