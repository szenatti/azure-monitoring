  
#PowerShell Commands to creates following resources
#

#Make sure to install the VS Code extension for PowerShell

#Tip: Show the Integrated Terminal from View\Integrated Terminal
#Tip: click on a line and press "F8" to run the line of code

#Make sure you are running the latest version of the Azure PowerShell modules, uncomment the line below and run it (F8)
# Install-Module -Name AzureRM -Force -Scope CurrentUser -AllowClobber

#Step 1: Use a name no longer then five charactors all lowercase.  Your initials would work well if working in the same sub as others.
$mlabname = 'your-initials-here-in-lowercase'
$randomstg = Get-Random -Maximum 99999999

#Resource Group
New-AzResourceGroup -Name "rg-"+$mlabname.tolower()+$randomstg -Location 'Australia East' #The hack uses a few features in preview so its best to leave this in East US
$rg = get-Azresourcegroup -Name ("rg-"+$mlabname.tolower()+$randomstg)

#Infra Resource Deployment
New-AzResourceGroupDeployment -Name "rgdep"+$mlabname.tolower()+$randomstg

#GetDate
$((get-date).ToLocalTime()).ToString("ddMMyyHHmmss")

