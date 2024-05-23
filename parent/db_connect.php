<?php
// Database connection parameters
$servername = "localhost";
$username = "root";
$password = "";
$database = "ict3715";

// Create connection
$conn = new PDO("mysql:host=$servername;dbname=$database", $username, $password);
// Set the PDO error mode to exception
$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
?>
