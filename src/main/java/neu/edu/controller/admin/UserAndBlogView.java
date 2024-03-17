package neu.edu.controller.admin;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mongodb.MongoClient;

import neu.edu.dao.BlogDAO;
import neu.edu.dao.ProfileDAO;
import neu.edu.dao.UserDAO;
import neu.edu.data.UserBlog;
import neu.edu.data.UserRegistration;

/**
 * Servlet implementation class UserAndBlogView
 */
@WebServlet("/userAndBlogView")
public class UserAndBlogView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserAndBlogView() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		USER DETAILS
		String userName = request.getParameter("name");
		UserDAO userDAO = new UserDAO();
		UserRegistration user = userDAO.getUser(userName);
		
		request.setAttribute("username", user.getUsername());
		request.setAttribute("email", user.getEmail());
		request.setAttribute("firstName", user.getFirstName());
		request.setAttribute("lastName", user.getLastName());

//		BLOGS
		
		ServletContext application = request.getServletContext();
		MongoClient mongoClient = (MongoClient) application.getAttribute("mongodbClient");
		
		BlogDAO blogDao = new BlogDAO(mongoClient);
	    List<UserBlog> blogs = blogDao.getList();
	    List<UserBlog> myBlogs = blogs.stream()
	            .filter(p -> p.getUserName().equals(user.getUsername()))
	            .collect(Collectors.toList());
	    request.setAttribute("blogs", myBlogs);
	    
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/WEB-INF/admin/userAndBlogView.jsp");
		requestDispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if (request.getParameter("delete") != null) {
			String basicErrorMsg = "Error: Something went wrong!! Failed to delete user";
			String name = request.getParameter("delete");
			UserDAO userDAO = new UserDAO();
			boolean isSuccess = userDAO.deleteUser(name);
			if(isSuccess) {
				response.sendRedirect("users");
			} else {
				request.setAttribute("basicErrorMsg", basicErrorMsg);
			}
		} else {
			String basicErrorMsg = "Error: Something went wrong!! Failed to update details";
			String userName = request.getParameter("username");
			String email = request.getParameter("email");
			String firstName = request.getParameter("firstName");
			String lastName = request.getParameter("lastName");
			
			ProfileDAO profileDAO = new ProfileDAO();
			boolean isSuccess = profileDAO.updateBasicDetails(email, firstName, lastName, userName);
			if(isSuccess) {
				response.sendRedirect("userAndBlogView?name="+userName);
			} else {
				request.setAttribute("basicErrorMsg", basicErrorMsg);
			}
		}
		
		
	}

}
