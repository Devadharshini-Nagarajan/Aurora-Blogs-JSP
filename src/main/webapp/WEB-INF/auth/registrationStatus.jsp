<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css "
    />

    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <meta http-equiv="refresh" content="5; url=./login" />
    <title>Aurora</title>
    <style>
      .nav-div {
        display: flex;
        justify-content: flex-end;
        width: 100%;
      }
      #card {
        position: relative;
        width: 320px;
        display: block;
        margin: 40px auto;
        text-align: center;
        font-family: "Source Sans Pro", sans-serif;
        box-shadow: 5px 5px 20px;

      }
      #upper-side {
        padding: 2em;
        background-color: #8bc34a;
        display: block;
        color: #fff;
        border-top-right-radius: 8px;
        border-top-left-radius: 8px;
      }
      #checkmark {
        font-weight: lighter;
        fill: #fff;
        margin: -3.5em auto auto 20px;
      }
      #status {
        font-weight: lighter;
        text-transform: uppercase;
        letter-spacing: 2px;
        font-size: 1em;
        margin-top: -0.2em;
        margin-bottom: 0;
      }
      #lower-side {
        padding: 2em 2em 5em 2em;
        background: #fff;
        display: block;
        border-bottom-right-radius: 8px;
        border-bottom-left-radius: 8px;
      }
      #message {
        margin-top: -0.5em;
        color: #757575;
        letter-spacing: 1px;
      }
    </style>
  </head>
  <body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
      <a class="navbar-brand" href="#">Aurora</a>
      <div class="collapse navbar-collapse" id="navbarColor01">
        <ul class="navbar-nav mr-auto nav-div">
          <li class="nav-item">
            <a class="nav-link active" href="">Home </a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" href="/login">Login</a>
          </li>
        </ul>
      </div>
    </nav>
    <div id="card" class="animated fadeIn">
      <div id="upper-side">
        <?xml version="1.0" encoding="utf-8"?>
        <!-- Generator: Adobe Illustrator 17.1.0, SVG Export Plug-In . SVG Version: 6.00 Build 0)  -->
        <!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">
        <svg
          version="1.1"
          id="checkmark"
          xmlns="http://www.w3.org/2000/svg"
          xmlns:xlink="http://www.w3.org/1999/xlink"
          x="0px"
          y="0px"
          xml:space="preserve"
        >
          <path
            d="M131.583,92.152l-0.026-0.041c-0.713-1.118-2.197-1.447-3.316-0.734l-31.782,20.257l-4.74-12.65
          c-0.483-1.29-1.882-1.958-3.124-1.493l-0.045,0.017c-1.242,0.465-1.857,1.888-1.374,3.178l5.763,15.382
          c0.131,0.351,0.334,0.65,0.579,0.898c0.028,0.029,0.06,0.052,0.089,0.08c0.08,0.073,0.159,0.147,0.246,0.209
          c0.071,0.051,0.147,0.091,0.222,0.133c0.058,0.033,0.115,0.069,0.175,0.097c0.081,0.037,0.165,0.063,0.249,0.091
          c0.065,0.022,0.128,0.047,0.195,0.063c0.079,0.019,0.159,0.026,0.239,0.037c0.074,0.01,0.147,0.024,0.221,0.027
          c0.097,0.004,0.194-0.006,0.292-0.014c0.055-0.005,0.109-0.003,0.163-0.012c0.323-0.048,0.641-0.16,0.933-0.346l34.305-21.865
          C131.967,94.755,132.296,93.271,131.583,92.152z"
          />
          <circle
            fill="none"
            stroke="#ffffff"
            stroke-width="5"
            stroke-miterlimit="10"
            cx="109.486"
            cy="104.353"
            r="32.53"
          />
        </svg>
        <h3 id="status">Success</h3>
      </div>
      <div id="lower-side">
        <p id="message">
          Congratulations, your account has been successfully created.
          <br />
          <br />
          Browser will be redirected automatically in 5secs...
        </p>
      </div>
    </div>
  </body>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/1000hz-bootstrap-validator/0.11.9/validator.js"></script>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/hyperform/0.9.9/hyperform.js"></script>
</html>
