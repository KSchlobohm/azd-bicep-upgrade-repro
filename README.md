# azd-bicep-upgrade-repro

## Environment

1. Windows

## Repro Steps

1. In PowerShell, run:

```pwsh
Invoke-RestMethod 'https://github.com/Azure/bicep/releases/download/v0.20.4/bicep-win-x64.exe' -Outfile bicep-204.exe
Invoke-RestMethod 'https://github.com/Azure/bicep/releases/download/v0.21.1/bicep-win-x64.exe' -Outfile bicep-211.exe
./bicep-204.exe build ./infra/main.bicep --outfile 204.json
./bicep-211.exe build ./infra/main.bicep --outfile 211.json
az deployment sub create --location eastus2 --template-file 204.json
az deployment sub create --location eastus2 --template-file 211.json
```

2. Observe the outputs:

- Deployment for 204.json succeeds.
- Deployment for 211.json fails with error:

```json
{"status":"Failed","error":{"code":"DeploymentFailed","message":"At least one resource deployment operation failed. Please list deployment operations for details. Please see https://aka.ms/arm-deployment-operations for usage details.","details":[{"code":"BadRequest","message":"{\r\n  \"error\": {\r\n    \"code\": \"InvalidDeployment\",\r\n    \"message\": \"The 'location' property must be specified for '<name>-test'. Please see https://aka.ms/deploy-to-subscription for usage details.\"\r\n  }\r\n}"}]}}
```
