$OrgParameters = @{
    'Source' = 'ABC Company'
}

New-EventLog -LogName Appilcation -Source $OrgParameters['Source'] -ErrorAction Ignore

Write-EventLog -LogName Appilcation -Source $OrgParameters['Source'] -EntryType Information -EventId 10 -Message "Initializing Primate Site Information"
