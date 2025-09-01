
$scriptErrors = @()

Import-Csv -Path "\\WIN-PO0QFHEI7V0\CleanDesktop\Administrator\Desktop\users\rm3.csv" | ForEach-Object {



 $ConfirmPreference = "None"

Remove-ADUser $_.Username

}

 if ($scriptErrors.Count -gt 0) {
    # If there are errors, report them to the console.
    Write-Host "The following errors were found:" -ForegroundColor Red
    $scriptErrors | ForEach-Object {
    # $scriptErrors (call from the array)


        Write-Host "-> $($_.Exception.Message)" -ForegroundColor Red
    }
} else {
    # If there are no errors, let the user know all operations were successful.
    Write-Host "All users from the CSV were processed successfully." -ForegroundColor Green
Remove-Item  \\WIN-PO0QFHEI7V0\CleanDesktop\Administrator\Desktop\users\rm3.csv
}
