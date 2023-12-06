<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>
        Login
    </title>
    
</head>
<body>

<center>
    <form action="#" method="POST">
        <table>
            <tr>
                <th>Username</th>
                <td><input type="text" name="un" id=""></td>
            </tr>
            <tr>
                <th>Password </th>
                <td><input type="password" name="ps" id=""></td>
            </tr>
            <tr>
                 
                <td><input type="submit" name="login" value="LOGIN"></td>
            </tr>
        </table>
        <input type="hidden" name="hd" value="<?php echo $_POST["unm"] ?>">
    </form>

</center>
 
    
</body>
</html>

<?php
 if(isset($_REQUEST['login']))
 {
    if($_POST["un"] == $_POST["hd"])
    {
        header("location:success.php");
    }else{
        header("location:failer.php");
    }

 }

?>