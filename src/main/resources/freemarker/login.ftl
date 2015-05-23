<!DOCTYPE html>

<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login</title>
    <link href="http://s3.amazonaws.com/codecademy-content/courses/ltp2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/main.css">
  </head>

  <body>
    <div class="container">
      <form class="form-signin" method="post" action="/login">
        <h2 class="form-signin-heading">Please sign in</h2>
        <label for="inputEmail" class="sr-only">Email address</label>
        <input id="inputEmail" name="username" class="form-control custom-input" placeholder="Email address" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" id="inputPassword" name="password" class="form-control custom-input" placeholder="Password" required>
        <button class="btn btn-lg btn-primary btn-block custom-button" type="submit">Sign in</button>
       </form>

       <div class="signup-link">
         Need to Create an account? <a href="/signup">Signup</a>
       </div>
    </div>

    <script src="/js/main.js"></script>
  </body>

</html>
