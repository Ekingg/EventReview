#Get all warning and error events, suppressing any errors
$errorevents = Get-WinEvent -FilterHashTable @{ logname = "Application" } -erroraction silentlycontinue | Where-Object {($_.LevelDisplayName -Like "*Warning*") -or ($_.LevelDisplayName -Like "*Error*")}

#Sort events by time
$errorsorted = $errorevents | sort-object -Property TimeCreated -Descending

#Output events to a gridview for review
$errorsorted | out-gridview
