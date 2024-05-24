<?php
session_start();

// Redirect to login page if admin is not logged in
if (!isset($_SESSION['admin_id'])) {
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

// Include the database connection file
require '../db/db_connect.php';

// Retrieve bus applications from the database
$sql = "SELECT * FROM bus_app";
$stmt = $conn->prepare($sql);
$stmt->execute();
$results = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
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
</head>
<body>
<h1>Admin Dashboard</h1>

<h2>Welcome, <?php echo htmlspecialchars($initials . ' ' . $surname); ?></h2>
<p>Email: <?php echo htmlspecialchars($email); ?></p>
<p>Admin ID: <?php echo htmlspecialchars($admin_id); ?></p>

<a href="#">Create Bus</a> | <a href="route.php">Routes</a> | <a href="#">Assign Bus to Route</a>

<h2>Bus Applications</h2>

<table>
    <tr>
        <th>App ID</th>
        <th>Learner ID</th>
        <th>Application Status</th>
        <th>Created At</th>
        <th>Created By</th>
        <th>Updated At</th>
        <th>Updated By</th>
        <th>Action</th>
    </tr>
    <?php if (count($results) > 0): ?>
        <?php foreach ($results as $row): ?>
            <tr>
                <td><?php echo htmlspecialchars($row["app_id"]); ?></td>
                <td><?php echo htmlspecialchars($row["learner_id"]); ?></td>
                <td><?php echo htmlspecialchars($row["app_status"]); ?></td>
                <td><?php echo htmlspecialchars($row["created_at"]); ?></td>
                <td><?php echo htmlspecialchars($row["created_by"]); ?></td>
                <td><?php echo htmlspecialchars($row["updated_at"]); ?></td>
                <td><?php echo htmlspecialchars($row["updated_by"]); ?></td>
                <td>
                    <a href="view.php?id=<?php echo htmlspecialchars($row['app_id']); ?>">View</a>
                </td>
            </tr>
        <?php endforeach; ?>
    <?php else: ?>
        <tr><td colspan="8">No results found</td></tr>
    <?php endif; ?>
</table>

<p><a href="logout.php">Logout</a></p>
</body>
</html>
