Sample Code to get the Azure VM Instance Json Meta Data:
#!/usr/bin/pwsh
$personalAccessToken = "************************************************************"
$headers = @{Authorization = 'Basic ' + [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(":$($personalAccessToken)")) }
$uri = "http://*.*.*.*/metadata/instance?api-version=2021-02-01"
# GET call to RD
$content = Invoke-RestMethod -Uri $uri -Method Get -Headers $headers -ContentType "application/json"
Write-Output $content
$jsonContent = $content | ConvertTo-Json -Depth 100
Write-Output $jsonContent

Sample Code to get the Azure AKS Instance Json Meta Data: 
#!/usr/bin/pwsh
$personalAccessToken = "************************************************************"
$headers = @{Authorization = 'Basic ' + [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(":$($personalAccessToken)")) }
$uri = "https://management.azure.com/subscriptions/subid1/resourceGroups/rg1/providers/Microsoft.ContainerService/managedClusters/yourclustername?api-version=2021-05-01"
# GET call to RD
$content = Invoke-RestMethod -Uri $uri -Method Get -Headers $headers -ContentType "application/json"
Write-Output $content
$jsonContent = $content | ConvertTo-Json -Depth 100
Write-Output $jsonContent


Sample code to call Azure DevOps Pipeline:

#!/usr/bin/pwsh
$personalAccessToken = "************************************************************"
$headers = @{Authorization = 'Basic ' + [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(":$($personalAccessToken)")) }
$uri = "https://dev.azure.com/OrganizationName/ProjectName/_apis/pipelines/PipelineNumber/runs?api-version=6.0-preview.1"
# GET call to RD
$content = Invoke-RestMethod -Uri $uri -Method Get -Headers $headers -ContentType "application/json"
Write-Output $content
$jsonContent = $content | ConvertTo-Json -Depth 100
$jsonContext ='{"definitionid":"PipelineNumber"}'
# PUT call to RD
$uri = ""https://dev.azure.com/OrganizationName/ProjectName/_apis/pipelines/PipelineNumber/runs?api-version=6.0-preview.1"
$content2 = Invoke-RestMethod -Uri $uri -Method POST -Headers $headers -ContentType "application/json" -Body $jsonContext  -Verbose -Debug
Write-Output $content2
