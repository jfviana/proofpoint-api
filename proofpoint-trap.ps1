#Author: Julio Viana
#Created: 2021-05-16


[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# Headers
$api_key = "api-key"
$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Authorization", $api_key)

$url = "https://<server>/api/incidents/<inc-id>.json"

$rsp = Invoke-RestMethod -Headers $headers -Uri $url -Method Get -ContentType "text/xml"

$rsp | ConvertTo-Json
