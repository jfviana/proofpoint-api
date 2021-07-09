#Author: jfviana
#Created: 2021-05-16


[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12


$servicePrincipal = 'service-principal'
$secret = 'api-key'

$pair = "$($servicePrincipal):$($secret)"

$encodedCreds = [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes($pair))

$basicAuthValue = "Basic $encodedCreds"

$Headers = @{

Authorization = $basicAuthValue

}

$uri = 'https://tap-api-v2.proofpoint.com/v2/people/vap?window=90'


$rsp = Invoke-RestMethod -Headers $headers -Uri "$uri" -Method Get
$rsp.users.identity|format-table

