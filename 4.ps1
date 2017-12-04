#$lines = @("aa bb cc dd ee", "aa bb cc dd aa", "aa bb cc dd aaa")
#$lines = @("abcde fghij ", "abcde xyz ecdab ", "a ab abc abd abf abj ", "iiii oiii ooii oooi oooo ", "oiii ioii iioi iiio ")
$lines = gc .\day4.txt

$lines | ? { 
  $line = $_ -split ' '; 
  $dist = $line | sort -unique | measure
  $dist.Count -eq $line.Count
} | measure | select -expand Count

$lines | ? { 
  $line = $_ -split ' ' | % { -join ([char[]]$_ | sort) } 
  $dist = $line | sort -unique | measure
  $dist.Count -eq $line.Count
} | measure | select -expand Count
