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
            $Repo = "C:\TEMP"
            $TemplateFolder = "$Repo\01_AzTemplate"
	        $TemplateFile = "$TemplateFolder\azuredeploy.json"
        ### Source
            $SourceFolder = ""
            $SourceFile = ""
        ### Destination
            $DestinationFile = "$Repo\$AzItem\azuredeploy.json"

# Process
    ## Create New Directory With Template File
        New-Item -Path $Repo -ItemType Directory -Name $AzItem
        Copy-Item $TemplateFile -Destination $Repo\$AzItem

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