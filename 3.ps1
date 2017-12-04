$end = 361527

$delta = @(
  @(0, -1),
  @(-1, 0),
  @( 0, 1),
  @( 1, 0) 
)

$x = 1
$y = 0
$n = 2
$length = 2
while ($true) {
  for ($s = 0; $s -lt 4; ++$s) {
    $d = $delta[$s]
    for ($ss = 0; $ss -lt $length; ++$ss) {
      $x += $d[0]
      $y += $d[1]
      ++$n
      #echo "$x $y $n"
      if ($n -eq $end) {
        echo "$x $y"
        $x = [Math]::Abs($x)
        $y = [Math]::Abs($y)
        echo ($x + $y)
        exit
      }

      if ($ss -eq $length - 2 -and $s -eq 0) { break }
    }
  }
  $length += 2
  $x += 1
  ++$n
  echo "$x $y $n"
  if ($n -eq $end) {
    echo "$x $y $($x + $y)"
    exit
  }
}