<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
</head>
<body>
<h2>Login</h2>
<?php
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Database connection
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "ict3715";

    $conn = new mysqli($servername, $username, $password, $dbname);

    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    // Retrieve form data
    $parent_email = $_POST['parent_email'];
    $password = $_POST['password'];

    // SQL injection protection
    $parent_email = mysqli_real_escape_string($conn, $parent_email);
    $password = mysqli_real_escape_string($conn, $password);

    // Query to check if user exists
    $sql = "SELECT Parent_ID FROM parent WHERE Parent_email='$parent_email' AND Password='$password'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        // User exists, login successful
        $row = $result->fetch_assoc();
        $_SESSION['loggedin'] = true;
        $_SESSION['parent_email'] = $parent_email;
        $_SESSION['ParentID'] = $row['Parent_ID']; // Store ParentID in session
        header("Location: dashboard.php"); // Redirect to dashboard page
        exit;
    } else {
        // User doesn't exist or credentials are incorrect
        echo "Invalid username or password.";
    }

    $conn->close();
}
?>
<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
    <label for="parent_email">Parent Email:</label><br>
    <input type="text" id="parent_email" name="parent_email" value="john_doe" required><br>
    <label for="password">Password:</label><br>
    <input type="password" id="password" name="password" value="john123" required><br><br>
    <input type="submit" value="Login">
</form>
</body>
</html>