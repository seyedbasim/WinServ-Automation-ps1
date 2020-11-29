# Close the TS UI temporarily
$TSProgressUI = New-Object -COMObject Microsoft.SMS.TSProgressUI
$TSProgressUI.CloseProgressDialog()
 
# Prompt for input
[System.Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic') | Out-Null
$password = [Microsoft.VisualBasic.Interaction]::InputBox("Enter Password to Encrpyt Drive C:", "Bitlocker Encryption", "password")
 
# Set the TS variable
$tsenv = New-Object -COMObject Microsoft.SMS.TSEnvironment
$tsenv.Value("password") = $password

$SecureString = ConvertTo-SecureString $password -AsPlainText -Force
Enable-BitLocker -MountPoint "Y:" -EncryptionMethod Aes256 -UsedSpaceOnly -PasswordProtector $SecureString 

