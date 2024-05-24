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


<?php

// Fetch routes and stops if action is set
if (isset($_GET['action'])) {
    $action = $_GET['action'];

    if ($action == 'getRoutes') {
        $sql = "SELECT id, route_name FROM routes";
        $result = $conn->query($sql);
        $routes = array();
        while ($row = $result->fetch_assoc()) {
            $routes[] = $row;
        }
        echo json_encode($routes);
        exit;
    } elseif ($action == 'getStops' && isset($_GET['route_id'])) {
        $route_id = intval($_GET['route_id']);
        $sql = "SELECT id, stop_name FROM stops WHERE route_id = $route_id";
        $result = $conn->query($sql);
        $stops = array();
        while ($row = $result->fetch_assoc()) {
            $stops[] = $row;
        }
        echo json_encode($stops);
        exit;
    }
}

$conn->close();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dynamic Dropdown</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <form>
        <label for="routes">Select Route:</label>
        <select id="routes">
            <option value="">Select a route</option>
        </select>

        <label for="stops">Select Stop:</label>
        <select id="stops">
            <option value="">Select a stop</option>
        </select>
    </form>

    <script>
        $(document).ready(function() {
            // Fetch routes
            $.ajax({
                url: 'apply.php',
                type: 'GET',
                data: { action: 'getRoutes' },
                success: function(data) {
                    var routes = JSON.parse(data);
                    routes.forEach(function(route) {
                        $('#routes').append('<option value="' + route.id + '">' + route.route_name + '</option>');
                    });
                }
            });

            // Fetch stops based on selected route
            $('#routes').change(function() {
                var route_id = $(this).val();
                $('#stops').empty().append('<option value="">Select a stop</option>');
                if (route_id) {
                    $.ajax({
                        url: 'apply.php',
                        type: 'GET',
                        data: { action: 'getStops', route_id: route_id },
                        success: function(data) {
                            var stops = JSON.parse(data);
                            stops.forEach(function(stop) {
                                $('#stops').append('<option value="' + stop.id + '">' + stop.stop_name + '</option>');
                            });
                        }
                    });
                }
            });
        });
    </script>
</body>
</html>

<br>
<p><a href="logout.php">Logout</a></p>
</body>
</html>
