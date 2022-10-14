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
        -TemplateUri "https://raw.githubusercontent.com/a130138/01_TemplateRepo/main/02_AzFirewall/01_FirewallPolicy/azuredeploy.json" `
        -TemplateParameterUri "https://raw.githubusercontent.com/a130138/01_TemplateRepo/main/02_AzFirewall/01_FirewallPolicy/azuredeploy.parameters.json" `

# Clean Up
#   Get-AzFirewallPolicy -Name "FwPolicyName1vqqxiy7ee6xlg" -ResourceGroupName JoePOC1
#   Remove-AzFirewallPolicy -ResourceGroupName JoePOC1 -Name "FwPolicyName1vqqxiy7ee6xlg"
