<?php
require_once "conn.php";

session_start();

if (isset($_SESSION["Username"]) || !empty($_SESSION["Username"])) {
    if ($_SESSION["Role"] == $Role) {
        $query = "SELECT * FROM `users` WHERE `Username`=? and `Role`=?";
        $result = $conn->execute_query($query, [$_SESSION["Username"], $_SESSION["Role"]]);
        $acc = $result->fetch_object();
    } else {
        header("Location: " . $_SESSION["Role"] . '.php');
    }
} else {
    header("Location: login.php");
}
