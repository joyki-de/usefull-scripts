<?php
$con  = mysqli_connect("localhost","raspi","raspi","templogging");
 if (!$con) {
     # code...
    echo "Problem in database connection! Contact administrator!" . mysqli_error();
 }else{
         $sql ="SELECT temp FROM esplog where area = 'Vorlage'  ORDER BY datumuhrzeit DESC LIMIT 1";
         $result = mysqli_query($con,$sql);
         $chart_data="";
         while ($row = mysqli_fetch_array($result)) { 
 
            $tempvorlage = $row['temp'];
        }
 
 }
?>
