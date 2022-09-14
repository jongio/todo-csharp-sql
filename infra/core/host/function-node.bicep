param environmentName string
param location string = resourceGroup().location

param allowedOrigins array = []
param applicationInsightsName string
param appServicePlanId string
param appSettings object = {}
param keyVaultName string = ''
param linuxFxVersion string = 'NODE|16'
param managedIdentity bool = !(empty(keyVaultName))
param serviceName string
param storageAccountName string

module function 'function.bicep' = {
  name: 'function-node-resources-${serviceName}'
  params: {
    environmentName: environmentName
    location: location
    allowedOrigins: allowedOrigins
    applicationInsightsName: applicationInsightsName
    appServicePlanId: appServicePlanId
    appSettings: appSettings
    functionsWorkerRuntime: 'node'
    keyVaultName: keyVaultName
    linuxFxVersion: linuxFxVersion
    managedIdentity: managedIdentity
    serviceName: serviceName
    storageAccountName: storageAccountName
  }
}

output identityPrincipalId string = function.outputs.identityPrincipalId
output name string = function.outputs.name
output uri string = function.outputs.uri
