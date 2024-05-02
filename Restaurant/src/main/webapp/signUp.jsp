<!DOCTYPE html>
<html>
<head>
  <meta charset="ISO-8859-1">
  <title>Sign Up</title>
  <style>
body {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  height: 100vh;
  background: url(restaurant.jpg) no-repeat center center/cover;
  font-family: Arial, sans-serif;
}

h1 {
  color: white;
  text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
  text-align: center;
  padding-top: 50px;
}

form {
  width: 400px;
  max-width: 400px;
  margin: 1rem;
  padding: 2rem;
  box-shadow: 0 0 40px rgba(0, 0, 0 , 0.2);
  border-radius: var(--border-radius);
  background: white;
}

input[type=text], input[type=password], input[type=email] {
  width: 100%;
  padding: 10px;
  margin-bottom: 20px;
  margin-top: 20px;
  border: none;
  border-radius: 5px;
  box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.2);
}

input[type=submit] {
  width: 100%;
  padding: 10px;
  background-color: #007bff;
  color: white;
  border: none;
  border-radius: 5px;
  box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.2);
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: #0069d9;
}

input[type=reset] {
  width: 100%;
  padding: 10px;
  background-color: #dc3545;
  color: white;
  border: none;
  border-radius: 5px;
  box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.2);
  cursor: pointer;
}

input[type=reset]:hover {
  background-color: #c82333;
}

a {
  display: block;
  text-align: center;
  margin-top: 20px;
  color: white;
  text-decoration: none;
}

a:hover {
  text-decoration: underline;
}

table {
  width: 100%;
  border-collapse: collapse;
}

table td {
  padding: 10px;
  margin: 0 10px;
  border: none;
}
header {
    background-color: #333;
    color: white;
    padding: 20px;
    width: 100%;
    display: flex;
    justify-content: space-between;
    align-items: center;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    position: fixed;
    top: 0;
    z-index: 1;
}

header h1 {
    margin: 1%;
}

nav ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    display: flex;
}

nav ul li {
    margin-right: 10px;
}

nav ul li a {
    color: white;
    text-decoration: none;
    padding: 8px 12px;
    border-radius: 5px;
    transition: background-color 0.3s ease;
}

nav ul li a:hover {
    background-color: #555;
}

/* Align login link to the top right */
nav ul li.login-link {
    margin-left: auto;
}

  </style>
  
<script>
    function validateForm() {
      var userName = document.forms["signupForm"]["txtUserName"].value;
      var email = document.forms["signupForm"]["txtEmail"].value;
      var password = document.forms["signupForm"]["txtPassword"].value;
      var verifyPassword = document.forms["signupForm"]["txtVerifyPassword"].value;

      var userNameError = document.getElementById("userNameError");
      var emailError = document.getElementById("emailError");
      var passwordError = document.getElementById("passwordError");
      var verifyPasswordError = document.getElementById("verifyPasswordError");

      userNameError.innerHTML = "";
      emailError.innerHTML = "";
      passwordError.innerHTML = "";
      verifyPasswordError.innerHTML = "";

      if (userName == "") {
        userNameError.innerHTML = "Please enter your username.";
        return false;
      }
      if (email == "") {
        emailError.innerHTML = "Please enter your email.";
        return false;
      }
      if (password == "") {
        passwordError.innerHTML = "Please enter your password.";
        return false;
      }
      if (verifyPassword == "") {
        verifyPasswordError.innerHTML = "Please verify your password.";
        return false;
      }
      if (password != verifyPassword) {
        verifyPasswordError.innerHTML = "Passwords do not match.";
        return false;
      }
    }
  </script>

</head>
<body>
    <header>
        <nav>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="aboutUs.jsp">About Us</a></li>
                <li><a href="dish.jsp">Dish Served</a></li>
                <li><a href="login.jsp">Login</a></li>
            </ul>
        </nav>
    </header>
  <div align = center>
    <h1>Sign Up</h1>
  </div>
  <form name="signupForm" action="SignUpServlet" method="post" onsubmit="return validateForm()">
    <table>
      <tr><td>Enter User Name:</td><td><input type="text" name="txtUserName"> <span id="userNameError" style="color: red;"></span></td></tr>
      <tr><td>Enter Email:</td><td><input type="email" name="txtEmail"> <span id="emailError" style="color: red;"></span></td></tr>
      <tr><td>Enter Password:</td><td><input type="password" name="txtPassword"> <span id="passwordError" style="color: red;"></span></td></tr>
      <tr><td>Verify Password:</td><td><input type="password" name="txtVerifyPassword"> <span id="verifyPasswordError" style="color: red;"></span></td></tr>
      <tr><td><input type="submit" value="SignUp"></td><td><input type="reset" value="Reset"></td></tr>
    </table>
  </form>
  <a href="login.jsp">Already have an account? Sign In</a>
</body>
</html>