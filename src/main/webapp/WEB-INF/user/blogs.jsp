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
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css "
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

      .username {
        font-style: italic;
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
    </style>
  </head>
  <body>
   <%
    	boolean isAdmin = (boolean) request.getAttribute("isAdmin");
        String search = (String) request.getAttribute("search");
    %>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
       <i class="fa fa-chevron-circle-left" style="font-size:25px;color:white;margin-right:15px;cursor:pointer;" onclick="history.back()"></i>
      <a class="navbar-brand" href="#" style="cursor: default">Aurora</a>
      <div class="collapse navbar-collapse" id="navbarColor01">
        <ul class="navbar-nav mr-auto nav-div">
          <li class="nav-item">
           <% if (!isAdmin) { %>
            <a class="nav-link active" href="userDashboard">Dashboard </a>
            <% } else { %>
            <a class="nav-link active" href="adminDashboard">Dashboard </a>
             <% } %>
          </li>
          <%-- <% if (!isAdmin) { %>
          <li class="nav-item">
            <a class="nav-link active" href="createBlog">Create Blog</a>
          </li>
           <% } %> --%>
        </ul>
      </div>
    </nav>
    <div style="display:flex; justify-content: flex-end;margin-right: 2rem">
    	<form action="blogs" method="post">
	    	<div class="input-group mb-3 mr-3" style="margin-top: 25px;">
	    	 	  <input type="text" class="form-control" placeholder="Search" aria-label="Search" name="search" value="<%=search%>" aria-describedby="basic-addon2">
				  <div class="input-group-append">
				    <button class="btn btn-warning" style="height:38px" type="submit">Search</button>
				  </div>
			</div>
		</form>
     <% if (!isAdmin) { %>
    	<a href="createBlog"><button class="btn btn-success my-4 ml-4">Create New Blog</button></a>
     <% } %>
    </div>
    
    <div class="ml-4 my-4">
      <ul class="nav nav-tabs" id="myTab" role="tablist">
      <% if (!isAdmin) { %>
        <li class="nav-item">
          <a
            class="nav-link active"
            id="tab1-tab"
            data-toggle="tab"
            href="#tab1"
            role="tab"
            aria-controls="tab1"
            aria-selected="true"
            >My Blogs</a
          >
        </li>
         <% } %>
        <li class="nav-item">
          <a
            class="nav-link <% if (isAdmin) { %>active<% } %>"
            id="tab2-tab"
            data-toggle="tab"
            href="#tab2"
            role="tab"
            aria-controls="tab2"
            aria-selected="<% if (isAdmin) { %>true<% } else { %>false<% } %>"
            >
            <% if (isAdmin) { %>
            Blogs
            <% } else { %>
            Other's Blogs
             <% } %>
            </a
          >
        </li>
      </ul>
      <div class="tab-content" id="myTabContent">
      <% if (!isAdmin) { %>
        <div
          class="tab-pane fade show active mt-4"
          id="tab1"
          role="tabpanel"
          aria-labelledby="tab1-tab"
        >
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
      <% } %>
        <div
          class="tab-pane fade mt-4 <% if (isAdmin) { %>show active<% } %>"
          id="tab2"
          role="tabpanel"
          aria-labelledby="tab2-tab"
        >
          <div id="blog-list">
            <% ArrayList<UserBlog> otherblogs = (ArrayList<UserBlog>) request.getAttribute("otherblogs"); %>
             <% if (otherblogs.size() == 0) { %>
	            <div class="no-data">
	            	<i class="fas fa-database db"></i>
	            	<span>No data found</span>
	            </div>
             <% } else { %>
	            <% for (UserBlog blog : otherblogs) { %>
		            <div class="blog-post">
		              <h2 class="blog-title">
		                <a href="blogView?id=<%=blog.getId()%>"><%=blog.getTitle()%></a></h2>
		              <p class="blog-description">
		                <%=blog.getDescription()%>
		              </p>
		              <div>
		                <span class="tag"> <%=blog.getTag()%></span>
		              </div>
		              <div class="username">Written by <span><%=blog.getUserName()%></span></div>
		            </div>
		            <hr />
		        <%  } %>
		     <% } %>
          </div>
        </div>
      </div>
    </div>
  </body>

  <script
    src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
    integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
    crossorigin="anonymous"
  ></script>
  <script
    src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
    integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
    crossorigin="anonymous"
  ></script>
  <script
    src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
    integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
    crossorigin="anonymous"
  ></script>
</html>
