<?php
session_start();

// Check if user is logged in
if (!isset($_SESSION['loggedin']) || $_SESSION['loggedin'] !== true) {
    // Redirect to login page if not logged in
    header("Location: index.php");
    exit;
}

// Database credentials
$servername = "localhost";
$username = "root";
$password = "";
$database = "ict3715";

// Create connection
$conn = mysqli_connect($servername, $username, $password, $database);

// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Check if ID parameter is set in the URL
if (isset($_GET['id']) && !empty($_GET['id'])) {
    // Sanitize the ID parameter to prevent SQL injection
    $learner_id = mysqli_real_escape_string($conn, $_GET['id']);

    // SQL query to delete the learner record
    $sql = "DELETE FROM Learner WHERE LearnerID = $learner_id";

    // Execute the query
    if (mysqli_query($conn, $sql)) {
        echo "Record deleted successfully.";
    } else {
        echo "Error deleting record: " . mysqli_error($conn);
    }
} else {
    echo "Invalid request. No ID parameter provided.";
}

// Close the database connection
mysqli_close($conn);
?>

