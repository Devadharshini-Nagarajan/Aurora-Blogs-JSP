<%@page import="neu.edu.data.UserSession"%>
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
        background-color: #f7f8fff0;
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
      <i class="fa fa-chevron-circle-left" style="font-size:25px;color:white;margin-right:15px; cursor:pointer;" onclick="history.back()"></i>
      <a class="navbar-brand" href="#" style="cursor: default">Aurora</a>
      <div class="collapse navbar-collapse" id="navbarColor01">
        <ul class="navbar-nav mr-auto nav-div">
          <li class="nav-item">
            <a class="nav-link active" href="userDashboard">Dashboard </a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" href="blogs">Blogs</a>
          </li>
        </ul>
      </div>
    </nav>
    <div>
      <form
        data-toggle="validator"
        role="form"
        style="padding: 20px 80px 0px 80px"
        method="post"
        action="createBlog"
      >
        <div class="container">
            <div class="form-title">CREATE NEW BLOG</div>
            <p class="error"> ${requestScope.errorMsg} </p>
          <div class="form-group">
            <label for="state" class="control-label">Title *</label>
            <input
              type="text"
              class="form-control"
              name="title"
              id="title"
              required
            />
            <div class="help-block with-errors"></div>
          </div>
          <div class="form-group">
            <label for="state" class="control-label">Description *</label>
            <textarea
              type="text"
              class="form-control"
              name="description"
              id="description"
              required
            ></textarea>
            <div class="help-block with-errors"></div>
          </div>
          <div class="form-group">
            <label for="tag">Tag *</label>
            <select name="tag" class="form-control" required>
              <option value="">Open this select menu</option>
              <option value="Travel">Travel</option>
              <option value="Food">Food</option>
              <option value="Tech">Tech</option>
              <option value="Movie">Movie</option>
            </select>
          </div>
          <!-- Image upload later -->
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
