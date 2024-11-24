param location string = resourceGroup().location

param virtualNetworkName string
param subnetName string

resource virtualNetwork 'Microsoft.Network/virtualNetworks@2024-01-01' = {
  name: virtualNetworkName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '192.168.0.0/16'
      ]
    }
    subnets: [
      {
        name: subnetName
        properties: {
          addressPrefix: '192.168.128.0/23'
        }
      }
    ]
    virtualNetworkPeerings: []
  }
}
