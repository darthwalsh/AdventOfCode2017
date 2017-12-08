<#$in = "0
3
0
1
-3" -split '\r\n'
#>
$in = gc day5.txt

$in = $in | % { [int] $_ }

$count = 0
for ($i = 0; $i -ge 0 -and $i -lt $in.Length;) {
  $next = $i + $in[$i]
  if ($in[$i] -ge 3 ) {
    --$in[$i]
  } else {
    ++$in[$i]
  }
  ++$count
  $i = $next
  if ($count % 100000 -eq 0) { echo "$($count)..."}
}

echo $count