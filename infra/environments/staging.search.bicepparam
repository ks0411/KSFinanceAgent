using '../search.bicep'

param environmentName = 'staging'
param searchServiceName = readEnvironmentVariable('KSFINANCE_STAGING_SEARCH_NAME')
param location = readEnvironmentVariable('KSFINANCE_STAGING_SEARCH_LOCATION')
param agentPrincipalId = readEnvironmentVariable('KSFINANCE_STAGING_AGENT_PRINCIPAL_ID')
param publisherPrincipalId = readEnvironmentVariable('KSFINANCE_STAGING_PUBLISHER_PRINCIPAL_ID')
param publisherPrincipalType = readEnvironmentVariable('KSFINANCE_STAGING_PUBLISHER_PRINCIPAL_TYPE', 'ServicePrincipal')
param network = json(readEnvironmentVariable('KSFINANCE_STAGING_SEARCH_NETWORK'))
param logAnalyticsWorkspaceId = readEnvironmentVariable('KSFINANCE_STAGING_LOG_ANALYTICS_ID')
param sku = 'standard'
param replicaCount = 2
param partitionCount = 1
param additionalTags = json(readEnvironmentVariable('KSFINANCE_STAGING_TAGS', '{}'))
