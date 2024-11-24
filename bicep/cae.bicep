param location string = resourceGroup().location

param caeName string

resource environment 'Microsoft.App/managedEnvironments@2024-08-02-preview' = {
  name: caeName
  location: location
  properties: {
    zoneRedundant: false
    peerAuthentication: {
      mtls: {
        enabled: false
      }
    }
    workloadProfiles: [{
      name: 'Consumption'
      workloadProfileType: 'Consumption'
    }]
    peerTrafficConfiguration: {
      encryption: {
        enabled: false
      }
    }
    publicNetworkAccess: 'Disabled'
  }
}
