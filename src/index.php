<?php
include "DbConnect.php" ;
echo "Hello from the docker container";
echo "<br> PHP Version of container: " . phpversion() ."<br>";
$db = new DbConnect();
$conn = $db->connect() ;