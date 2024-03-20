# Blogs Application

## Project Objective

The goal of this project is to develop a web-based Message Board application that allows users to post blogs, like/unlike posts.

<img width="1439" alt="image" src="https://github.com/Devadharshini-Nagarajan/Aurora-Blogs-JSP/assets/113491692/fe398b8a-8fcf-45b4-95fe-911870403aa3">


## Key Features

- **User Registration and Login**: Users can register for an account and log in to the platform.
- **Message Posting**: Users can post blogs and like/unlike posts.
- **Search Functionality**: Users can search for specific messages, topics, or hashtags.
- **Upvote/Downvote Messages**: Users can upvote or downvote messages.
- **Edit and Delete Messages**: Users can edit and delete their own messages.
- **Admin Controls**: Administrators have the ability to delete messages and ban users.
- **Guest View**: Users who are not logged in can only view messages.
- **Email Notifications**: Users receive email notifications when someone replies to their message.
- **Change Password**: Users can change their password.
- **Moderator Functionality**: Moderators can flag messages for administrators.

## Technologies Used

### Backend

- JSP
- Servlets
- Design Patterns: Front Controller, MVC, Post-Redirect-Get

### Frontend

- HTML
- CSS
- JavaScript

### Database

- MySQL
- MongoDB


## User Roles

### Admin

- Login
- Manage Admin
- Manage Users
- Manage User Interactions (User Post, User Tags)

### Users

- Registration
- Login
- View Data (View All Post and Reply)
- Create Data (Adding Post or Reply)
- Manage Own Data (Delete Own Post or Reply)

### Guest

- View Data (View All Post and Reply)

### Security & Frameworks	
- JSP Pages cannot be accessed direclty 
- Cannot navigate to any path without successful login
- All Request should navigate via Controller Servlet
- POST should only be done via PRG
- Navigation should be logical 
- Single Login Page for Admin and Users
- Mongo Implementation 
- SQL DB Implementation

