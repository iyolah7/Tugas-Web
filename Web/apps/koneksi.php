<?php
    $server = 'localhost';
    $username ='root';
    $password = '';
    $database = 'web_depan';

    $conn = mysqli_connect($server,$username,$password,$database);

    if(!$conn){
        die('Gagal konek : '.mysqli_connect_error());
    }
?>