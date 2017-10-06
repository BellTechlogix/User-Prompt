<#
User-Prompt.ps1
Created By Kristopher Roy
Date Created 06Oct17
Script purpose - A Basic Dynamic Yes,No User Prompt Function
#>

function user-prompt
{
	param(
    [Parameter(Mandatory=$false)]
    [string] $Title,
    [Parameter(Mandatory=$False)]
    [string]$Message,
    #String to Display what Yes means in a tooltip
    [Parameter(Mandatory=$False)]
    [string]$YesToolTip,
    #String to Display what No means in a tooltip
	[Parameter(Mandatory=$False)]
    [string]$NoToolTip
    )

    If($Title -eq $Null -or $Title -eq ""){$title = "Selection"}
    If($message -eq $Null -or $Message -eq ""){$message = "Basic Yes,No Options"}
    $yes = New-Object System.Management.Automation.Host.ChoiceDescription "&Yes", `
    $YesToolTip
    $no = New-Object System.Management.Automation.Host.ChoiceDescription "&No", `
    $NoToolTip
    $options = [System.Management.Automation.Host.ChoiceDescription[]]($yes, $no)
    $choice = $host.ui.PromptForChoice($title, $message, $options, 0)    
    $choice = [int]$choice
    Return $choice
    #Returns Yes = 0, and No = 1
}