package neu.edu.controller.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import neu.edu.dao.ProfileDAO;
import neu.edu.dao.RegistrationDAO;
import neu.edu.data.UserRegistration;
import neu.edu.resources.SendEmail;

/**
 * Servlet implementation class CreateUser
 */
@WebServlet("/createUser")
public class CreateUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/admin/createUser.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		
		String errorMsg = "Error: User already exists!!";
		
		UserRegistration userRegistration = new UserRegistration(username, password, email, firstName, lastName);
		
		RegistrationDAO registrationDAO = new RegistrationDAO();
		boolean isSuccess = registrationDAO.insertUser(userRegistration);
		
		if(isSuccess) {
			SendEmail sendEmail = new SendEmail();
			sendEmail.sendEmailFunction(email, "New Registration in Aurora blogging", "You have been registered as an user by our Admin."
					+ "Happy blogging!!! Login to explore!");
			response.sendRedirect("users");
		} else {
			errorMsg = "Error: User already exists!!";
			request.setAttribute("errorMsg", errorMsg);
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/admin/createUser.jsp");
			rd.forward(request, response);
		}
	}

}
