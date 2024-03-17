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
       .image {
        width: 35rem;
        height: 33rem;
      }
      .list-group {
        margin-top: 3rem;
      }
      .list-group-item {
        margin-bottom: 2rem;
      }
      .tags {
      font-size: 32px;
	  font-weight: bold;
	  color: #333;
	  text-align: center;
	  margin: 50px 0;
	  text-shadow: 2px 2px 2px #ccc;
  	}
    </style>
  </head>
  <body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <!--    <i class="fa fa-chevron-circle-left" style="font-size:25px;color:white;margin-right:15px;cursor:pointer;" onclick="history.back()"></i> -->
      <a class="navbar-brand" href="#" style="cursor: default">Aurora</a>
      <div class="collapse navbar-collapse" id="navbarColor01">
        <ul class="navbar-nav mr-auto nav-div">
         <!--  <li class="nav-item">
            <a class="nav-link active" href="profile">Profile</a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" href="blogs">Blogs</a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" href="createBlog">Create Blog</a>
          </li> -->
          <li class="nav-item">
            <a class="nav-link active" href="logout">Logout</a>
          </li>
        </ul>
      </div>
    </nav>
    <div>
    <%
      UserSession userSession = (UserSession) session.getAttribute("userSession");
     %>
    </div>
     <div>
      <div
        style="
          display: grid;
          grid-template-columns: repeat(2, 1fr);
          margin: 5rem 3rem;
        "
      >
        <div>
          <img
            src="https://img.freepik.com/free-vector/female-user-watches-beauty-blogger-showing-latest-trend-makeup-tutorial-beauty-blogger-beauty-blog-production-online-beauty-consultant-concept-pinkish-coral-bluevector-isolated-illustration_335657-1300.jpg?w=2000"
            class="image"
          />
        </div>
        <div>
          <h2>Welcome <% out.append(userSession.getUsername()); %></h2>
          
          <h6 class="tags">"Discover, Create, and Connect - Explore below to unleash the power of blogging."</h6>
          <div class="list-group">
            <a href="profile" class="list-group-item list-group-item-success"
              >Profile</a
            >
            <a href="blogs" class="list-group-item list-group-item-info">Blogs</a>
            <a href="createBlog" class="list-group-item list-group-item-warning"
              >Create blog</a
            >
          </div>
        </div>
      </div>
    </div>
  </body>

  <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/1000hz-bootstrap-validator/0.11.9/validator.js"></script>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/hyperform/0.9.9/hyperform.js"></script> -->
</html>
