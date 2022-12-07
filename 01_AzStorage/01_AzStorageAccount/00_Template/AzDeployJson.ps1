### Azure Setup ###

# Clear-Host
    Clear-Host

# Setup
    ## Variables
        ### Date/Time
	        $TimeStamp = Get-Date -Format "MMddyyyhhmm"
        ### Input Az Item To Be Created (start with Az)
            $AzItem = "AzStorageAcct"
	    ### Repo Info
            $Repo = "$(System.DefaultWorkingDirectory)\_a130138_01_TemplateRepo\01_AzStorage\01_AzStorageAccount"
            $TemplateFolder = "00_Template"
	        $TemplateFile = "azuredeploy.json"
        ### Destination
            $DestinationFile = "$Repo\$AzItem\$TemplateFile"

# Process
    ## Create New Directory With Template File
        New-Item -Path $Repo -ItemType Directory -Name $AzItem.$TimeStamp
        Copy-Item $Repo\$TemplateFolder\$TemplateFile -Destination $Repo\$AzItem.$TimeStamp

    ## Update File
	    (Get-Content $DestinationFile) | Foreach-Object {
			    $_ -replace 'AzName', 'testname' `
			       -replace 'AzTagEnv', 'POC' `
			       -replace 'AzTagOwn', 'jc' `
			       -replace 'AzSkuName', 'Premium_LRS'  `
                   -replace 'AzSkuTier','Premium' `
                   -replace 'AzLoc','East US 2' `
                   -replace 'AzKind','Storage' `
			    } | Set-Content $DestinationFile

    ## Read Updated File
	    Get-Content $DestinationFile