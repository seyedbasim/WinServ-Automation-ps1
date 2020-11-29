Get-WmiObject Win32_NetworkLoginProfile |
     Where{$_.LastLogon} |
     Sort LastLogon -Descending | 
     select-object Name, LastLogon -first 1