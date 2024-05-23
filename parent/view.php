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
$database = "unisa_ict3715-24-y";

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

    // SQL query to retrieve learner information
    $sql = "SELECT * FROM Learner WHERE LearnerID = $learner_id";

    // Execute the query
    $result = mysqli_query($conn, $sql);

    if (mysqli_num_rows($result) == 1) {
        // Fetch learner data
        $learner = mysqli_fetch_assoc($result);

        // Display learner information
        echo "<h2>Learner Details</h2>";
        echo "<p><strong>Learner ID:</strong> " . $learner['LearnerID'] . "</p>";
        echo "<p><strong>First Name:</strong> " . $learner['FirstName'] . "</p>";
        echo "<p><strong>Last Name:</strong> " . $learner['LastName'] . "</p>";
        echo "<p><strong>Contact Number:</strong> " . $learner['ContactNumber'] . "</p>";

        // Add more fields as needed

    } else {
        echo "Learner not found.";
    }
} else {
    echo "Invalid request. No ID parameter provided.";
}

// Close the database connection
mysqli_close($conn);
?>
