using '../main.bicep'

param environmentName = 'staging'
param appName = 'ksfinagentstg'
param location = readEnvironmentVariable('KSFINANCE_STAGING_LOCATION')
param botAppId = readEnvironmentVariable('KSFINANCE_STAGING_BOT_APP_ID')
param botTenantId = readEnvironmentVariable('KSFINANCE_STAGING_TENANT_ID')
param hostedAgentResponsesEndpoint = readEnvironmentVariable('KSFINANCE_STAGING_RESPONSES_ENDPOINT')
param hostedAgentName = 'ksfinanceagent-staging'
param sessionKeySalt = readEnvironmentVariable('KSFINANCE_STAGING_SESSION_KEY_SALT')
param botClientSecret = readEnvironmentVariable('KSFINANCE_STAGING_BOT_CLIENT_SECRET')
param taskHubName = 'ksfinanceagentstaging'
param appServiceSku = 'P1v3'
param appServiceInstanceCount = 1
param storageSku = 'Standard_ZRS'
param logRetentionInDays = 30
param schedulerIpAllowlist = json(readEnvironmentVariable('KSFINANCE_STAGING_DTS_IP_ALLOWLIST'))
param vnetAddressPrefix = '10.20.0.0/16'
param appSubnetAddressPrefix = '10.20.1.0/24'
param privateEndpointSubnetAddressPrefix = '10.20.2.0/24'
param additionalTags = json(readEnvironmentVariable('KSFINANCE_STAGING_TAGS', '{}'))
