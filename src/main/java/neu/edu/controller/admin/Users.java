package neu.edu.controller.admin;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import neu.edu.dao.UserDAO;
import neu.edu.data.UserRegistration;
import neu.edu.data.UserSession;

/**
 * Servlet implementation class Users
 */
@WebServlet("/users")
public class Users extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Users() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		UserDAO userDAO = new UserDAO();
		List<UserRegistration> usersAll = userDAO.getList();
		
		
		
		HttpSession session = request.getSession();
		UserSession userSession = (UserSession) session.getAttribute("userSession");
		request.setAttribute("currentUser", userSession.getUsername());
		
		List<UserRegistration> users = usersAll.stream()
	            .filter(user -> user.getRoleString().equals("USER"))
	            .collect(Collectors.toList());
		List<UserRegistration> admins = usersAll.stream()
	            .filter(admin -> admin.getRoleString().equals("ADMIN") && !userSession.getUsername().equals(admin.getUsername()))
	            .collect(Collectors.toList());

		request.setAttribute("users", users);
		request.setAttribute("admins", admins);
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/WEB-INF/admin/users.jsp");
		requestDispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
