#!/usr/bin/pwsh
param(
    [string] $ConnectionString,
    [string] $AccessToken,
    [string] $FilePath,
    [string] $DataFactoryName,
    [string] $Sid
)

function Invoke-SQL {
    param([string] $ConnectionString, [string] $AccessToken, [string] $Query)

    Write-Host $Query

    $Connection = New-Object System.Data.SqlClient.SqlConnection($ConnectionString)
    $Connection.AccessToken = $AccessToken
    $Connection.Open()

    $SqlCmd = New-Object System.Data.SqlClient.SqlCommand($Query, $Connection)
    $SqlCmd.ExecuteNonQuery()

    $Connection.Close()
}

$Query =  (Get-Content -Raw -Path $FilePath) `
    -replace '<data-factory>', $DataFactoryName `
    -replace '<sid>', $Sid

Invoke-SQL -ConnectionString $ConnectionString -AccessToken $AccessToken -Query $Query
