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


<h2>Insert Application</h2>
<form action="insert_application.php" method="post">
    <label for="learner_id">Learner ID:</label>
    <input type="number" id="learner_id" name="learner_id">
    <br><br>
    <input type="submit" value="Submit">
</form>
<br>
<p><a href="logout.php">Logout</a></p>
</body>
</html>
