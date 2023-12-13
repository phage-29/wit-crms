<?php
session_start();
unset($_SESSION["Username"]);
header('Location: /wit-crms/login.php');
?>