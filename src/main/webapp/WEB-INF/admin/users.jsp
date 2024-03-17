<%@page import="neu.edu.data.UserBlog"%> <%@ page language="java"
contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="neu.edu.data.UserRegistration"%>
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

      .table-container {
        margin: 4rem;
      }
      th, td {
      text-align: center;
      }
      .username {
        font-style: italic;
        margin-bottom: 10px;
        color: blue;
      }
      .pointer {
        cursor: pointer;
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
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
     <i class="fa fa-chevron-circle-left" style="font-size:25px;color:white;margin-right:15px;cursor:pointer;" onclick="history.back()"></i>
      <a class="navbar-brand" href="#" style="cursor: default">Aurora</a>
      <div class="collapse navbar-collapse" id="navbarColor01">
        <ul class="navbar-nav mr-auto nav-div">
          <li class="nav-item">
            <a class="nav-link active" href="adminDashboard">Dashboard </a>
          </li>
           <!--  <li class="nav-item">
            <a class="nav-link active" href="blogs">Blogs </a>
          </li> -->
        </ul>
      </div>
    </nav>
     <div style="display:flex; justify-content: flex-end;margin-right: 2rem">
    	<a href="createUser"><button class="btn btn-success my-4">Create New User</button></a>
    </div>
    <div class="ml-4 my-4">
      <ul class="nav nav-tabs" id="myTab" role="tablist">
        <li class="nav-item">
          <a
            class="nav-link active"
            id="tab1-tab"
            data-toggle="tab"
            href="#tab1"
            role="tab"
            aria-controls="tab1"
            aria-selected="true"
            >Users</a
          >
        </li>
        <li class="nav-item">
          <a
            class="nav-link"
            id="tab2-tab"
            data-toggle="tab"
            href="#tab2"
            role="tab"
            aria-controls="tab2"
            aria-selected="false"
            >Admins</a
          >
        </li>
      </ul>
      <div class="tab-content" id="myTabContent">
        <div
          class="tab-pane fade show active mt-4"
          id="tab1"
          role="tabpanel"
          aria-labelledby="tab1-tab"
        >
          <div class="table-container">
            <table class="table table-striped">
              <thead>
                <tr>
                  <!-- <th scope="col">#</th> -->
                  <th scope="col">Username</th>
                  <th scope="col">First Name</th>
                  <th scope="col">Last Name</th>
                  <th scope="col">Email</th>
                </tr>
              </thead>
              <tbody>
              <% ArrayList<UserRegistration> users = (ArrayList<UserRegistration>) request.getAttribute("users"); %>
              <% if (users.size() == 0) { %>
               <tr >
               <td colspan="4">
		            <div class="no-data">
		            	<i class="fas fa-database db"></i>
		            	<span>No data found</span>
		            </div>
		         </td>
	            </tr>
             <% } else { %>
				<% for (UserRegistration user : users) {%>
		                <tr>
		                  <!-- <th scope="row">1</th> -->
		                  <td>
		                    <a href="userAndBlogView?name=<%=user.getUsername()%>" class="username"><%=user.getUsername()%></a>
		                  </td>
		                  <td><%=user.getFirstName()%></td>
		                  <td><%=user.getLastName()%></td>
		                  <td><%=user.getEmail()%></td>
		                </tr>
				<%}%>
			<%}%>
              </tbody>
            </table>
          </div>
        </div>
        <div
          class="tab-pane fade mt-4"
          id="tab2"
          role="tabpanel"
          aria-labelledby="tab2-tab"
        >
          <div class="table-container">
            <table class="table table-striped">
              <thead>
                <tr>
                  <!-- <th scope="col">#</th> -->
                  <th scope="col">Username</th>
                  <th scope="col">First Name</th>
                  <th scope="col">Last Name</th>
                  <th scope="col">Email</th>
                </tr>
              </thead>
                <tbody>
              <%
				ArrayList<UserRegistration> admins = (ArrayList<UserRegistration>) request.getAttribute("admins");
                String currentUser = (String) request.getAttribute("currentUser");
              %>
              <% if (admins.size() == 0) { %>
               <tr colspan="4">
                 <td colspan="4">
		            <div class="no-data">
		            	<i class="fas fa-database db"></i>
		            	<span>No data found</span>
		            </div>
		          </td>
	            </tr>
             <% } else { %>
				<% for (UserRegistration admin : admins) { %>
		                <tr>
		                  <!-- <th scope="row">1</th> -->
		                  <td><%=admin.getUsername()%></td>
		                  <td><%=admin.getFirstName()%></td>
		                  <td><%=admin.getLastName()%></td>
		                  <td><%=admin.getEmail()%></td>
		                </tr>
				<%}%>
			<%}%>
            </table>
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
