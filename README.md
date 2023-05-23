# VolumeSecretReader
Synchronizes secrets from Azure KeyVault into a .NET 6 application using Azure Key Vault Provider for secrets store CSI driver.
Followed these [Microsoft docs](https://learn.microsoft.com/en-us/azure/aks/csi-secrets-store-driver).

# Steps:
1. Build a docker image using the provided DockerFile.
2. Push the docker image to your container registry (optional)
3. Create a kubernetes cluster and deploy the kubernetes manifests included in the folder `kubernetes`
4. Follow the steps described in the microsoft docs.
