<?php
// Database connection details
require '../db/db_connect.php';  // Include the database connection

try {
    // Check if form is submitted
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        // Get learner_id from form input
        $learner_id = isset($_POST['learner_id']) ? intval($_POST['learner_id']) : 0;

        // Check if learner_id is valid
        if ($learner_id > 0) {
            // Default values
            $application_status = 'app received';
            $created_by = 'admin'; // Replace with the actual user creating the record
            $updated_by = 'admin'; // Replace with the actual user updating the record

            // Prepare and bind
            $stmt = $conn->prepare("INSERT INTO bus_app (learner_id, application_status, created_by, updated_by) VALUES (:learner_id, :application_status, :created_by, :updated_by)");
            $stmt->bindParam(':learner_id', $learner_id);
            $stmt->bindParam(':application_status', $application_status);
            $stmt->bindParam(':created_by', $created_by);
            $stmt->bindParam(':updated_by', $updated_by);

            // Execute the statement
            if ($stmt->execute()) {
                echo "New record created successfully";
            } else {
                echo "Error: Could not execute the query";
            }
        } else {
            echo "Invalid learner_id";
        }
    }
} catch(PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
}

// Close the connection
$conn = null;
?>
