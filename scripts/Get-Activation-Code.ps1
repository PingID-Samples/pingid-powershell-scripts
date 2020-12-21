<#
.SYNOPSIS

PingID API Sample Powershell Script: Get-Activation-Code.ps1

.DESCRIPTION

This script will return the activation code issued to a newly activated PingID user. For more information, review the API documentation: https://developer.pingidentity.com/en/api/pingid-api.html

Note: This software is open sourced by Ping Identity but not supported commercially as such. Any questions/issues should go to the Github issues tracker or discuss on the Ping Identity developer communities. See also the DISCLAIMER file in this directory.

.PARAMETER UserName

The PingID user name you want to retrieve the activation code for.

.EXAMPLE

Get-Activation-Code -UserName meredith

.LINK

https://developer.pingidentity.com
#>

param(
	[Parameter (Mandatory=$true)]
	[string]$UserName
)


#	Import PingID API helper functions
. .\pingid-api-helper.ps1


#	Create the API request and parse the results.
#$apiEndpoint = "https://idpxnyl3m.pingidentity.com/pingid/rest/4/getactivationcode/do"
 $apiEndpoint = $($localPingID +"getactivationcode/do")

$reqBody = @{
	"userName" = $UserName
}

$responsePayload = Call-PingID-API $reqBody $apiEndpoint
$responseObj = $responsePayload | ConvertFrom-Json
Write-Output $responseObj.responseBody.activationCode
