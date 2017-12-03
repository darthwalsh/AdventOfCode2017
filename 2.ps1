#$x = @("5 9 2 8", "9 4 7 3", "3 8 6 5")
$x = gc .\day2.txt

$x | % { $nums = $_ -split '\s' | % { [int]$_ }; ($nums | measure -Max | select -expand "Maximum" ) - ($nums | measure -Minimum | select -expand "Minimum") } `
    | measure -sum | select -expand "sum"
  
$x | % { $nums = $_ -split '\s' | % { [int]$_ }; $nums | % { $i = $_; $nums | ? { $_ -gt $i -and $_ % $i -eq 0} | % { $_ / $i } } } | measure -sum | select -expand "sum"
