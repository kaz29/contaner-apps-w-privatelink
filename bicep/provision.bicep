var virtualNetworkName = 'vnet-labo'
var subnetName = 'snet-labo-containerapps'
var caeName = 'cae-labo'
var privateDnsZoneName = 'privatelink.japaneast.azurecontainerapps.io-config'

module network 'network.bicep' = {
  name: 'provision-network'
  params: {
    virtualNetworkName: virtualNetworkName
    subnetName: subnetName
  }
}

module cae 'cae.bicep' = {
  name: 'provision-cae'
  params: {
    caeName: caeName
  }
  dependsOn: [
    network
  ]
}

module pdns 'pdns.bicep' = {
  name: 'provision-pdns'
  params: {
    privateDnsZoneName: privateDnsZoneName
    virtualNetworkName: virtualNetworkName
  }
  dependsOn: [
    cae
  ]
}
module pep 'pep.bicep' = {
  name: 'provision-pep'
  params: {
    caeName: caeName
    virtualNetworkName: virtualNetworkName
    privateDnsZoneName: privateDnsZoneName
    subnetName: subnetName
  }
  dependsOn: [
    pdns
  ]
}

module ca 'ca.bicep' = {
  name: 'provision-ca'
  params: {
    caeName: caeName
    containerAppName: 'ca-test-app'
  }
  dependsOn: [
    pdns
  ]
}
