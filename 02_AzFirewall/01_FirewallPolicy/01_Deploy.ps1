# AZ Firewall Creation
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
        -TemplateUri "" `
        -TemplateParameterUri "" `

# Clean Up
#   Get-AzF -ResourceGroupName JoePOC1
#   Remove-AzF -ResourceGroupName JoePOC1
