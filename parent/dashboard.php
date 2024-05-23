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
?>

<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
</head>
<body>
<h2>Welcome to Your Dashboard, <?php echo $firstname . " " . $lastname; ?></h2>
<p>Email: <?php echo $email; ?></p>
<p>This is your dashboard content. You can add your content here.</p>
<p><a href="logout.php">Logout</a></p>
</body>
</html>
