$File = "C:\users\hone\desktop\Time.txt"

$PDCname = "Flashpoint"

$Computers = Get-ADComputer -Filter * -SearchBase "CN=Computers,DC= User01,DC=com"
$users | ForEach-Object {
  $Computer = $_.DNSHostName 
  $pdc = Get-WmiObject -Class Win32_LocalTime -ComputerName $PDCname
  $test = Get-WmiObject -Class Win32_LocalTime -ComputerName $Computer
  $Computer + " " + $test.hour.ToString() + ":" + $test.Minute.ToString() + ":" + $test.Second.ToString() + " " + $pdc.hour.ToString() + ":" + $pdc.Minute.ToString() + ":" + $pdc.Second.ToString() >> $file
}

