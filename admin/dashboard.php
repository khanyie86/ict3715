<?php
session_start();

// Check if the admin is logged in
if (!isset($_SESSION['admin_id'])) {
    // If not logged in, redirect to login page
    header("Location: login.php");
    exit();
}

// Include the database connection
require '../db/db_connect.php';

// Fetch admin details from the session
$admin_id = $_SESSION['admin_id'];
$surname = $_SESSION['surname'];
$initials = $_SESSION['initials'];
$email = $_SESSION['email'];

?>

<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
</head>
<body>
<h1>Admin Dashboard</h1>

<h2>Welcome, <?php echo htmlspecialchars($initials . ' ' . $surname); ?></h2>
<p>Email: <?php echo htmlspecialchars($email); ?></p>
<p>Admin ID: <?php echo htmlspecialchars($admin_id); ?></p>

<a href="#">Create Bus</a></li> |  <a href="#">Routes</a></li> | <a href="#">Assign Bus to Route</a></li>



<?php
// Include the database connection file
include '../db/db_connect.php'; // Assuming the connection code is in db_connect.php

$sql = "SELECT reg_id, learner_id, bus_number, bus_limit, application_status, waiting_list_number, created_at FROM bus_registration";
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
        <th>Reg ID</th>
        <th>Learner ID</th>
        <th>Bus Number</th>
        <th>Bus Limit</th>
        <th>Application Status</th>
        <th>Waiting List Number</th>
        <th>Created At</th>
        <th>Action</th>
    </tr>
    <?php
    if (count($results) > 0) {
        // Output data of each row
        foreach ($results as $row) {
            echo "<tr>
                    <td>" . htmlspecialchars($row["reg_id"]) . "</td>
                    <td>" . htmlspecialchars($row["learner_id"]) . "</td>
                    <td>" . htmlspecialchars($row["bus_number"]) . "</td>
                    <td>" . htmlspecialchars($row["bus_limit"]) . "</td>
                    <td>" . htmlspecialchars($row["application_status"]) . "</td>
                    <td>" . htmlspecialchars($row["waiting_list_number"]) . "</td>
                    <td>" . htmlspecialchars($row["created_at"]) . "</td>
                <td>
                    <a href='view.php?id={$row['reg_id']}'>View</a>
                </td>
                  </tr>";
        }
    } else {
        echo "<tr><td colspan='7'>No results found</td></tr>";
    }
    ?>
</table>

<p><a href="logout.php">Logout</a></p>

</body>
</html>
