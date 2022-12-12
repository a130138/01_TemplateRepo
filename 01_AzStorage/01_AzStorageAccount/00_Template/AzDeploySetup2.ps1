### Azure Setup ###
# Clear-Host
    Clear-Host
# Setup
    ## Variables
        ### Env Library Check
            # Get-ChildItem Variable:
            # Get-ChildItem Env:
        ### Date/Time
	        $TimeStamp = Get-Date -Format "MMddyyyhhmm"
        ### Input Az Item To Be Created (start with Az)
            $AzItem = "AzStorageAcct"
	    ### Repo Info
            $AzRepo = "D:\a\r1\a\_a130138_01_TemplateRepo\01_AzStorage\01_AzStorageAccount"
            $AzTemplateFolder = "00_Template"
	        $AzTemplateFileJSON = "azuredeploy.json"
            $AzTemplateFileYAML = "azure-pipelines.yml"
        ### Destination
            $AzDestinationFileJSON = "$AzRepo\$AzItem$TimeStamp\$AzTemplateFileJSON"
            $AzDestinationFileYAML = "$AzRepo\$AzItem$TimeStamp\$AzTemplateFileYAML"
# Process
    ## JSON
        ### Create New Directory and Import Copy of JSON Template
            New-Item -Path $AzRepo -ItemType Directory -Name $AzItem$TimeStamp
            Copy-Item $AzRepo\$AzTemplateFolder\$AzTemplateFileJSON -Destination $AzRepo\$AzItem$TimeStamp
        ### Update JSON
            (Get-Content $AzDestinationFileJSON) | Foreach-Object {
                $_ -replace '@@AzName@@',$env:AzName `
                   -replace '@@AzTagEnv@@',$env:AzTagEnv `
                   -replace '@@AzTagOwn@@',$env:AzTagOwn `
                   -replace '@@AzSkuName@@',$env:AzSkuName  `
                   -replace '@@AzSkuTier@@',$env:AzSkuTier `
                   -replace '@@AzLoc@@',$env:AzLoc `
                   -replace '@@AzKind@@',$env:AzKind `
                    } | Set-Content $AzDestinationFileJSON
        ### Read JSON
            Get-Content $AzDestinationFileJSON
    ## YAML
        ## Import copy of YAML into newly created Directory
            Copy-Item $AzRepo\$AzTemplateFolder\$AzTemplateFileYAML -Destination $AzRepo\$AzItem$TimeStamp
        ## Update YAML
            (Get-Content $AzDestinationFileYAML) | Foreach-Object {
                $_ -replace '@@AzScope@@',$env:AzScope `
                   -replace '@@AzArmConnection@@',$env:AzArmConnection `
                   -replace '@@AzAction@@',$env:AzAction `
                   -replace '@@AzRgName@@',$env:AzRgName  `
                   -replace '@@AzLoc@@',$env:AzLoc `
                   -replace '@@AzURL@@',$env:AzURL `
                   -replace '@@AzRepoLink@@',$env:AzRepoLink `
                   -replace '@@AzDeployMode@@',$env:AzDeployMode `
                } | Set-Content $AzDestinationFileYAML
        ### Read YAML
            Get-Content $AzDestinationFileYAML