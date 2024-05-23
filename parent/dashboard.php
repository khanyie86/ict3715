<?php
session_start();

// Check if user is logged in, if not redirect to login page
if (!isset($_SESSION['parent_id'])) {
    header("Location: login.php");
    exit();
}

// Retrieve user information from session
$firstname = $_SESSION['firstname'];
$lastname = $_SESSION['lastname'];
$email = $_SESSION['email'];
$parent_id = $_SESSION['parent_id'];
?>

<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
</head>
<body>
<h2>Welcome to Your Dashboard, <?php echo $firstname . " " . $lastname; ?></h2>
<p>Email: <?php echo $email; ?></p>
<p>parent_id: <?php echo $parent_id; ?></p>


<?php
// Include the database connection file
include '../db/db_connect.php'; // Assuming the connection code is in db_connect.php

$sql = "SELECT * FROM Learner where parent_id ='$parent_id' ";
$stmt = $conn->prepare($sql);
$stmt->execute();

// Fetch all results
$results = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<title>Bus Applications</title>
<style>
    table {
        width: 100%;
        border-collapse: collapse;
    }
    table, th, td {
        border: 1px solid black;
    }
    th, td {
        padding: 8px;
        text-align: left;
    }
</style>


<h2>Bus Applications</h2>

<table>
    <tr>
        <th>Learner ID</th>
        <th>Parent ID</th>
        <th>Learner Name</th>
        <th>Learner Surname</th>
        <th>Learner DOB</th>
        <th>Learner Phone</th>
        <th>Created At</th>
        <th>Action</th>
    </tr>
    <?php
    if (count($results) > 0) {
        // Output data of each row
        foreach ($results as $row) {
            echo "<tr>
	
                    <td>" . htmlspecialchars($row["learner_id"]) . "</td>
                    <td>" . htmlspecialchars($row["parent_id"]) . "</td>
                    <td>" . htmlspecialchars($row["learner_name"]) . "</td>
                    <td>" . htmlspecialchars($row["learner_surname"]) . "</td>
                    <td>" . htmlspecialchars($row["learner_dob"]) . "</td>
                    <td>" . htmlspecialchars($row["learner_phone"]) . "</td>
                    <td>" . htmlspecialchars($row["created_at"]) . "</td>
                <td>
                    <a href='view.php?id={$row['learner_id']}'>View</a>
                    <a href='apply.php?id={$row['learner_id']}'>Apply</a>
                </td>
                  </tr>";
        }
    } else {
        echo "<tr><td colspan='7'>No results found</td></tr>";
    }
    ?>
</table>
<br>
<p><a href="logout.php">Logout</a></p>
</body>
</html>
