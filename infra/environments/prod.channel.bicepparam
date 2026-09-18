using '../main.bicep'

param environmentName = 'prod'
param appName = 'ksfinagentprod'
param location = readEnvironmentVariable('KSFINANCE_PROD_LOCATION')
param botAppId = readEnvironmentVariable('KSFINANCE_PROD_BOT_APP_ID')
param botTenantId = readEnvironmentVariable('KSFINANCE_PROD_TENANT_ID')
param hostedAgentResponsesEndpoint = readEnvironmentVariable('KSFINANCE_PROD_RESPONSES_ENDPOINT')
param hostedAgentName = 'ksfinanceagent-prod'
param sessionKeySalt = readEnvironmentVariable('KSFINANCE_PROD_SESSION_KEY_SALT')
param botClientSecret = readEnvironmentVariable('KSFINANCE_PROD_BOT_CLIENT_SECRET')
param taskHubName = 'ksfinanceagentprod'
param appServiceSku = 'P1v3'
param appServiceInstanceCount = 2
param storageSku = 'Standard_ZRS'
param logRetentionInDays = 90
param schedulerIpAllowlist = json(readEnvironmentVariable('KSFINANCE_PROD_DTS_IP_ALLOWLIST'))
param vnetAddressPrefix = '10.30.0.0/16'
param appSubnetAddressPrefix = '10.30.1.0/24'
param privateEndpointSubnetAddressPrefix = '10.30.2.0/24'
param additionalTags = json(readEnvironmentVariable('KSFINANCE_PROD_TAGS', '{}'))
