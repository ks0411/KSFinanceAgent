using '../search.bicep'

param environmentName = 'prod'
param searchServiceName = readEnvironmentVariable('KSFINANCE_PROD_SEARCH_NAME')
param location = readEnvironmentVariable('KSFINANCE_PROD_SEARCH_LOCATION')
param agentPrincipalId = readEnvironmentVariable('KSFINANCE_PROD_AGENT_PRINCIPAL_ID')
param publisherPrincipalId = readEnvironmentVariable('KSFINANCE_PROD_PUBLISHER_PRINCIPAL_ID')
param publisherPrincipalType = readEnvironmentVariable('KSFINANCE_PROD_PUBLISHER_PRINCIPAL_TYPE', 'ServicePrincipal')
param network = json(readEnvironmentVariable('KSFINANCE_PROD_SEARCH_NETWORK'))
param logAnalyticsWorkspaceId = readEnvironmentVariable('KSFINANCE_PROD_LOG_ANALYTICS_ID')
param sku = 'standard'
param replicaCount = 3
param partitionCount = 1
param additionalTags = json(readEnvironmentVariable('KSFINANCE_PROD_TAGS', '{}'))
