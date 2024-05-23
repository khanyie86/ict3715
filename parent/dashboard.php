<?php
session_start();

// Check if user is logged in
if (!isset($_SESSION['loggedin']) || $_SESSION['loggedin'] !== true) {
    // Redirect to login page if not logged in
    header("Location: index.php");
    exit;
}

// Display user information
echo "Welcome, " . $_SESSION['username'] . $_SESSION['Parent_ID'] ."!<br>";

echo "This is your dashboard";


$parent_id = $_SESSION['Parent_ID'];
?>

<br>
<a href="addlearner.php">Add Learner</a>

<?php
// Database credentials
$servername = "localhost";
$username = "root";
$password = "";
$database = ict3715";

// Create connection
$conn = mysqli_connect($servername, $username, $password, $database);

// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// SQL query to retrieve data from the Learner table
$sql = "SELECT * FROM Learner where ParentID = $parent_id";
//$sql = "SELECT * FROM Learner INNER JOIN learnerrouteassignment ON Learner.LearnerID = learnerrouteassignment.LearnerID
        //WHERE Learner.ParentID = $parent_id";

// Execute the query
$result = mysqli_query($conn, $sql);

// Check if there are any records returned
if (mysqli_num_rows($result) > 0) {
    // Start HTML table
    echo "<table border='1'>
            <tr>
                <th>Learner ID</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Contact Number</th>
                <th>Bus Status</th>n 
                <th>Actions</th>
            </tr>";

    // Fetch and display each row of data
    while ($row = mysqli_fetch_assoc($result)) {
        echo "<tr>
                <td>{$row['LearnerID']}</td>
                <td>{$row['FirstName']}</td>
                <td>{$row['LastName']}</td>
                <td>{$row['ContactNumber']}</td>
                <td>{$row['ContactNumber']}</td>

                <td>
                    <a href='view.php?id={$row['LearnerID']}'>View</a>
                    <a href='delete.php?id={$row['LearnerID']}' onclick='return confirm(\"Are you sure you want to delete this record?\")'>Delete</a>
                </td>
              </tr>";
    }

    // Close the table
    echo "</table>";
} else {
    echo "No records found";
}


// Close the database connection
mysqli_close($conn);
?>

<a href="logout.php">Logout</a>
