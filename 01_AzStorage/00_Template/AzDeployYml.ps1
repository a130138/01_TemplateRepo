# Azure Deploy Yml Setup

# Clear-Host
	Clear-Host

# Variables
	$timestamp = Get-Date -Format "MMddyyyhhmm"
	$repo = "C:\TEMP"
	$source = "$Repo\Test.txt"
	$destination = "$repo\$AzUnit.$timestamp.txt"


# Process
	(Get-Content $source) | Foreach-Object {
			$_ -replace 'timestamp', $timestamp `
			   -replace 'environment', 'POC' `
			   -replace 'owner', 'jc' `
			   -replace 'unit', $AzUnit `
			} | Set-Content $destination


	Get-Content $destination