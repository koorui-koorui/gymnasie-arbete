<?php
require_once "db.php";
function getRestaurang($restaurang) {
$sql = "SELECT * FROM restaurang";   
$stmt = $restaurang->prepare($sql);
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}   





