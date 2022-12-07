### Azure Yml Setup ###

# Clear-Host
	Clear-Host

# Setup
	## Variables
		### Date/Time
			$TimeStamp = Get-Date -Format "MMddyyyhhmm"
		### Input Az Item To Be Created (start with Az)
			$AzItem = "AzStorageAcct"
		### Repo Info
			$Repo = "D:\a\r1\a\_a130138_01_TemplateRepo\01_AzStorage\01_AzStorageAccount"
			$TemplateFolder = "00_Template"
			$TemplateFile = "azuredeploy.json"
		### Destination
			$DestinationFile = "$Repo\$AzItem$TimeStamp\$TemplateFile"

# Process
	(Get-Content $source) | Foreach-Object {
			$_ -replace 'timestamp', $timestamp `
			   -replace 'environment', 'POC' `
			   -replace 'owner', 'jc' `
			   -replace 'unit', $AzUnit `
			} | Set-Content $destination


	Get-Content $destination