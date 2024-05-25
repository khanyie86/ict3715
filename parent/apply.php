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

<label for="route">Choose a route:</label>

<select name="route" id="route">
  <option value="rooihuiskraal">Rooihuiskraal</option>
  <option value="wierdapark">Wierdapark</option>
  <option value="centurion">Centurion</option>
</select>


<label for="pick_up_point">Choose a  pick up point:</label>

<select name="pick_up" id="pick_up">
  <option value="rooihuiskraal 1A">Corner of Panorama and Marabou Road</option>
  <option value="rooihuiskraal 1B">Corner of Kolgansstraat and Skimmerstraat</option>
  <option value="wierdapark 2A">Corner of Reddersburg Street and Mafeking Drive</option>
  <option value="wierdapark 2B">Corner of Theuns van Niekerkstraat and Roosmarynstraat</option>
  <option value="centurion 3A">Corner of Jasper Drive and Tieroog Street</option>
  <option value="centurion 3B">Corner of Louise Street and Von Willich Drive</option>
</select>

<button type='button'>Apply</button>


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
