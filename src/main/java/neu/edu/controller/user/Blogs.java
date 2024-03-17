package neu.edu.controller.user;

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
import javax.servlet.http.HttpSession;

import com.mongodb.MongoClient;

import neu.edu.dao.BlogDAO;
import neu.edu.data.UserBlog;
import neu.edu.data.UserRegistration;
import neu.edu.data.UserSession;

/**
 * Servlet implementation class Blogs
 */
@WebServlet("/blogs")
public class Blogs extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Blogs() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String search = request.getParameter("search");
		
		HttpSession session = request.getSession();
		UserSession userSession = (UserSession) session.getAttribute("userSession");
		
		ServletContext application = request.getServletContext();
		MongoClient mongoClient = (MongoClient) application.getAttribute("mongodbClient");
		
		BlogDAO blogDao = new BlogDAO(mongoClient);
		List<UserBlog> blogs = blogDao.getList();
		if(search != null && search.length() != 0 && !search.isEmpty()) {
			blogs = blogDao.searchList(search);
			request.setAttribute("search", search);
		} else {
			request.setAttribute("search", " ");
		}
	   
	    List<UserBlog> myBlogs = blogs.stream()
	            .filter(p -> p.getUserName().equals(userSession.getUsername()))
	            .collect(Collectors.toList());
	    request.setAttribute("blogs", myBlogs);
	    List<UserBlog> otherBlogs = blogs.stream()
	            .filter(p -> !p.getUserName().equals(userSession.getUsername()))
	            .collect(Collectors.toList());
	    request.setAttribute("otherblogs", otherBlogs);
	    
	    boolean isAdmin = false;
		if (userSession.getRole().equals(UserRegistration.Role.ADMIN)) {
			isAdmin = true;
		}
		request.setAttribute("isAdmin", isAdmin);

		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/WEB-INF/user/blogs.jsp");
		requestDispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String search = request.getParameter("search");
		if(search != "" && search != null) {
			response.sendRedirect("blogs?search="+search);
		} else {
			response.sendRedirect("blogs?search= ");
		}
	}

}
