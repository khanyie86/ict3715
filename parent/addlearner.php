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

// Check if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve form data
    $firstName = $_POST['firstName'];
    $lastName = $_POST['lastName'];
    $contactNumber = $_POST['contactNumber'];

    // Get parent ID from session
    $parentID = $_SESSION['ParentID'];

    // SQL query to insert learner data
    $sql = "INSERT INTO Learner (ParentID, FirstName, LastName, ContactNumber) 
            VALUES ('$parentID', '$firstName', '$lastName', '$contactNumber')";

    // Execute query
    if (mysqli_query($conn, $sql)) {
        echo "Learner added successfully!";
    } else {
        echo "Error: " . $sql . "<br>" . mysqli_error($conn);
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Add Learner</title>
</head>
<body>
<h2>Add Learner</h2>
<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
    <label for="firstName">First Name:</label><br>
    <input type="text" id="firstName" name="firstName" required><br>
    <label for="lastName">Last Name:</label><br>
    <input type="text" id="lastName" name="lastName" required><br>
    <label for="contactNumber">Contact Number:</label><br>
    <input type="text" id="contactNumber" name="contactNumber" required><br><br>
    <input type="submit" value="Submit">
</form>
<br>
<a href="dashboard.php">Back to Dashboard</a>
</body>
</html>

<?php
// Close the database connection
mysqli_close($conn);
?>
