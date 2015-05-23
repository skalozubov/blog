<!DOCTYPE html>

<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Sign Up</title>
    <link href="http://s3.amazonaws.com/codecademy-content/courses/ltp2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/main.css">
  </head>

  <body>
    <div class="container">
      <form class="form-signin" method="post">
        <h2 class="form-signin-heading">Register a new user</h2>

        <div class="login-link">
          Already a user? <a href="/login">Login</a><p>
        </div>

        <label for="username" class="sr-only">Username</label>
        <input id="username" name="username" class="form-control custom-input" placeholder="Username" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" id="inputPassword" name="password" class="form-control custom-input" placeholder="Password" required>
        <label for="inputVerifyPassword" class="sr-only">Password</label>
        <input type="password" id="inputVerifyPassword" name="verify" class="form-control custom-input" placeholder="Verify password" required>
        <label for="email" class="sr-only">Email (optional)</label>
        <input id="email" name="email" class="form-control custom-input" placeholder="Email (optional)">
        <button class="btn btn-lg btn-primary btn-block custom-button" type="submit">Register</button>
       </form>

    </div>

    <script src="/js/main.js"></script>
  </body>

</html>