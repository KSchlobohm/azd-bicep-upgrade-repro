targetScope = 'subscription'

type DeploymentSettings = {
  location: string
}

param workspaceName string
param deploymentSettings DeploymentSettings
param resourceGroupName string

resource resourceGroup 'Microsoft.Resources/resourceGroups@2022-09-01' existing = {
  name: resourceGroupName
}

module logAnalytics './loganalytics.bicep' = {
  name: 'workload-log-analytics'
  scope: resourceGroup
  params: {
    name: workspaceName
    location: deploymentSettings.location
  }
}
