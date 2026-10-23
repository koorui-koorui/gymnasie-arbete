<?php
$hostname_restaurang = "localhost";
$database_restaurang = "restauranghost";
$username_restaurang = "restauranghost";
$password_restaurang = "denis";


try {
  $restaurang = new PDO("mysql:host=$hostname_restaurang;dbname=$database_restaurang;charset=utf8mb4", 
  $username_restaurang, 
  $password_restaurang);
  // set the PDO error mode to exception
  $restaurang->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
 echo "Connected successfully"; // denna rad kan tas bort om allt fungerar
} catch(PDOException $e) {

echo "Connection failed: " . $e->getMessage();
}