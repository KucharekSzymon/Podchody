<html>
<head>
        <link rel="stylesheet" href="index.css">
        <link rel="stylesheet" href="login.css">

        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script>
                function x(){
                        var login = document.getElementById("inputEmail").value;
                        var passwd = document.getElementById("inputPassword").value;

                        if(login == 'admin'){
                                if(passwd == 'password'){
                                        window.location.replace("center.jsp");
                                }
                                else {
                                        alert("Incorrect password!");
                                }
                        }
                        else {
                                alert("Incorrect login!");
                        }
                }
        </script>
</head>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<body>
<div class="container">
        <div class="card card-container">
                <h1>Sign in</h1>
                <!-- <img class="profile-img-card" src="//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" alt="" /> -->
                <p id="profile-name" class="profile-name-card"></p>
                        <span id="reauth-email" class="reauth-email"></span>
                        <input type="text" id="inputEmail" class="form-control" name="user" placeholder="Email address" required autofocus>
                        <input type="password" id="inputPassword" class="form-control" name="pwd" placeholder="Password" required>
                        <button onclick="x()"class="btn btn-lg btn-primary btn-block btn-signin" value="Login" type="submit">Sign in</button>
        </div><!-- /card-container -->
</div><!-- /container -->
</body>
</html>