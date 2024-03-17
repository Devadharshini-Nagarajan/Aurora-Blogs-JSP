package neu.edu.controller.auth;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import neu.edu.dao.RegistrationDAO;
import neu.edu.data.UserRegistration;
import neu.edu.resources.SendEmail;

/**
 * Servlet implementation class Register
 */
@WebServlet(urlPatterns = {"/Registration","/registration"})
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Registration() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/auth/registration.jsp");
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
			sendEmail.sendEmailFunction(email, "Registration Successfull", "Thanks for registering with us. Happy blogging!!! Login to explore!");
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/auth/registrationStatus.jsp");
			rd.forward(request, response);
		} else {
			errorMsg = "Error: User already exists!!";
			request.setAttribute("errorMsg", errorMsg);
			
		}
		
		
		
		
		
		
		
	}

}
