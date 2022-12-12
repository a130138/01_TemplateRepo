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
            $AzCategory = "AzStorage"
	    ### Repo Info
            $AzRepoFolder = "D:\a\r1\a\_a130138_01_TemplateRepo\01_$AzCategory\01_$AzItem"
            $AzTemplateFolder = "00_Template"
	        $AzTemplateFileJSON = "azuredeploy.json"
            $AzTemplateFileYAML = "azure-pipelines.yml"
        ### Destination
            $AzDestinationFileJSON = "$AzRepoFolder\$AzItem$TimeStamp\$AzTemplateFileJSON"
            $AzDestinationFileYAML = "$AzRepoFolder\$AzItem$TimeStamp\$AzTemplateFileYAML"
# Process
    ## JSON
        ### Create New Directory and Import Copy of JSON Template
            New-Item -Path $AzRepoFolder -ItemType Directory -Name $AzItem$TimeStamp
            Copy-Item $AzRepoFolder\$AzTemplateFolder\$AzTemplateFileJSON -Destination $AzRepoFolder\$AzItem$TimeStamp
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
            Copy-Item $AzRepoFolder\$AzTemplateFolder\$AzTemplateFileYAML -Destination $AzRepoFolder\$AzItem$TimeStamp
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