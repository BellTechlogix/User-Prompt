<#
User-Prompt.ps1
Created By Kristopher Roy
Date Created 06Oct17
Script purpose - A Basic Dynamic 2 option User Prompt Function
#>

function user-prompt
{
	param(
    [Parameter(Mandatory=$false)]
    [string] $Title,
    [Parameter(Mandatory=$False)]
    [string]$Message,
	[Parameter(Mandatory=$False)]
    [string]$Select1,
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
    If($Select1 -eq $Null -or $Select1 -eq ""){
			$selection1 = New-Object System.Management.Automation.Host.ChoiceDescription "&Yes", `
			$select1ToolTip
		}
	ELSE
	{
		$selection1 = New-Object System.Management.Automation.Host.ChoiceDescription "&$Select1", `
		$select1ToolTip
	}
    If($Select2 -eq $Null -or $Select2 -eq "")
	{
		$selection2 = New-Object System.Management.Automation.Host.ChoiceDescription "&No", `
		$select2ToolTip
	}
	ELSE
	{
		$selection2 = New-Object System.Management.Automation.Host.ChoiceDescription "&$Select2", `
		$select2ToolTip
	}
    If($message -eq $Null -or $Message -eq ""){$message = "Basic $select1,$select2 Options"}
	$options = [System.Management.Automation.Host.ChoiceDescription[]]($selection1, $selection2)
    $choice = $host.ui.PromptForChoice($title, $message, $options, 0)    
    $choice = [int]$choice
    Return $choice
    #Returns selection1 = 0, and selection2 = 1
}