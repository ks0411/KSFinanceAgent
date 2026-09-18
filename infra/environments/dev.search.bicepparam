using '../search.bicep'

param environmentName = 'dev'
param searchServiceName = readEnvironmentVariable('KSFINANCE_DEV_SEARCH_NAME', 'srch-ksfinagent-dev')
param location = readEnvironmentVariable('KSFINANCE_DEV_SEARCH_LOCATION', 'swedencentral')
param agentPrincipalId = readEnvironmentVariable('KSFINANCE_DEV_AGENT_PRINCIPAL_ID')
param publisherPrincipalId = readEnvironmentVariable('KSFINANCE_DEV_PUBLISHER_PRINCIPAL_ID')
param publisherPrincipalType = readEnvironmentVariable('KSFINANCE_DEV_PUBLISHER_PRINCIPAL_TYPE', 'ServicePrincipal')
param network = json(readEnvironmentVariable('KSFINANCE_DEV_SEARCH_NETWORK'))
param logAnalyticsWorkspaceId = readEnvironmentVariable('KSFINANCE_DEV_LOG_ANALYTICS_ID')
param sku = 'standard'
param replicaCount = 1
param partitionCount = 1
param additionalTags = json(readEnvironmentVariable('KSFINANCE_DEV_TAGS', '{}'))
