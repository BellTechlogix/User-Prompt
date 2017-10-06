<#
User-Prompt.ps1
Created By Kristopher Roy
Date Created 06Oct17
Script purpose - A Basic Dynamic 2 option User Prompt Function
#>

function user-prompt
{
	#If Select1 and 2 are not defined deafault is Yes,No
	param(
		#Title Defines Header for Prompt
		[Parameter(Mandatory=$false)]
		[string] $Title,
		#Message Defines Body of Prompt
		[Parameter(Mandatory=$False)]
		[string]$Message,
		#Select1 Defines First of two options
		[Parameter(Mandatory=$False)]
		[string]$Select1,
		#Select2 Define Second of two options
		[Parameter(Mandatory=$False)]
		[string]$Select2,
		#String to Display what first option means in a tooltip
		[Parameter(Mandatory=$False)]
		[string]$Selection1ToolTip,
		#String to Display what second option means in a tooltip
		[Parameter(Mandatory=$False)]
		[string]$Selection2ToolTip
    )

    If($Title -eq $Null -or $Title -eq ""){$title = "Selection"}
    If($Select1 -eq $Null -or $Select1 -eq ""){$Select1 = "Yes"}
	$selection1 = New-Object System.Management.Automation.Host.ChoiceDescription "&$Select1", `
	$select1ToolTip
    If($Select2 -eq $Null -or $Select2 -eq ""){$Select2 = "No"}
	$selection2 = New-Object System.Management.Automation.Host.ChoiceDescription "&$Select2", `
	$select2ToolTip
    If($message -eq $Null -or $Message -eq ""){$message = "Basic $select1,$select2 Options"}
	$options = [System.Management.Automation.Host.ChoiceDescription[]]($selection1, $selection2)
    $choice = $host.ui.PromptForChoice($title, $message, $options, 0)    
    $choice = [int]$choice
    Return $choice
    #Returns selection1 = 0, and selection2 = 1

<#
	example 1 - No switches defined:
	user-prompt
	Result = A Yes,No prompt with Title "Selection", Body "Basic Yes,No Options"
		
	example 2 - Selections Defined
	user-prompt -select1 "blue" -select2 "green"
	Result = A blue,green prompt with Title "Selection" Body "Basic Blue,Green Options"
		
	Output will always be 0,1
#>
}