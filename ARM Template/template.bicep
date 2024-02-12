@secure()
param extensions_enablevmAccess_username string

@secure()
param extensions_enablevmAccess_password string

@secure()
param extensions_enablevmAccess_ssh_key string

@secure()
param extensions_enablevmAccess_reset_ssh string

@secure()
param extensions_enablevmAccess_remove_user string

@secure()
param extensions_enablevmAccess_expiration string
param virtualMachines_jenkinsvm1_name string = 'jenkinsvm1'
param sshPublicKeys_jenkinsvm1_key_name string = 'jenkinsvm1_key'
param networkInterfaces_jenkinsvm118_name string = 'jenkinsvm118'
param publicIPAddresses_jenkinsvm1_ip_name string = 'jenkinsvm1-ip'
param virtualNetworks_jenkinsvm1_vnet_name string = 'jenkinsvm1-vnet'
param networkSecurityGroups_jenkinsvm1_nsg_name string = 'jenkinsvm1-nsg'

resource sshPublicKeys_jenkinsvm1_key_name_resource 'Microsoft.Compute/sshPublicKeys@2023-03-01' = {
  name: sshPublicKeys_jenkinsvm1_key_name
  location: 'eastus'
  properties: {
    publicKey: 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCsHDg29ZgeaxOn9LCPjOEVKRP3FBlczF13ABwIdvOLZallGFKlZsYy+CAylyynKAMBNSpz1vPmRrWpjZdC9Pfx0h7GPO21aT1C+Ynb4bH6MwvQ1R1MPng9JNwUfeF1H0jwkhsR25v6lAQM90xfP5lVsB4xO1+jEV9zN5/ZpHvv0nYbYMCzP/6VUW9UDsRLGTQRgUSCYpAwbHolNn8cK01TLMdDpI+mJjOAT5rfD9v68HPfkqSL1C2AmfHt+neVcw2a21F2rhv2hqqLwoLIDbmkkBhzzKGufgucb/He/SiLG9UCEj+gcqaLJc1LiVWepK1gv/ZUVh4R3gUoYskbCksfiHjRFZFtc8JrjjFvcAEmSBC/UlB1is6gOfqRmXPsBvELPclN0uMo0L7DXPZt3i5Lbcf8PeWjFhE9arnp5ZBJLKT/dSr1pHiBtadWTfEKBScSVrs+3526bPGNZZV++E5reC4j9WyqP79EqwVGoc0FUgUK0BHAlw69QOs7INfxLKk= generated-by-azure'
  }
}

resource networkSecurityGroups_jenkinsvm1_nsg_name_resource 'Microsoft.Network/networkSecurityGroups@2023-06-01' = {
  name: networkSecurityGroups_jenkinsvm1_nsg_name
  location: 'eastus'
  properties: {
    securityRules: [
      {
        name: 'HTTP'
        id: networkSecurityGroups_jenkinsvm1_nsg_name_HTTP.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          protocol: 'TCP'
          sourcePortRange: '*'
          destinationPortRange: '80'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 1010
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
      {
        name: 'HTTPS'
        id: networkSecurityGroups_jenkinsvm1_nsg_name_HTTPS.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          protocol: 'TCP'
          sourcePortRange: '*'
          destinationPortRange: '443'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 1020
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
      {
        name: 'Jenkins'
        id: networkSecurityGroups_jenkinsvm1_nsg_name_Jenkins.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          protocol: 'TCP'
          sourcePortRange: '*'
          destinationPortRange: '8080'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 1030
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
      {
        name: 'default-allow-ssh'
        id: networkSecurityGroups_jenkinsvm1_nsg_name_default_allow_ssh.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          protocol: 'TCP'
          sourcePortRange: '*'
          destinationPortRange: '22'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 1040
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
    ]
  }
}

resource publicIPAddresses_jenkinsvm1_ip_name_resource 'Microsoft.Network/publicIPAddresses@2023-06-01' = {
  name: publicIPAddresses_jenkinsvm1_ip_name
  location: 'eastus'
  sku: {
    name: 'Standard'
    tier: 'Regional'
  }
  properties: {
    ipAddress: '20.127.121.151'
    publicIPAddressVersion: 'IPv4'
    publicIPAllocationMethod: 'Static'
    idleTimeoutInMinutes: 4
    ipTags: []
  }
}

resource virtualNetworks_jenkinsvm1_vnet_name_resource 'Microsoft.Network/virtualNetworks@2023-06-01' = {
  name: virtualNetworks_jenkinsvm1_vnet_name
  location: 'eastus'
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
    subnets: [
      {
        name: 'default'
        id: virtualNetworks_jenkinsvm1_vnet_name_default.id
        properties: {
          addressPrefix: '10.0.0.0/24'
          delegations: []
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
        type: 'Microsoft.Network/virtualNetworks/subnets'
      }
    ]
    virtualNetworkPeerings: []
    enableDdosProtection: false
  }
}

resource virtualMachines_jenkinsvm1_name_resource 'Microsoft.Compute/virtualMachines@2023-03-01' = {
  name: virtualMachines_jenkinsvm1_name
  location: 'eastus'
  plan: {
    name: 'jenkins'
    product: 'jenkins_2_277_27_5_2021'
    publisher: 'nilespartnersinc1617691698386'
  }
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_D2s_v3'
    }
    additionalCapabilities: {
      hibernationEnabled: false
    }
    storageProfile: {
      imageReference: {
        publisher: 'nilespartnersinc1617691698386'
        offer: 'jenkins_2_277_27_5_2021'
        sku: 'jenkins'
        version: 'latest'
      }
      osDisk: {
        osType: 'Linux'
        name: '${virtualMachines_jenkinsvm1_name}_OsDisk_1_216d7926ad3c481eb0c0be5648fe37ce'
        createOption: 'FromImage'
        caching: 'ReadWrite'
        managedDisk: {
          storageAccountType: 'Premium_LRS'
          id: resourceId('Microsoft.Compute/disks', '${virtualMachines_jenkinsvm1_name}_OsDisk_1_216d7926ad3c481eb0c0be5648fe37ce')
        }
        deleteOption: 'Delete'
        diskSizeGB: 30
      }
      dataDisks: []
    }
    osProfile: {
      computerName: virtualMachines_jenkinsvm1_name
      adminUsername: 'azureuser'
      linuxConfiguration: {
        disablePasswordAuthentication: true
        ssh: {
          publicKeys: [
            {
              path: '/home/azureuser/.ssh/authorized_keys'
              keyData: 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDFqAlFoWurB/9E1gFdgOVUMdZgk43dsSMjSA1SVuS9j7ePl6PNtaNKzJrKNngRN2vcAeAaJqG5mXHNPM91M3l0YnNGZZhKURB0esgsWZ7sBqcDpD2U9MXdg67zU5FUO450CQw6WiVRMuIxGa1NsY9sOwhWpndsYKmngKwKcF/SyYQK3iEgrpUrEP+gv33UsLGVQ8ksH7wO2Y/x7BdsVooZFGE30r2/4GbD+KfY/o5mDRX7SYKsM86kJFZw98ZhqhuxLhnyVvzyjb6XIiR3V0OcnWQdIoLw7nxK2GeiY9qdgUDkphDEYEIx+PtlPgqes4EnpCJ+19bCnEV/b6Jf4C5ng5XVRk448NwfnGfiDdTQQhxxV3kymYaivnL329EEgTNmh8Z4XXrdC5k+zVrg/SUshBX3PI0p57xG1Ll7+rtRVQLhzpHBcPxNOgLNLPLhAg/c3k6OWUw3pwUXzTweTvYy8POEyWL06iQaU5wm6Fmw5Wt+VQ/Qz8kjPErjjYqgqP8= root@LAPTOP-OJCSKH2M'
            }
          ]
        }
        provisionVMAgent: true
        patchSettings: {
          patchMode: 'ImageDefault'
          assessmentMode: 'ImageDefault'
        }
        enableVMAgentPlatformUpdates: false
      }
      secrets: []
      allowExtensionOperations: true
      requireGuestProvisionSignal: true
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: networkInterfaces_jenkinsvm118_name_resource.id
          properties: {
            deleteOption: 'Detach'
          }
        }
      ]
    }
    diagnosticsProfile: {
      bootDiagnostics: {
        enabled: true
      }
    }
  }
}

resource virtualMachines_jenkinsvm1_name_enablevmAccess 'Microsoft.Compute/virtualMachines/extensions@2023-03-01' = {
  parent: virtualMachines_jenkinsvm1_name_resource
  name: 'enablevmAccess'
  location: 'eastus'
  properties: {
    autoUpgradeMinorVersion: true
    publisher: 'Microsoft.OSTCExtensions'
    type: 'VMAccessForLinux'
    typeHandlerVersion: '1.5'
    settings: {
      commandToExecute: 'apt update -y; apt upgrade'
    }
    protectedSettings: {
      username: extensions_enablevmAccess_username
      password: extensions_enablevmAccess_password
      ssh_key: extensions_enablevmAccess_ssh_key
      reset_ssh: extensions_enablevmAccess_reset_ssh
      remove_user: extensions_enablevmAccess_remove_user
      expiration: extensions_enablevmAccess_expiration
    }
  }
}

resource networkSecurityGroups_jenkinsvm1_nsg_name_default_allow_ssh 'Microsoft.Network/networkSecurityGroups/securityRules@2023-06-01' = {
  name: '${networkSecurityGroups_jenkinsvm1_nsg_name}/default-allow-ssh'
  properties: {
    protocol: 'TCP'
    sourcePortRange: '*'
    destinationPortRange: '22'
    sourceAddressPrefix: '*'
    destinationAddressPrefix: '*'
    access: 'Allow'
    priority: 1040
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
  dependsOn: [
    networkSecurityGroups_jenkinsvm1_nsg_name_resource
  ]
}

resource networkSecurityGroups_jenkinsvm1_nsg_name_HTTP 'Microsoft.Network/networkSecurityGroups/securityRules@2023-06-01' = {
  name: '${networkSecurityGroups_jenkinsvm1_nsg_name}/HTTP'
  properties: {
    protocol: 'TCP'
    sourcePortRange: '*'
    destinationPortRange: '80'
    sourceAddressPrefix: '*'
    destinationAddressPrefix: '*'
    access: 'Allow'
    priority: 1010
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
  dependsOn: [
    networkSecurityGroups_jenkinsvm1_nsg_name_resource
  ]
}

resource networkSecurityGroups_jenkinsvm1_nsg_name_HTTPS 'Microsoft.Network/networkSecurityGroups/securityRules@2023-06-01' = {
  name: '${networkSecurityGroups_jenkinsvm1_nsg_name}/HTTPS'
  properties: {
    protocol: 'TCP'
    sourcePortRange: '*'
    destinationPortRange: '443'
    sourceAddressPrefix: '*'
    destinationAddressPrefix: '*'
    access: 'Allow'
    priority: 1020
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
  dependsOn: [
    networkSecurityGroups_jenkinsvm1_nsg_name_resource
  ]
}

resource networkSecurityGroups_jenkinsvm1_nsg_name_Jenkins 'Microsoft.Network/networkSecurityGroups/securityRules@2023-06-01' = {
  name: '${networkSecurityGroups_jenkinsvm1_nsg_name}/Jenkins'
  properties: {
    protocol: 'TCP'
    sourcePortRange: '*'
    destinationPortRange: '8080'
    sourceAddressPrefix: '*'
    destinationAddressPrefix: '*'
    access: 'Allow'
    priority: 1030
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
  dependsOn: [
    networkSecurityGroups_jenkinsvm1_nsg_name_resource
  ]
}

resource virtualNetworks_jenkinsvm1_vnet_name_default 'Microsoft.Network/virtualNetworks/subnets@2023-06-01' = {
  name: '${virtualNetworks_jenkinsvm1_vnet_name}/default'
  properties: {
    addressPrefix: '10.0.0.0/24'
    delegations: []
    privateEndpointNetworkPolicies: 'Disabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
  dependsOn: [
    virtualNetworks_jenkinsvm1_vnet_name_resource
  ]
}

resource networkInterfaces_jenkinsvm118_name_resource 'Microsoft.Network/networkInterfaces@2023-06-01' = {
  name: networkInterfaces_jenkinsvm118_name
  location: 'eastus'
  kind: 'Regular'
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        id: '${networkInterfaces_jenkinsvm118_name_resource.id}/ipConfigurations/ipconfig1'
        etag: 'W/"7fbf233e-939a-4883-9948-a5a12ad342e9"'
        type: 'Microsoft.Network/networkInterfaces/ipConfigurations'
        properties: {
          provisioningState: 'Succeeded'
          privateIPAddress: '10.0.0.4'
          privateIPAllocationMethod: 'Dynamic'
          publicIPAddress: {
            id: publicIPAddresses_jenkinsvm1_ip_name_resource.id
            properties: {
              deleteOption: 'Detach'
            }
          }
          subnet: {
            id: virtualNetworks_jenkinsvm1_vnet_name_default.id
          }
          primary: true
          privateIPAddressVersion: 'IPv4'
        }
      }
    ]
    dnsSettings: {
      dnsServers: []
    }
    enableAcceleratedNetworking: false
    enableIPForwarding: false
    disableTcpStateTracking: false
    networkSecurityGroup: {
      id: networkSecurityGroups_jenkinsvm1_nsg_name_resource.id
    }
    nicType: 'Standard'
    auxiliaryMode: 'None'
    auxiliarySku: 'None'
  }
}
