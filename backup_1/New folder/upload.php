<?php

require 'vendor/autoload.php'; // Include PHPExcel library

// Database connection
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "noku_ict3715";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Check if file is uploaded successfully
if ($_FILES['excelFile']['error'] == UPLOAD_ERR_OK && is_uploaded_file($_FILES['excelFile']['tmp_name'])) {
    // Temporary file name
    $inputFileName = $_FILES['excelFile']['tmp_name'];

    // Load the Excel workbook
    $objPHPExcel = PHPExcel_IOFactory::load($inputFileName);

    // Get the active sheet
    $sheet = $objPHPExcel->getActiveSheet();

    // Get the highest row and column indices
    $highestRow = $sheet->getHighestRow();
    $highestColumn = $sheet->getHighestColumn();

    // Loop through each row of the worksheet
    for ($row = 2; $row <= $highestRow; $row++) { // Assuming the first row contains headers
        // Retrieve cell values
        $parent_name = $sheet->getCellByColumnAndRow(0, $row)->getValue();
        $parent_lastname = $sheet->getCellByColumnAndRow(1, $row)->getValue();
        $parent_email = $sheet->getCellByColumnAndRow(2, $row)->getValue();
        $parent_phone = $sheet->getCellByColumnAndRow(3, $row)->getValue();
        $parent_password = $sheet->getCellByColumnAndRow(4, $row)->getValue();

        // Prepare SQL statement
        $sql = "INSERT INTO parents (parent_name, parent_lastname, parent_email, parent_phone, parent_password)
                VALUES ('$parent_name', '$parent_lastname', '$parent_email', '$parent_phone', '$parent_password')";

        // Execute SQL statement
        if ($conn->query($sql) === TRUE) {
            echo "Record inserted successfully<br>";
        } else {
            echo "Error inserting record: " . $conn->error . "<br>";
        }
    }
} else {
    echo "Error uploading file.";
}

// Close connection
$conn->close();

?>
