package neu.edu.controller.user;

import java.io.IOException;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.bson.Document;

import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;

import neu.edu.dao.BlogDAO;
import neu.edu.data.UserBlog;
import neu.edu.data.UserSession;


/**
 * Servlet implementation class CreateBlog
 */
@WebServlet("/createBlog")
public class CreateBlog extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateBlog() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/user/createBlog.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ServletContext application = request.getServletContext();
		MongoClient mongoClient = (MongoClient) application.getAttribute("mongodbClient");
		
		
		HttpSession session = request.getSession();
		UserSession userSession = (UserSession) session.getAttribute("userSession");
		String errorMsg = "Error: Something went wrong!! Failed to create blog";
		
		String title = request.getParameter("title");
		String description = request.getParameter("description");
		String tag = request.getParameter("tag");
		String image = "";
		String userName = userSession.getUsername();
		String createdAt = java.time.LocalDate.now().toString();
		List<String> upVote = new ArrayList<String>();
		List<String> downVote = new ArrayList<String>();
		
		UserBlog userBlog = new UserBlog(title, description, tag, image, userName, createdAt, upVote, downVote);
		BlogDAO blogDAO = new BlogDAO(mongoClient);
		UserBlog newBlog = blogDAO.createBlog(userBlog);
		
		response.sendRedirect("blogs");

	}

}
