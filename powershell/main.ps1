#!/usr/bin/env pwsh

function Send-WelcomeMessage {
    Write-Host " "
    Write-Host " "
    Write-Host "  ____,__, ,__, __,  __,    _   _,__, ___,  ____,____, ____, "
    Write-Host " (-(__(-|_/(-| (-|  (-|    (-|  |(-| (- /  (-/_|(-|__)(-|  \ "
    Write-Host " ,____)_| \,_|_,_|__,_|__,  _|/\|,_|_,_/__,_/  |,_|  \,_|__/ "
    Write-Host "                       LEARN BY ROTE IN THE TERMINAL"
    Write-Host " "
    Write-Host " "
    Write-Host " "
    Write-Host " "
}

function Get-Modules {
    $curDir = (Get-Location).Path
    $Subdirectory = "/modules"
    $moduleDir = Join-Path -Path $curDir -ChildPath $Subdirectory

    if (-not (Test-Path -Path $moduleDir -PathType Container)) {
        Write-Host "'$moduleDir' does not exist."
        return
    }
    
    Get-ChildItem -Path $moduleDir -File | Select-Object -ExpandProperty Name
}





function Main {
    Send-WelcomeMessage
    $modules = @{}
    $moduleDict = @{}
    $requestedModulesArr
    Get-Modules
}

Main