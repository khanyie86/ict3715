<?php
session_start();
require '../db/db_connect.php';  // Include the database connection

$errors = []; // Array to store errors

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Sanitize and validate input
    $email = filter_var($_POST['email'], FILTER_SANITIZE_EMAIL);
    $password = $_POST['password'];

    if (filter_var($email, FILTER_VALIDATE_EMAIL) === false) {
        $errors[] = "Invalid email format.";
    } else {
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
                $_SESSION['parent_id'] = $user['parent_id'];
                $_SESSION['lastname'] = $user['lastname'];
                $_SESSION['firstname'] = $user['firstname'];
                $_SESSION['email'] = $user['email'];

                // Redirect to a welcome page
                header("Location: dashboard.php");
                exit();
            } else {
                $errors[] = "Invalid email or password.";
            }
        } else {
            $errors[] = "Invalid email or password.";
        }
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
<?php if (!empty($errors)): ?>
    <div style="color: red;">
        <?php foreach ($errors as $error): ?>
            <p><?php echo $error; ?></p>
        <?php endforeach; ?>
    </div>
<?php endif; ?>
<form action="login.php" method="post">
    <label for="email">Email:</label><br>
    <input type="email" id="email" name="email" required><br><br>
    <label for="password">Password:</label><br>
    <input type="password" id="password" name="password" required><br><br>
    <input type="submit" value="Login">
</form>
</body>
</html>
