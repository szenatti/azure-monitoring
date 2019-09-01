  
#PowerShell Commands to creates following resources
#

#Make sure to install the VS Code extension for PowerShell

#Tip: Show the Integrated Terminal from View\Integrated Terminal
#Tip: click on a line and press "F8" to run the line of code

#Make sure you are running the latest version of the Azure PowerShell modules, uncomment the line below and run it (F8)
# Install-Module -Name AzureRM -Force -Scope CurrentUser -AllowClobber

#Step 1: Use a name no longer then five charactors all lowercase.  Your initials would work well if working in the same sub as others.
#$mlabname = 'your-initials-here-in-lowercase'
$mlabname = 'nt'
$vmusername = "azureadmin"
$randomstg = Get-Random -Maximum 99999999
$randomVMname = $mlabname.ToLower()+$randomstg
$rgname = ""

#Resource Group
#New-AzResourceGroup -Name "rg-"+$mlabname.tolower()+$randomstg -Location 'Australia East' 
$rg = get-Azresourcegroup -Name ("rg-"+$mlabname.tolower()+$randomstg)
$vmpassword = Read-Host -Prompt "Provide a password"

#Infra Resource Deployment
$paramObject = @{ 'virtualMachineName' = $randomVMname
                  'adminUsername' = $vmusername 
                  'vmpassword' = $vmpassword
                    }
New-AzResourceGroupDeployment -TemplateUri '' -TemplateParameterObject $paramObject

#GetDate
#$((get-date).ToLocalTime()).ToString("ddMMyyHHmmss")
