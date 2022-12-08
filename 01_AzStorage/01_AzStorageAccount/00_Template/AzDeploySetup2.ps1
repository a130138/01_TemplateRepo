### Azure Setup ###
# Clear-Host
    Clear-Host
# Setup
    ## Variables
        ### Env Library Check
            Get-ChildItem Variable:
        ### Date/Time
	        $TimeStamp = Get-Date -Format "MMddyyyhhmm"
        ### Input Az Item To Be Created (start with Az)
            $AzItem = "AzStorageAcct"
	    ### Repo Info
            $Repo = "D:\a\r1\a\_a130138_01_TemplateRepo\01_AzStorage\01_AzStorageAccount"
            $TemplateFolder = "00_Template"
	        $TemplateFileJSON = "azuredeploy.json"
            $TemplateFileYAML = "azure-pipelines.yml"
        ### Destination
            $DestinationFileJSON = "$Repo\$AzItem$TimeStamp\$TemplateFileJSON"
            $DestinationFileYAML = "$Repo\$AzItem$TimeStamp\$TemplateFileYAML"
# Process
    ## JSON
        ### Create New Directory and Import Copy of JSON Template
            New-Item -Path $Repo -ItemType Directory -Name $AzItem$TimeStamp
            Copy-Item $Repo\$TemplateFolder\$TemplateFileJSON -Destination $Repo\$AzItem$TimeStamp
        ### Update JSON
            (Get-Content $DestinationFileJSON) | Foreach-Object {
                $_ -replace '@@AzName@@','$AzName' `
                   -replace '@@AzTagEnv@@','$AzTagEnv' `
                   -replace '@@AzTagOwn@@','$AzTagOwn' `
                   -replace '@@AzSkuName@@','$AzSkuName'  `
                   -replace '@@AzSkuTier@@','$AzSkuTier' `
                   -replace '@@AzLoc@@','$AzLoc' `
                   -replace '@@AzKind@@','$AzKind' `
                    } | Set-Content $DestinationFileJSON
        ### Read JSON
            Get-Content $DestinationFileJSON
    ## YAML
        ## Import copy of YAML into newly created Directory
            Copy-Item $Repo\$TemplateFolder\$TemplateFileYAML -Destination $Repo\$AzItem$TimeStamp
        ## Update YAML
            (Get-Content $DestinationFileYAML) | Foreach-Object {
                $_ -replace '@@AzScope@@','$AzRgName' `
                   -replace '@@AzArmConnection@@','$AzArmConnection' `
                   -replace '@@AzAction@@','$AzAction' `
                   -replace '@@AzRgName@@','$AzRgName'  `
                   -replace '@@AzLoc@@','$AzLoc' `
                   -replace '@@AzURL@@','$AzURL' `
                   -replace '@@AzRepoLink@@','$AzRepoLink' `
                   -replace '@@AzDeployMode@@','$AzDeployMode' `
                } | Set-Content $DestinationFileYAML
        ### Read YAML
            Get-Content $DestinationFileYAML