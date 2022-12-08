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
                $_ -replace '@@AzName@@',$env:AzName `
                   -replace '@@AzTagEnv@@',$env:AzTagEnv `
                   -replace '@@AzTagOwn@@',$env:AzTagOwn `
                   -replace '@@AzSkuName@@',$env:AzSkuName  `
                   -replace '@@AzSkuTier@@',$env:AzSkuTier `
                   -replace '@@AzLoc@@',$env:AzLoc `
                   -replace '@@AzKind@@',$env:AzKind `
                    } | Set-Content $DestinationFileJSON
        ### Read JSON
            Get-Content $DestinationFileJSON
    ## YAML
        ## Import copy of YAML into newly created Directory
            Copy-Item $Repo\$TemplateFolder\$TemplateFileYAML -Destination $Repo\$AzItem$TimeStamp
        ## Update YAML
            (Get-Content $DestinationFileYAML) | Foreach-Object {
                $_ -replace '@@AzScope@@',$env:AzScope `
                   -replace '@@AzArmConnection@@',$env:AzArmConnection `
                   -replace '@@AzAction@@',$env:AzAction `
                   -replace '@@AzRgName@@',$env:AzRgName  `
                   -replace '@@AzLoc@@',$env:AzLoc `
                   -replace '@@AzURL@@',$env:AzURL `
                   -replace '@@AzRepoLink@@',$env:AzRepoLink `
                   -replace '@@AzDeployMode@@',$env:AzDeployMode `
                } | Set-Content $DestinationFileYAML
        ### Read YAML
            Get-Content $DestinationFileYAML