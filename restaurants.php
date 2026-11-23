<?php
require_once "assets/functions.php";
header("Content-Type: application/json; charset=utf-8");
$restaurants = getRestaurants($restaurang);
echo json_encode($restaurants);