# Utility
# Clear Host
    Clear-Host
# Connect to AZ account
    Connect-AzAccount
# Change to appropriate subscription
    Set-AzContext "239c71f8-a24e-41d1-96f6-b4f834a1f615"
# Variables
    $ResourceGroupName = "JoePOC1"
# Execute
    New-AzResourceGroupDeployment `
        -ResourceGroupName $ResourceGroupName `
        -TemplateUri "https://raw.githubusercontent.com/a130138/01_TemplateRepo/main/01_AzStorage/azuredeploy.json?token=GHSAT0AAAAAABZYXNIQ6QQOV6OINUUSJPNAY2GY7XQ" `
        #-TemplateParameterUri "https://raw.githubusercontent.com/a130138/01_TemplateRepo/main/01_AzStorage/azuredeploy.parameters.json?token=GHSAT0AAAAAABZYXNIQEWKLKFCEJWNTAW76Y2GZACQ" `
# Clean Up
#   Get-AzStorageAccount -ResourceGroupName JoePOC1
#   Get-AzStorageAccount -ResourceGroupName JoePOC1 -StorageAccountName joe12oct2022
#   Remove-AzStorageAccount -ResourceGroupName "JoePOC1" -Name "storagevqqxiy7ee6xlg"
