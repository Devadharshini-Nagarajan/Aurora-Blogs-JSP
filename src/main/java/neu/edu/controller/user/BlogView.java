package neu.edu.controller.user;

import java.io.IOException;
import java.util.ArrayList;
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
 * Servlet implementation class BlogView
 */
@WebServlet("/blogView")
public class BlogView extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BlogView() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		HttpSession session = request.getSession();
		UserSession userSession = (UserSession) session.getAttribute("userSession");

		ServletContext application = request.getServletContext();
		MongoClient mongoClient = (MongoClient) application.getAttribute("mongodbClient");

		BlogDAO blogDao = new BlogDAO(mongoClient);
		UserBlog blog = blogDao.getBlog(id);

		request.setAttribute("blog", blog);
		
		boolean isUpVoted = false;
		boolean isDownVoted = false;
		if(blog.getUpVote().contains(userSession.getUsername())) {
			isUpVoted = true;
		} else {
			isUpVoted = false;
		}
		
		if(blog.getDownVote().contains(userSession.getUsername())) {
			isDownVoted = true;
		} else {
			isDownVoted = false;
		}
		request.setAttribute("isUpVoted", isUpVoted);
		request.setAttribute("isDownVoted", isDownVoted);

		boolean isSameUser = false;
		if (userSession.getUsername().equals(blog.getUserName())) {
			isSameUser = true;
		}
		request.setAttribute("isSameUser", isSameUser);
		
		boolean isAdmin = false;
		if (userSession.getRole().equals(UserRegistration.Role.ADMIN)) {
			isAdmin = true;
		}
		request.setAttribute("isAdmin", isAdmin);

		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/user/blogView.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		UserSession userSession = (UserSession) session.getAttribute("userSession");
		
		ServletContext application = request.getServletContext();
		MongoClient mongoClient = (MongoClient) application.getAttribute("mongodbClient");

		BlogDAO blogDao = new BlogDAO(mongoClient);
		
//		-----------------------------------------DELETE---------------------------------------
		if (request.getParameter("delete") != null) {
			String id = request.getParameter("delete");
			blogDao.delete(id);
			response.sendRedirect("blogs");
		} 
//		-----------------------------------------upVote---------------------------------------
		else if(request.getParameter("upVote") != null) {
			String id = request.getParameter("upVote");
			UserBlog blog = blogDao.getBlog(id);
			
			if(blog.getUpVote().contains(userSession.getUsername())) {
//				remove from upVote
				List<String> removeUpList = new ArrayList<String>(blog.getUpVote());
				removeUpList.remove(userSession.getUsername());
				blog.setUpVote(removeUpList);
				
			} else {
//				add to upVote
				List<String> addUpList = new ArrayList<String>(blog.getUpVote());
				addUpList.add(userSession.getUsername());
				blog.setUpVote(addUpList);

//				remove from downVote
				List<String> removeDownList = new ArrayList<String>(blog.getDownVote());
				removeDownList.remove(userSession.getUsername());
				blog.setDownVote(removeDownList);
			}
			blogDao.update(blog);
			response.sendRedirect("blogView?id="+id);
		} 
//		-----------------------------------------downVote---------------------------------------
		else if(request.getParameter("downVote") != null) {
			String id = request.getParameter("downVote");
			UserBlog blog = blogDao.getBlog(id);
			
			if(blog.getDownVote().contains(userSession.getUsername())) {
//				remove from downVote
				List<String> removeDownList = new ArrayList<String>(blog.getDownVote());
				removeDownList.remove(userSession.getUsername());
				blog.setDownVote(removeDownList);
				
			} else {
//				add to downVote
				List<String> addList = blog.getDownVote();
				addList.add(userSession.getUsername());
				blog.setDownVote(addList);
				
//				remove from upVote
				List<String> removeUpList = new ArrayList<String>(blog.getUpVote());
				removeUpList.remove(userSession.getUsername());
				blog.setUpVote(removeUpList);
			}
			blogDao.update(blog);
			response.sendRedirect("blogView?id="+id);
		}
	}

}
