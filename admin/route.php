<?php
// Start session
session_start();

// Redirect if admin is not logged in
if (!isset($_SESSION['admin_id'])) {
    header("Location: login.php");
    exit();
}

// Include database connection
require '../db/db_connect.php';

// Fetch admin details from session
$admin_id = $_SESSION['admin_id'];
$surname = $_SESSION['surname'];
$initials = $_SESSION['initials'];
$email = $_SESSION['email'];

// SQL query
$sql = "SELECT
            bus.bus_id,
            bus.bus_no,
            bus.capacity,
            bus.space_status,
            route.route_id,
            route.route_name,
            pickup.pickup_id,
            pickup.pickup_number,
            pickup.pickup_name,
            pickup.pickup_time,
            dropoff.dropoff_id,
            dropoff.dropoff_number,
            dropoff.dropoff_name,
            dropoff.dropoff_time
        FROM
            bus
        JOIN
            route ON bus.bus_id = route.bus_id
        JOIN
            pickup ON route.route_id = pickup.route_id
        JOIN
            dropoff ON route.route_id = dropoff.route_id";

// Prepare and execute the query
$stmt = $conn->prepare($sql);
$stmt->execute();

// Fetch all rows as associative arrays
$rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
</head>
<body>
<h1>Admin Dashboard</h1>
<h2>Welcome, <?php echo htmlspecialchars($initials . ' ' . $surname); ?></h2>
<p>Email: <?php echo htmlspecialchars($email); ?></p>
<p>Admin ID: <?php echo htmlspecialchars($admin_id); ?></p>

<a href="#">Create Bus</a> | <a href="route.php">Routes</a> | <a href="#">Assign Bus to Route</a>

<h2>Bus Route Details</h2>
<table border="1">
    <tr>
        <th>Route Name</th>
        <th>Bus Number</th>
        <th>Capacity</th>
        <th>Space Status</th>
        <th>Stop Name</th>
        <th>Pickup Time</th>
        <th>Dropoff Time</th>
    </tr>
    <?php foreach ($rows as $row): ?>
        <tr>
            <td><?php echo $row['route_name']; ?></td>
            <td><?php echo $row['bus_no']; ?></td>
            <td><?php echo $row['capacity']; ?></td>
            <td><?php echo $row['space_status']; ?></td>
            <td><?php echo $row['pickup_name']; ?></td>
            <td><?php echo $row['pickup_time']; ?></td>
            <td><?php echo $row['dropoff_time']; ?></td>
        </tr>
    <?php endforeach; ?>
</table>
</body>
</html>
