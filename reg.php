<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <title>Register Page</title>
</head>
<body>
    <center>
    <div class="container">
        <h1>Registeration Page</h1>
        <p>This is some text.</p>
    </div>
        <form action="login.php" method="POST"> 
            <div class="form-group">
                <label for="usr">Uername:</label>
                <input type="text" name="unm" class="form-control" placeholder="Username">
                <!-- <p><input type="text" name="unm" placeholder="Username"></p> -->
                
                <label for="ps">Password:</label>
                <p><input type="password" name="pass" placeholder="******" class="form-control"></p>
                
                <label for="em">Email:</label>
                <p><input type="email" name="email" id="" placeholder="E-Mail" class="form-control" ></p>

                <label for="em">Adderess:</label>
                <p><input type="text" name="add" id="" placeholder="Adderess" class="form-control" ></p>
             
            </div>  
             
             
             <tr>
                <td>
                <input type="submit" value="Register" name="submit" class="btn btn-primary">
                </td>
                <td>
                <input type="reset" value="Reset" name="reset" class="btn btn-danger">
                </td>

             </tr>
             
            
        </form>
    </center>
</body>
</html>