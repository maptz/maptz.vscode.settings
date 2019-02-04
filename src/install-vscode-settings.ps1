$destinationDirectory = [System.Environment]::ExpandEnvironmentVariables("%APPDATA%/Code/User/")
$scriptDir = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent

Function DoCopy {
    [CmdletBinding()]
    Param(
        [Parameter(ValueFromPipeline)]
        $item
    )
    Write-Host "Installing VSCode settings files to $destinationDirectory"
    #See https://blogs.technet.microsoft.com/heyscriptingguy/2016/01/12/incorporating-pipelined-input-into-powershell-functions/
    #See https://blogs.technet.microsoft.com/heyscriptingguy/2014/05/14/use-powershell-to-create-job-that-runs-at-startup/
    Copy-Item -Path $Item.FullName -Destination $destinationDirectory
}

Get-ChildItem -Path "$scriptDir\vs-code-settings" -Recurse | DoCopy

