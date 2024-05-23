<?php
// Database connection parameters
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "ict3715";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Function to clean phone numbers
function cleanPhoneNumber($phone) {
    // Remove all non-numeric characters
    return preg_replace('/\D+/', '', $phone);
}

// Arrays to hold table and column names
$tables = [
    "parent" => ["parent_id", "parent_phone"],
    "learner" => ["learner_id", "learner_phone"],
    "administrator" => ["admin_id", "admin_phone"]
];

// Loop through each table and clean phone numbers
foreach ($tables as $table => $columns) {
    $primaryKey = $columns[0];
    $phoneColumn = $columns[1];

    // Select phone numbers
    $sqlSelect = "SELECT $primaryKey, $phoneColumn FROM $table";
    if ($result = $conn->query($sqlSelect)) {
        if ($result->num_rows > 0) {
            // Prepare the update statement
            $stmt = $conn->prepare("UPDATE $table SET $phoneColumn = ? WHERE $primaryKey = ?");

            if (!$stmt) {
                error_log("Error preparing statement for $table: " . $conn->error);
                continue;
            }

            // Update each phone number
            while ($row = $result->fetch_assoc()) {
                $id = $row[$primaryKey];
                $phone = $row[$phoneColumn];
                $cleanedPhone = cleanPhoneNumber($phone);

                // Bind parameters and execute the update statement
                $stmt->bind_param('si', $cleanedPhone, $id);
                if (!$stmt->execute()) {
                    error_log("Error updating record in $table: " . $stmt->error);
                }
            }
            $stmt->close();
        } else {
            error_log("0 results found in $table");
        }
        $result->free();
    } else {
        error_log("Error selecting from $table: " . $conn->error);
    }
}

$conn->close();
?>


