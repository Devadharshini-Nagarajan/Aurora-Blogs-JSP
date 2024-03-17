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
     <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
      integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
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
       <i class="fa fa-chevron-circle-left" style="font-size:25px;color:white;margin-right:15px;cursor:pointer;" onclick="history.back()"></i>
      <a class="navbar-brand" href="#" style="cursor: default">Aurora</a>
      <div class="collapse navbar-collapse" id="navbarColor01">
        <ul class="navbar-nav mr-auto nav-div">
          <li class="nav-item">
            <a class="nav-link active" href="userDashboard">Dashboard </a>
          </li>
         <!--  <li class="nav-item">
            <a class="nav-link active" href="blogs">Blogs</a>
          </li>
           <li class="nav-item">
            <a class="nav-link active" href="createBlog">Create Blog</a>
          </li> -->
        </ul>
      </div>
    </nav>
    <div style="display: flex;">
      <form
        data-toggle="validator"
        role="form"
        style="padding: 20px 80px 0px 80px"
        method="post"
        action="profile?action=basic"
      >
        <div class="container">
          <div class="form-title">UPDATE BASIC DETAILS</div>
	      	<p class="error"> ${requestScope.basicErrorMsg} </p>
          <div class="form-group">
            <label for="username" class="control-label">Username *</label>
            <input
              type="text"
              class="form-control"
              name="username"
              id="username"
              placeholder="Username"
              required
              readonly
              value="${requestScope.username}"
            />
            <div class="help-block with-errors"></div>
          </div>
          <div class="form-group">
	        <label for="email" class="control-label">Email *</label>
	          <input
	            type="email"
	            class="form-control"
	            name="email"
	            placeholder="Email"
	            required
	            value="${requestScope.email}"
	          />
	        <div class="help-block with-errors"></div>
	      </div>
          <div class="form-group">
            <label for="firstName" class="control-label">First Name *</label>
            <input
              type="text"
              class="form-control"
              name="firstName"
              id="firstName"
              placeholder="First Name"
              required
              value="${requestScope.firstName}"
            />
            <div class="help-block with-errors"></div>
          </div>
          <div class="form-group">
            <label for="lastName" class="control-label">Last Name *</label>
            <input
              type="text"
              class="form-control"
              name="lastName"
              id="lastName"
              placeholder="Last Name"
              required
              value="${requestScope.lastName}"
            />
            <div class="help-block with-errors"></div>
          </div>
          <div class="form-group">
            <button type="submit" class="btn btn-success">Submit</button>
          </div>
        </div>
      </form>
      <form
        data-toggle="validator"
        role="form"
        style="padding: 20px 80px 0px 80px"
        method="post"
        action="profile?action=password"
      >
        <div class="container" style="min-height:401px;">
          <div class="form-title">UPDATE PASSWORD</div>
          	<p class="error"> ${requestScope.pwdErrorMsg} </p>
          <div class="form-group">
            <label for="password" class="control-label">Password *</label>
            <div class="form-group">
              <input
                type="password"
                class="form-control"
                name="password"
                id="password"
                placeholder="Password"
                required
              />
              <!-- pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$"
              <div class="help-block">
                Minimum 8 characters, at least 1 letter, 1 number and 1 special
                character
              </div> -->
            </div>
          </div>
          <div class="form-group">
            <label for="confirmPassword" class="control-label"
              >Confirm Password *</label
            >
            <input
              type="password"
              class="form-control"
              id="confirmPassword"
              name="confirmPassword"
              data-match="#password"
              data-match-error="Whoops, these don't match"
              placeholder="Confirm"
              required
            />
            <div class="help-block with-errors"></div>
          </div>

          <div class="form-group">
            <button type="submit" class="btn btn-success">Submit</button>
          </div>
        </div>
      </form>
    </div>
  </body>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/1000hz-bootstrap-validator/0.11.9/validator.js"></script>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/hyperform/0.9.9/hyperform.js"></script>
</html>
