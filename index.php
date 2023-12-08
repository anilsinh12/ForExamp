<?php
   
    if(isset($_POST['upload'])){

        $name=$_POST['name'];
        $filename=$_FILES["uploadfile"]["name"];
        $tempname=$_FILES["uploadfile"]["tmp_name"];
        $folder="./img/".$filename;

        $con = mysqli_connect("localhost", "root", "", "d_b");

        $sql="insert into img_upl (filename,name) values ('$filename','$name')";
        $data=mysqli_query($con,$sql);

        if(move_uploaded_file($tempname,$folder))
        {
            echo "uploaded";
        }else{
            echo "failed";
        }

        
    }
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Image uploading Page</title>
</head>
<body>
    <center>
        <form action="" method="post" enctype="multipart/form-data">
            <table border=2 colspan=2>
                <tr>
                    <th>Name </th>
                    <td><input type="text" name="name" required></td>
                </tr>
                <tr>
                    <th>choose file</th>
                    <td>
                        <input type="file" name="uploadfile" required>

                    </td>
                </tr>
                <tr align-item=center>
                    
                    <td>
                        <input type="submit" name="upload" value="Upload">
                    </td>
                </tr>
                
            </table>
        </form>
    </center>
</body>
</html>

 

<div class="d2">
    <?php
        include ('connection.php');
        $sql="select * from img_upl";
        $res=mysqli_query($con,$sql);

        while($data=mysqli_fetch_assoc($res)){
            ?>
            <table border=2>
                <tr>
                    <td><?php echo $data['id']; ?></td>
                    <td><?php echo $data['name']; ?></td>
                    <td><img src="img<?php echo $data['filename']; ?>" height="100" width="100"></td>
                    
                   
                    
                     
                    <td><a href="img<?php echo $data['filename']; ?>" target="_blank">View</a></td>
                    <td><a href="img<?php echo $data['filename']; ?>"download>Download</a></td>

                    <td><a href="delete.php?id=<?php echo $data["id"]; ?>">Delete</a></td> 
                </tr>
            </table>
            <?php
        }

    ?>
</div>
