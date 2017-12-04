$end = 361527

$delta = @(
  @(0, -1),
  @(-1, 0),
  @( 0, 1),
  @( 1, 0) 
)

$values = @{}

function Get-Value ($xx, $yy) {
  $values[$xx*10000+$yy]
}
function Set-Value ($xx, $yy, $nn) {
  $values[$xx*10000+$yy] = $nn
}

Set-Value 0 0 1
Set-Value 1 0 1

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
      $sum = 0;
      $sum += Get-Value ($x + 1) ( $y+1)
      $sum += Get-Value ($x + 1) ( $y)
      $sum += Get-Value ($x + 1) ( $y-1)
      $sum += Get-Value ($x) ( $y+1)
      $sum += Get-Value ($x) ( $y-1)
      $sum += Get-Value ($x - 1) ( $y+1)
      $sum += Get-Value ($x - 1) ( $y)
      $sum += Get-Value ($x - 1) ( $y-1)
      Set-Value $x $y $sum
      echo "$x $y $n $sum"
      if ($sum -gt $end) {
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
  $sum = 0;
  $sum += Get-Value ($x + 1) ( $y+1)
  $sum += Get-Value ($x + 1) ( $y)
  $sum += Get-Value ($x + 1) ( $y-1)
  $sum += Get-Value ($x) ( $y+1)
  $sum += Get-Value ($x) ( $y-1)
  $sum += Get-Value ($x - 1) ( $y+1)
  $sum += Get-Value ($x - 1) ( $y)
  $sum += Get-Value ($x - 1) ( $y-1)
  Set-Value $x $y $sum
  echo "$x $y $n $sum"
  if ($sum -gt $end) {
    echo "$x $y $($x + $y)"
    exit
  }
}