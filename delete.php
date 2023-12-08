<?php
$con = mysqli_connect("localhost","root","","d_b");

$sql = "delete from img_upl where id='".$_GET["id"]."'";
 
         
$data=mysqli_query($con,$sql);

if($data)
    {
        echo "deleted Successfully";
        
    }else{
        echo "Error...!";
    }


?>