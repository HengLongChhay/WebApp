<%-- 
    Document   : signin
    Created on : Feb 26, 2020, 8:46:02 PM
    Author     : phans
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" type="image/png" href="logokit.png">
        <title>SRS</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="signinstyle.css" type="text/css" rel="stylesheet">
    </head>
    <body>
        <div class="wrapper fadeInDown">
        <div id="formContent">
          <!-- Tabs Titles -->

          <!-- Icon -->
            <div class="fadeIn first">
                <img class="m-5" src="Kitlogo.png" id="icon" alt="User Icon" />
            </div>

          <!-- Login Form -->
            <form action="SignInServlet" method="post">
                <input type="email" id="login" class="fadeIn second" name="email" placeholder="Email" required>
                <input type="password" id="password" class="fadeIn third" name="password" placeholder="Password" required>
                <input type="submit" class="fadeIn fourth" value="Log In">
            </form>

          <!-- Remind Password -->
            <div id="formFooter">
              <a class="underlineHover" href="#">Forgot Password?</a>
            </div>

        </div>
      </div>
        <%--<jsp:forward page="ViewAllServlet"/>--%>
    </body>
</html>
