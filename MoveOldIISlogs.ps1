#$path1 = "Destination Path here"
$days=0
New-Item -Path "D:\" -Name "HttpProxy" -ItemType "directory"
New-Item -Path "D:\HttpProxy" -Name "Eas" -ItemType "directory"
New-Item -Path "D:\HttpProxy" -Name "Ews" -ItemType "directory"
New-Item -Path "D:\HttpProxy" -Name "Mapi" -ItemType "directory"

$ExchangeLoggingPath1="C:\Program Files\Microsoft\Exchange Server\V15\Logging\HttpProxy\Eas"
$ExchangeLoggingPath2="C:\Program Files\Microsoft\Exchange Server\V15\Logging\HttpProxy\Ews"
$ExchangeLoggingPath3="C:\Program Files\Microsoft\Exchange Server\V15\Logging\HttpProxy\Mapi"

$Path1="D:\HttpProxy\Eas"
$Path2="D:\HttpProxy\Ews"
$Path3="D:\HttpProxy\Mapi"

Function MovenLogfiles($TargetFolder,$pathe)
{
  write-host -debug -ForegroundColor Yellow -BackgroundColor Cyan $TargetFolder

    if (Test-Path $TargetFolder) {
        $Now = Get-Date
        $LastWrite = $Now.AddDays(-$days)
        $Files = Get-ChildItem $TargetFolder -Recurse | Where-Object {$_.Name -like "*.log" -or $_.Name -like "*.blg" -or $_.Name -like "*.etl"}  | where {$_.lastWriteTime -le "$lastwrite"} | Select-Object FullName  
     #  $Files = Get-ChildItem "C:\Program Files\Microsoft\Exchange Server\V15\Logging\"  -Recurse | Where-Object {$_.Name -like "*.log" -or $_.Name -like "*.blg" -or $_.Name -like "*.etl"}  | where {$_.lastWriteTime -le "$lastwrite"} | Select-Object FullName  
        foreach ($File in $Files)
            {
               $FullFileName = $File.FullName  
               Write-Host "Moving file $FullFileName" -ForegroundColor "yellow"; 
               Move-Item -Path $FullFileName -Destination $pathe
               
            }
       }
Else {
    Write-Host "The folder $TargetFolder doesn't exist! Check the folder path!" -ForegroundColor "red"
    }
}
MoveLogfiles($ExchangeLoggingPath1,$Path1)
MoveLogfiles($ExchangeLoggingPath2,$Path2)
MoveLogfiles($ExchangeLoggingPath3,$Path3)

