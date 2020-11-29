New-SmbShare -Name "Cert" -Path "C:\Certificate_Store" -FullAccess "CENSONI\basim"

$mypwd = Get-Credential -UserName 'Enter password below' -Message 'Enter password below'

Import-PfxCertificate -FilePath C:\mypfx.pfx -CertStoreLocation Cert:\LocalMachine\My -Password $mypwd.Password

#Import-PfxCertificate -FilePath C:\mypfx.pfx -CertStoreLocation Cert:\LocalMachine\My -Password $mypwd.Password

certutil -addstore -service -f “My” “VeriSign Class 3 Code Signing 2010 CA – valid 01-2014.cer”
certutil -ImportPfx -service -f “My” “VeriSign Class 3 Code Signing 2010 CA – valid 01-2014.pfx”
