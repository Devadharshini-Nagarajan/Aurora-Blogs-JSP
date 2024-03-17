<%@page import="neu.edu.data.UserBlog"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

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
      .error {
        color: red;
        font-weight: bold;
        text-align: center;
        padding: 10px;
      }
      #blog-container {
        margin-top: 30px;
        max-width: 800px;
        margin: 40px 10px;
        background-color: white;
        padding: 20px;
        /* box-shadow: 0 0 10px rgba(0,0,0,0.3); */
      }

      h1 {
        font-size: 36px;
        margin-bottom: 10px;
      }

      p {
        font-size: 18px;
        line-height: 1.5;
        margin-bottom: 20px;
      }

      img {
        max-width: 100%;
        height: auto;
        margin-bottom: 20px;
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
      .pointer {
      	cursor: pointer;
      }
    </style>
  </head>
  <body>
   <%
    	UserBlog blog = (UserBlog) request.getAttribute("blog");
    	boolean isSameUser = (boolean) request.getAttribute("isSameUser");
    	boolean isAdmin = (boolean) request.getAttribute("isAdmin");
    	boolean isUpVoted = (boolean) request.getAttribute("isUpVoted");
    	boolean isDownVoted = (boolean) request.getAttribute("isDownVoted");
    %>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
      <i class="fa fa-chevron-circle-left" style="font-size:25px;color:white;margin-right:15px;cursor:pointer;" onclick="history.back()"></i>
      <a class="navbar-brand" href="#" style="cursor: default">Aurora</a>
      <div class="collapse navbar-collapse" id="navbarColor01">
        <ul class="navbar-nav mr-auto nav-div">
          <li class="nav-item">
            <% if (isAdmin) { %>
            <a class="nav-link active" href="adminDashboard">Dashboard </a>
             <% } else { %>
              <a class="nav-link active" href="userDashboard">Dashboard </a>
              <% } %>
          </li>
          <% if (!isAdmin) { %>
          <li class="nav-item">
            <a class="nav-link active" href="blogs">Blogs</a>
          </li>
          <!-- <li class="nav-item">
            <a class="nav-link active" href="createBlog">Create Blog</a>
          </li> -->
           <% } else { %>
            <!-- <li class="nav-item">
            	<a class="nav-link active" href="users">View Users</a>
          	</li> -->
          	 <li class="nav-item">
            	<a class="nav-link active" href="blogs">Blogs</a>
          	</li>
            <% } %>
        </ul>
      </div>
    </nav>
    <div id="blog-container">
      <h1><%=blog.getTitle()%></h1>
      <div style="display: flex; justify-content: space-between">
              <span class="tag"><%=blog.getTag()%></span>
              <% if (isSameUser || isAdmin) { %>
		          <div style="display: flex" >
	                <a href="blogEdit?id=<%=blog.getId()%>"><button class="btn btn-success">Edit</button></a>

	                <button class="btn btn-danger ml-2" style="height: 38px;" data-toggle="modal" data-target="##deleteModal">Delete</button>

	              </div>
		      <% } %>
       </div>
        <% if (isSameUser || isAdmin) { %>
	       <p>
	        <i class="fa-solid fa-thumbs-up mr-2"></i><%=blog.getUpVote().size()%>
	        <i class="fa-solid fa-thumbs-down ml-4 mr-2"></i><%=blog.getDownVote().size()%>
	       </p>
       <% } %>
       
        <% if (!isSameUser && !isAdmin) { %>
	       <p>
	        <i class="fa-solid fa-thumbs-up pointer mr-2" data-toggle="modal"
          data-target="##upVoteModal"
          <% if (isUpVoted) { %>
         	style="color:green"
          <% } %>
          ></i><%=blog.getUpVote().size()%>
	        <i class="fa-solid fa-thumbs-down pointer ml-4 mr-2 " data-toggle="modal"
          data-target="##downVoteModal"
	      <% if (isDownVoted) { %>
         	style="color:red"
          <% } %>
	        ></i><%=blog.getDownVote().size()%>
	       </p>
       <% } %>
       
       
      <p>
         <%=blog.getDescription()%>
      </p>
     <!--  <img
        src="https://via.placeholder.com/600x300"
        alt="Image for my blog post"
      /> -->

      <div class="username mt-5">Written by  <span><strong><%=blog.getUserName()%></strong> on <%=blog.getCreatedAt()%></span></div>
      
      
      <!-- Upvote modal  -->
       <div
        class="modal fade"
        id="#upVoteModal"
        tabindex="-1"
        role="dialog"
        aria-labelledby="#upVoteModalLabel"
        aria-hidden="true"
      >
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="#upVoteModalLabel">UpVote</h5>
              <button
                type="button"
                class="close"
                data-dismiss="modal"
                aria-label="Close"
              >
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              Are you sure you want to 
              <% if (isUpVoted) { %>
	         	remove the like?
	          <% } else {%>
	          like the post?
	          <% } %>
              
            </div>
            <div class="modal-footer">
              <button
                type="button"
                class="btn btn-secondary"
                data-dismiss="modal"
              >
                Close
              </button>
              <form action="blogView" method="post">
                <button type="submit" name="upVote" value="<%=blog.getId()%>" class="btn btn-primary">
                  Yes
                </button>
              </form>
            </div>
          </div>
        </div>
      </div>
      
      
       <!-- DownVote modal  -->
       <div
        class="modal fade"
        id="#downVoteModal"
        tabindex="-1"
        role="dialog"
        aria-labelledby="#downVoteModalLabel"
        aria-hidden="true"
      >
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="#downVoteModalLabel">UpVote</h5>
              <button
                type="button"
                class="close"
                data-dismiss="modal"
                aria-label="Close"
              >
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              Are you sure you want to 
              <% if (isDownVoted) { %>
	         	remove the dislike?
	          <% } else {%>
	          dislike the post?
	          <% } %>
              
            </div>
            <div class="modal-footer">
              <button
                type="button"
                class="btn btn-secondary"
                data-dismiss="modal"
              >
                Close
              </button>
              <form action="blogView" method="post">
                <button type="submit" name="downVote" value="<%=blog.getId()%>" class="btn btn-primary">
                  Yes
                </button>
              </form>
            </div>
          </div>
        </div>
      </div>
    
	    <!-- Delete modal  -->
	       <div
	        class="modal fade"
	        id="#deleteModal"
	        tabindex="-1"
	        role="dialog"
	        aria-labelledby="#deleteModalLabel"
	        aria-hidden="true"
	      >
	        <div class="modal-dialog" role="document">
	          <div class="modal-content">
	            <div class="modal-header">
	              <h5 class="modal-title" id="#deleteModalLabel">Delete Blog</h5>
	              <button
	                type="button"
	                class="close"
	                data-dismiss="modal"
	                aria-label="Close"
	              >
	                <span aria-hidden="true">&times;</span>
	              </button>
	            </div>
	            <div class="modal-body">
	              Are you sure you want to delete the blog?
	            </div>
	            <div class="modal-footer">
	              <button
	                type="button"
	                class="btn btn-secondary"
	                data-dismiss="modal"
	              >
	                Close
	              </button>
	               <form action="blogView" method="post">
	                	<button class="btn btn-danger ml-2" name='delete' value="<%=blog.getId()%>">Delete</button>
	                </form>
	            </div>
	          </div>
	        </div>
      	</div>
      
    </div>
  </body>
   <script
    src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
    integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
    crossorigin="anonymous"
  ></script>
  <script
    src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
    integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
    crossorigin="anonymous"
  ></script>
  <script
    src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
    integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
    crossorigin="anonymous"
  ></script>
</html>
