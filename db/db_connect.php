<?php
// db_connect.php

// Database connection details
$servername = "localhost";
$username = "root";
$password = "";
$database = "zoey_busregsystem";

try {
    // Create connection
    $conn = new PDO("mysql:host=$servername;dbname=$database", $username, $password);
    // Set the PDO error mode to exception
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
    die();
}
?>
