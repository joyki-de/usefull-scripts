Power: <?php
$pdo = new PDO('mysql:host=localhost;dbname=goodwe', 'raspi', 'raspi');

$sql = "SELECT * FROM pv ORDER BY id DESC LIMIT 1";
foreach ($pdo->query($sql) as $row)
echo $row['power'];
?>
