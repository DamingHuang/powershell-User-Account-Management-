$scriptErrors = @()

Import-Csv -Path "your-path" | ForEach-Object {

    New-ADUser `
        -Name $_.Name `
        -GivenName $_.FirstName `
        -Surname $_.LastName `
        -SamAccountName $_.Username `
        -UserPrincipalName "$($_.Username)@domain.com" `
        -Path "CN=Users,DC=CNY,DC=com" `
        -AccountPassword (ConvertTo-SecureString $_.Password -AsPlainText -Force) `
        -Enabled $true `
        -ErrorAction SilentlyContinue `
        -ErrorVariable +scriptErrors
}

if ($scriptErrors.Count -gt 0) {
 
    Write-Host "The following errors were found:" -ForegroundColor Red
    $scriptErrors | ForEach-Object {
   


        Write-Host "-> $($_.Exception.Message)" -ForegroundColor Red
    }
} else {
 
    Write-Host "All users from the CSV were processed successfully." -ForegroundColor Green
    Remove-Item  "your path"
}

