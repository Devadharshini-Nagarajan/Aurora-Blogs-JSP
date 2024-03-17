<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="style.css" />
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
      integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
      crossorigin="anonymous"
    />
    <link
      href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/united/bootstrap.min.css"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.css"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/hyperform/0.9.9/hyperform.css"
    />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Aurora</title>
    <style>
      .nav-div {
        display: flex;
        justify-content: flex-end;
        width: 100%;
      }
      .container {
        background-color: #f2f2f2;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0px 0px 10px 0px #ccc;
        margin: 50px auto;
        width: 500px;
      }
      .form-title {
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 21px;
        font-weight: 600;
        margin: 3rem;
      }
      .error {
        color: red;
        font-weight: bold;
        text-align: center;
        padding: 10px;
      }
    </style>
  </head>
  <body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
      <a class="navbar-brand" href="#">Aurora</a>
      <div class="collapse navbar-collapse" id="navbarColor01">
        <ul class="navbar-nav mr-auto nav-div">
          <li class="nav-item">
            <a class="nav-link active" href="index.html">Home </a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" href="registration">Register</a>
          </li>
        </ul>
      </div>
    </nav>
    <form
      data-toggle="validator"
      role="form"
      style="padding: 20px 80px 0px 80px"
      method="post"
      action="login"
    >
      <div class="container">
        <div class="form-title">LOGIN FORM</div>
        <%
      		if(request.getAttribute("errorMsg") != null) {
      	%>
      		<p class="error"> <%= request.getAttribute("errorMsg") %> </p>
      	<%
      		}
      	%>
        <div class="form-group">
          <label for="username" class="control-label">Username *</label>
          <input
            type="text"
            class="form-control"
            name="username"
            id="username"
            placeholder="Username"
            required
          />
          <div class="help-block with-errors"></div>
        </div>
        <div class="form-group">
          <label for="password" class="control-label">Password *</label>
          <div class="form-group">
            <input
              type="password"
              class="form-control"
              name="password"
              id="password"
              placeholder="Password"
              pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$"
              required
            />
            <div class="help-block">
              Minimum 8 characters, at least 1 letter, 1 number and 1 special
              character
            </div>
          </div>
        </div>
        <div class="form-group">
          <button type="submit" class="btn btn-success">Submit</button>
        </div>
      </div>
    </form>
  </body>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/1000hz-bootstrap-validator/0.11.9/validator.js"></script>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/hyperform/0.9.9/hyperform.js"></script>
</html>
