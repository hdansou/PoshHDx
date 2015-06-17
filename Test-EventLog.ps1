#requires -Version 1

function Test-EventLog{
    Param
    (
        $LogName,
        $LogSource,
        $ComputerName = $env:COMPUTERNAME
    )
    $LogNameExist = [System.Diagnostics.EventLog]::Exists($LogName,$ComputerName)
    $LogNameOutput = [psobject]@{
        'Name' = $LogName
        'Exist' = $LogNameExist
    } 
    
    $LogSourceExist = [System.Diagnostics.EventLog]::SourceExists($LogSource)
        $LogSourceOutput = [psobject]@{
        'Source' = $LogSource
        'Exist' = $LogSourceExist
    } 
    
    $output = [psobject] @{
        'LogName' = $LogNameOutput
        'LogSource' = $LogSourceOutput
    }
    $output
}


#TODO: Add example and comments
#Test-EventLog -LogName demo -LogSource demo 



# Not efficient. It takes few seconds to run
<#function Test-EventLog{
    Param
    (
        $LogName,
        $LogSource
    )
    
    $ListLogs  = Get-EventLog -LogName * 
    foreach($Log in $ListLogs.Log){
        $temp = Get-EventLog -LogName $Log -ErrorAction SilentlyContinue
        if ($temp.Source -match $LogSource){
            return $true
        }
    }
}
#>