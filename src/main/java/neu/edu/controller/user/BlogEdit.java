package neu.edu.controller.user;

import java.io.IOException;

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
import neu.edu.data.UserSession;

/**
 * Servlet implementation class BlogEdit
 */
@WebServlet("/blogEdit")
public class BlogEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BlogEdit() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		UserSession userSession = (UserSession) session.getAttribute("userSession");
		
		String id = request.getParameter("id");
		ServletContext application = request.getServletContext();
		MongoClient mongoClient = (MongoClient) application.getAttribute("mongodbClient");
		
		BlogDAO blogDao = new BlogDAO(mongoClient);
	    UserBlog blog = blogDao.getBlog(id);
		request.setAttribute("title", blog.getTitle());
		request.setAttribute("description", blog.getDescription());
		request.setAttribute("tag", blog.getTag());
		request.setAttribute("id", blog.getId());
		
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/user/blogEdit.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String basicErrorMsg = "Error: Something went wrong!! Failed to update details";
		
		HttpSession session = request.getSession();
		UserSession userSession = (UserSession) session.getAttribute("userSession");
		
		String id = request.getParameter("id");
		ServletContext application = request.getServletContext();
		MongoClient mongoClient = (MongoClient) application.getAttribute("mongodbClient");
		BlogDAO blogDao = new BlogDAO(mongoClient);
		UserBlog blog = blogDao.getBlog(id);
		
		blog.setTitle(request.getParameter("title"));
		blog.setDescription(request.getParameter("description"));
		blog.setTag(request.getParameter("tag"));
		
		blogDao.update(blog);
		response.sendRedirect("blogView?id="+id);

	}

}
