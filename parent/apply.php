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

<label for="cars">Choose a route:</label>

<select name="cars" id="cars">
  <option value="volvo">Rooihuiskraal</option>
  <option value="saab">Wierdapark</option>
  <option value="mercedes">Centurion</option>
  <option value="audi">Centurion 2</option>
</select>


<label for="cars">Choose a stop:</label>

<select name="cars" id="cars">
  <option value="volvo">Corner of Panorama and Marabou Road</option>
  <option value="saab">Corner of Kolgansstraat and Skimmerstraat</option>
  <option value="mercedes">Centurion</option>
  <option value="audi">Centurion 2</option>
</select>

<button type='button'>Apply</button>


<br>
<p><a href="logout.php">Logout</a></p>
</body>
</html>
