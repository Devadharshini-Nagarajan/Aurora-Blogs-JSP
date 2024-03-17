<%@page import="neu.edu.data.UserBlog"%>
<%@page import="java.util.ArrayList"%>
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
        background-color: #f2f2f2;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0px 0px 10px 0px #ccc;
        margin: 50px auto;
        width: 500px;
      }
      .blog-container {
        margin-top: 50px;
        padding: 20px;
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

      #blog-list {
        max-width: 800px;
        margin: 30px 20px;
        background-color: white;
        padding: 20px;
        /* box-shadow: 0 0 10px rgba(0,0,0,0.3); */
      }

      h2 {
        font-size: 24px;
        margin-bottom: 5px;
        cursor: pointer;
      }

      p {
        font-size: 16px;
        line-height: 1.5;
        margin-bottom: 5px;
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;
      }
      .tag {
        display: inline-block;
        background-color: green;
        color: white;
        padding: 5px 10px;
        border-radius: 5px;
        margin-right: 10px;
        margin-bottom: 10px;
      }
      .no-data {
      	display: flex;
      	margin-top: 1rem;
      	flex-direction: column;
      }
      .no-data span{
        color: gray;
      }
      .db {
          font-size: 39px;
          margin-left: 2rem;
    	  margin-bottom: 1rem;
      }
      
      /*  modal */
      input[type="checkbox"] {
		display:none;
		}
		input[type="checkbox"]:checked ~ .modal,
		input[type="checkbox"]:checked ~ .modal-background {
			display: block;
		}
		.modal-background {
			width: 100%;
		    height: 100%;
		    background-color: rgba(0,0,0,0.5);
		    position: fixed;
		    top: 0;
		    left: 0;
		    display: none;
		    z-index: 9998;
		}
		.modal {
		    position: fixed;
		    top: 0;
		    left: 0;
		    right: 0;
		    bottom: 0;
		    margin: auto;
		    display: none;	
		    width: 300px;
		    height: 230px;
		    background-color: #fff;
		    box-sizing: border-box;
		    z-index: 9999;
		}
		.modal > p {
			padding: 15px;
		    margin: 0;
		}
		.modal-header {
		    height: 75px;
		}
		.modal-header h3 {
			margin: 0;
		    box-sizing: border-box;
		    padding-left: 15px;
		    line-height: 50px;
		    color: #4d4d4d;
		    font-size: 16px;
		    display: inline-block;
		}
		.modal-header label {
			
		    line-height: 50px;
		    cursor: pointer;
		    margin-left: 10rem;
		}
		.modal-header label:hover img {
			opacity: 0.6;
		}
		/* below is optional, it is just an example for the blue button */
		.example-label {
			box-sizing: border-box;
		    display: inline-block;
		    padding: 10px;
		    background-color: #db1212;
		    color: #f9f9f9;
		    font-size: 12px;
		    font-weight: bold;
		    cursor: pointer;
		}
		.example-label:hover {
			background-color: #3c669f;
		}
		
		.delete-modal {
		padding: 0px 80px 0px 80px;padding: 0px 80px 0px 80px;display: flex;
    	align-items: center;font-size: 16px;font-weight: 600;font-style: italic;
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
            <a class="nav-link active" href="adminDashboard">Dashboard </a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" href="users">Users</a>
          </li>
        </ul>
      </div>
    </nav>
    <div style="display: flex">
    <div>
      <form
        data-toggle="validator"
        role="form"
        style="padding: 20px 80px 0px 80px"
        method="post"
        action="userAndBlogView"
      >
        <div class="container">
          <div class="form-title">UPDATE USER DETAILS</div>
          <p class="error">${requestScope.basicErrorMsg}</p>
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
      <%--  <form action="userAndBlogView" method="post" style="padding: 5px 80px 0px 80px">
          	<button class="btn btn-danger ml-2" name='delete' value="${requestScope.username}">Delete User</button>
       </form> --%>
      </div>
      <div class="blog-container">
        <span style="font-size: 22px;font-style: italic;color: #772953;"><b>BLOGS</b></span>

        <div id="blog-list">

          <% ArrayList<UserBlog> blogs = (ArrayList<UserBlog>) request.getAttribute("blogs"); %>
           <% if (blogs.size() == 0) { %>
	            <div class="no-data">
	            	<i class="fas fa-database db"></i>
	            	<span>No data found</span>
	            </div>
            <% } else { %>
	          <% for (UserBlog blog : blogs) { %>
		          <div class="blog-post">
		            <h2 class="blog-title">
		              <a href="blogView?id=<%=blog.getId()%>" ><%=blog.getTitle()%></a></h2>
		            <p class="blog-description">
		              <%=blog.getDescription()%>
		            </p>
		            <div>
		              <span class="tag"> <%=blog.getTag()%></span>
		            </div>
		          </div>
		          <hr />
	          <% } %>
	         <% } %>
        </div>
      </div>
    </div>
    <div  class="delete-modal">
    	<span class="mr-5"> Delete Profile?</span>
    	<div class="ml-5">
		    <input type="checkbox" id="modal">
		    <label for="modal" class="example-label">Delete User</label>
			<label for="modal" class="modal-background"></label>
			<div class="modal">
				<div class="modal-header">
					<h3>Delete</h3>
			        <label for="modal">
			        	<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAMAAAAoLQ9TAAAAdVBMVEUAAABNTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU0N3NIOAAAAJnRSTlMAAQIDBAUGBwgRFRYZGiEjQ3l7hYaqtLm8vsDFx87a4uvv8fP1+bbY9ZEAAAB8SURBVBhXXY5LFoJAAMOCIP4VBRXEv5j7H9HFDOizu2TRFljedgCQHeocWHVaAWStXnKyl2oVWI+kd1XLvFV1D7Ng3qrWKYMZ+MdEhk3gbhw59KvlH0eTnf2mgiRwvQ7NW6aqNmncukKhnvo/zzlQ2PR/HgsAJkncH6XwAcr0FUY5BVeFAAAAAElFTkSuQmCC" width="16" height="16" alt="">
			        </label>
			    </div>
			    <p>Are you sure you want to delete user?</p>
			    <div style="display: flex; justify-content: flex-end;">
				     <form action="userAndBlogView" method="post">
			          	<button class="btn btn-danger mr-2" name='delete' value="${requestScope.username}">Delete User</button>
			         </form>
			    </div>
			</div>
		</div>
	</div>
  </body>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/1000hz-bootstrap-validator/0.11.9/validator.js"></script>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/hyperform/0.9.9/hyperform.js"></script>
</html>
