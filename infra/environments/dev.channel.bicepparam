using '../main.bicep'

param environmentName = 'dev'
param appName = readEnvironmentVariable('KSFINANCE_DEV_APP_NAME', 'ksfinagentdev')
param location = readEnvironmentVariable('KSFINANCE_DEV_LOCATION')
param botAppId = readEnvironmentVariable('KSFINANCE_DEV_BOT_APP_ID')
param botTenantId = readEnvironmentVariable('KSFINANCE_DEV_TENANT_ID')
param hostedAgentResponsesEndpoint = readEnvironmentVariable('KSFINANCE_DEV_RESPONSES_ENDPOINT')
param hostedAgentName = 'ksfinanceagent-dev'
param sessionKeySalt = readEnvironmentVariable('KSFINANCE_DEV_SESSION_KEY_SALT')
param botClientSecret = readEnvironmentVariable('KSFINANCE_DEV_BOT_CLIENT_SECRET')
param taskHubName = 'ksfinanceagentdev'
param appServiceSku = 'P1v3'
param appServiceInstanceCount = 1
param storageSku = 'Standard_LRS'
param logRetentionInDays = 30
param schedulerIpAllowlist = json(readEnvironmentVariable('KSFINANCE_DEV_DTS_IP_ALLOWLIST'))
param vnetAddressPrefix = '10.10.0.0/16'
param appSubnetAddressPrefix = '10.10.1.0/24'
param privateEndpointSubnetAddressPrefix = '10.10.2.0/24'
param additionalTags = json(readEnvironmentVariable('KSFINANCE_DEV_TAGS', '{}'))
