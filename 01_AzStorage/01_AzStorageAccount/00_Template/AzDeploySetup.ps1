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
            $Repo = "D:\a\r1\a\_a130138_01_TemplateRepo\01_AzStorage\01_AzStorageAccount"
            $TemplateFolder = "00_Template"
	        $TemplateFileJSON = "azuredeploy.json"
            $TemplateFileYAML = "azure-pipelines.yml"
        ### Destination
            $DestinationFileJSON = "$Repo\$AzItem$TimeStamp\$TemplateFile"
            $DestinationFileYAML = "$Repo\$AzItem$TimeStamp\$TemplateFile"
# Process
    ## JSON
        ### Create New Directory and Import Copy of JSON Template
            New-Item -Path $Repo -ItemType Directory -Name $AzItem$TimeStamp
            Copy-Item $Repo\$TemplateFolder\$TemplateFileJSON -Destination $Repo\$AzItem$TimeStamp
        ### Update JSON
            (Get-Content $DestinationFileJSON) | Foreach-Object {
                $_ -replace 'AzName','testname' `
                   -replace 'AzTagEnv','POC' `
                   -replace 'AzTagOwn','jc' `
                   -replace 'AzSkuName','Premium_LRS'  `
                   -replace 'AzSkuTier','Premium' `
                   -replace 'AzLoc','East US 2' `
                   -replace 'AzKind','Storage' `
                    } | Set-Content $DestinationFileJSON
        ### Read JSON
            Get-Content $DestinationFileJSON
    ## YAML
        ## Import copy of YAML into newly created Directory
            Copy-Item $Repo\$TemplateFolder\$TemplateFileYAML -Destination $Repo\$AzItem$TimeStamp
        ## Update YAML
        #     (Get-Content $DestinationFileYAML) | Foreach-Object {
        #         $_ -replace 'AzScope','Resource Group' `
        #            -replace 'AzArmConnection','Dev_Azure_10002_CloudSandbox3(239c71f8-a24e-41d1-96f6-b4f834a1f615)' `
        #            -replace 'AzAction','Create Or Update Resource Group' `
        #            -replace 'AzRgName','JoePOC1'  `
        #            -replace 'AzLoc','East US 2' `
        #            -replace 'AzURL','URL of the file' `
        #            -replace 'AzRepoLink','https://raw.githubusercontent.com/a130138/01_TemplateRepo/main/01_AzStorage/01_AzStorageAccount/01_Deploy/01_Deploy/azuredeploy.json' `
        #            -replace 'AzDeployMode','Incremental' `
        #         } | Set-Content $DestinationFileYAML
        # ### Read YAML
        #     Get-Content $DestinationFileYAML
