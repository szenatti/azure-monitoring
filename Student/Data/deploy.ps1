#PowerShell Commands to creates following resources
#

#Make sure to install the VS Code extension for PowerShell

#Tip: Show the Integrated Terminal from View\Integrated Terminal
#Tip: click on a line and press "F8" to run the line of code

#Make sure you are running the latest version of the Azure PowerShell modules, uncomment the line below and run it (F8)
# Install-Module -Name AzureRM -Force -Scope CurrentUser -AllowClobber

#Step 1: Use a name no longer then five charactors all lowercase.  Your initials would work well if working in the same sub as others.
#$mlabname = 'your-initials-here-in-lowercase'
Select-AzSubscription -SubscriptionName "SubscriptionName"

$sqlusername = "sqladmin"
$sqlservername = "sqlvirtualserver"
$storagename = "sqllogstg"
$rgname = "<************>"

#Resource Group
#New-AzResourceGroup -Name "rg-"+$mlabname.tolower()+$randomstg -Location 'Australia East' 
$rg = get-Azresourcegroup -Name $rgname 
$sqlpassword = ConvertTo-SecureString (Read-Host -Prompt "Provide a password") -AsPlainText -Force

#Infra Resource Deployment
$paramObject = @{ 'SQLUserName' = $sqlusername
                  'SQLServerName' = $sqlservername 
                  'StorageName' = $storagename
                  }
New-AzResourceGroupDeployment -TemplateUri 'https://github.com/szenatti/azure-monitoring/raw/master/Student/Data/azuredeploy.json' -TemplateParameterObject $paramObject -SQLPassword $sqlpassword -ResourceGroupName $rgname 

