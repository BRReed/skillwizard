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
    $modulesArr = @()
    $curDir = (Get-Location).Path
    $Subdirectory = "/modules"
    $moduleDir = Join-Path -Path $curDir -ChildPath $Subdirectory
    if (-not (Test-Path -Path $moduleDir -PathType Container)) {
        Write-Host "'$moduleDir' does not exist."
        return
    }
    $files = Get-ChildItem -Path $moduleDir -File
    foreach ($file in $files) {
        if ($file.PSIsContainer) {
            Write-Host "is container"
        }
        else {$modulesArr += $file.Name}
    }
    return $modulesArr
}

function Write-ModuleQA {
    param(
        [string[]]$modulesArr,
        [int[]]$reqModules
    )
    $moduleDict = @{}
    foreach ($i in $reqModules) {
        $curPath = "./modules/$($modulesArr[$i])"
        $curData = Get-Content -Path $curPath
        foreach ($line in $curData) {
            $curVals = $line -split ","
            $moduleDict[$curVals[0].Trim('"')] = $curVals[1].Trim('"')
        }
    }
    return $moduleDict
}

function Write-Modules {
    param(
        [string[]]$modulesArr
    )
    $i = 0
    foreach ($f in $modulesArr) {
        Write-Host "$i - $f"
        $i += 1
    }
}

function Get-Input {
    $userInput = Read-Host ">"
    if ( $userInput -eq -1 ) {
        exit
    }
    return $userInput
}

function Join-ReqModules {
    param(
        [string]$reqModules,
        [int]$aLen
    )
    $reqModulesArr = $reqModules.Split(" ")
    $reqModulesArrEdit = @()
    foreach ($module in $reqModulesArr) {
        if (0 -gt $module -or $module -gt $aLen) {
            Write-Host "$module is an invalid entry and will be ignored"
        }
        else {
            $reqModulesArrEdit += $module
        }
    }
    return $reqModulesArrEdit
}

function Format-Answer {
    param(
        [string]$userAnswer,
        [string]$actualAnswer
    )
    if ($userAnswer.Length -eq $actualAnswer.Length -or $userAnswer.Length -gt $actualAnswer.Length) {
        $len = $actualAnswer.Length
    }
    else {
        $len = $userAnswer.Length
    }
    $userAnswerArr = $userAnswer.ToCharArray()
    $actualAnswerArr = $actualAnswer.ToCharArray()
    for ($i = 0; $i -lt $len; $i++) {
        if ($userAnswerArr[$i] -eq $actualAnswerArr[$i]) {
            Write-Host $userAnswerArr[$i] -ForegroundColor Green -NoNewline
        }
        elseif ([Char]::IsWhiteSpace($userAnswerArr[$i])) {
            Write-Host $userAnswerArr[$i] -BackgroundColor Red -NoNewline
        }
        else {
            Write-Host $userAnswerArr[$i] -ForegroundColor Red -NoNewline
        }
    }
    if ($userAnswerArr.Length -gt $len) {
        for ($i = $len; $i -lt $userAnswerArr.Length; $i++) {
            if ([Char]::IsWhiteSpace($userAnswerArr[$i])) {
                Write-Host $userAnswerArr[$i] -BackgroundColor Red -NoNewline
            }
            else {
                Write-Host $userAnswerArr[$i] -ForegroundColor Red -NoNewline
            }
        }
    }
    Write-Host " $actualAnswer"
}

function Main {
    Send-WelcomeMessage
    $modulesArr = Get-Modules
    Write-Host "Enter '-1' at any time to exit"
    while ($true) {
        Write-Host "Please enter the module numbers you want to practice separated by a space."
        Write-Modules -modulesArr $modulesArr
        $reqModules = Get-Input
        $reqModulesArr = Join-ReqModules -reqModules $reqModules -aLen ($modulesArr.Length - 1)
        if ($reqModulesArr.Length -eq 0) {
            Write-Host "To exit enter '-1' otherwise please enter at least one module"
        }
        else {
            break
        }
    }
    $modulesDict = Write-ModuleQA -modulesArr $modulesArr -reqModules $reqModulesArr
    while ($true) {
        $randomKey = $modulesDict.keys | Get-Random
        Write-Host $randomKey
        $userAnswer = Get-Input
        if ($userAnswer -eq $modulesDict[$randomKey]) {
            Write-Host $userAnswer -ForegroundColor Green
        }
        else {
            Format-Answer -userAnswer $userAnswer -actualAnswer $modulesDict[$randomKey]
        }
    }
}

Main