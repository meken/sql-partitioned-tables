#!/usr/bin/pwsh
param(
    [string] $ConnectionString,
    [string] $AccessToken,
    [string] $FilePath,
    [string] $DataFactoryName,
    [string] $Sid
)

$Query = (Get-Content -Raw -Path $FilePath) `
    -replace '<data-factory>', $DataFactoryName `
    -replace '<sid>', $Sid

$Connection = New-Object System.Data.SqlClient.SqlConnection($ConnectionString)
$Connection.AccessToken = $AccessToken

$Connection.Open()
try {
    $SqlCmd = New-Object System.Data.SqlClient.SqlCommand($Query, $Connection)
    $SqlCmd.ExecuteNonQuery()
} finally {
    $Connection.Close()
}

