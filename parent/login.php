<?php
session_start();
require '../db/db_connect.php';  // Include the database connection

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST['email'];
    $password = $_POST['password'];

    // Prepare and execute the statement
    $stmt = $conn->prepare("SELECT * FROM parent WHERE email = :email");
    $stmt->bindParam(':email', $email);
    $stmt->execute();

    // Fetch the user details
    if ($stmt->rowCount() > 0) {
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        // Verify password
        if (password_verify($password, $user['password'])) {
            // Set session variables
            $_SESSION['admin_id'] = $user['admin_id'];
            $_SESSION['surname'] = $user['surname'];
            $_SESSION['initials'] = $user['initials'];
            $_SESSION['email'] = $user['email'];

            // Redirect to a welcome page
            header("Location: dashboard.php");
            exit();
        } else {
            echo "Invalid email or password.";
        }
    } else {
        echo "Invalid email or password.";
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
</head>
<body>
<h2>Login</h2>
<form action="login.php" method="post">
    <label for="email">Email:</label><br>
    <input type="email" id="email" name="email" value="khanyibu86@gmail.com" required><br><br>
    <label for="password">Password:</label><br>
    <input type="password" id="password" name="password" value="khanyie@86" required><br><br>
    <input type="submit" value="Login">
</form>
</body>
</html>
