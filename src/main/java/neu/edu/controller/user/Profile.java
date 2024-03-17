package neu.edu.controller.user;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import neu.edu.dao.ProfileDAO;
import neu.edu.data.UserSession;


/**
 * Servlet implementation class Profile
 */
@WebServlet(urlPatterns = {"/Profile","/profile"})
public class Profile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Profile() {
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

		request.setAttribute("username", userSession.getUsername());
		request.setAttribute("email", userSession.getEmail());
		request.setAttribute("firstName", userSession.getFirstName());
		request.setAttribute("lastName", userSession.getLastName());
		
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/user/profile.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		String basicErrorMsg = "Error: Something went wrong!! Failed to update details";
		String pwdErrorMsg = "Error: Something went wrong!! Failed to update password";
		HttpSession session = request.getSession();
		UserSession userSession = (UserSession) session.getAttribute("userSession");
		
		if("basic".equals(action)){
			String userName = request.getParameter("username");
			String email = request.getParameter("email");
			String firstName = request.getParameter("firstName");
			String lastName = request.getParameter("lastName");
			
			ProfileDAO profileDAO = new ProfileDAO();
			boolean isSuccess = profileDAO.updateBasicDetails(email, firstName, lastName, userName);
			if(isSuccess) {
				userSession.setEmail(email);
				userSession.setFirstName(firstName);
				userSession.setLastName(lastName);
				
				session.setAttribute("userSession", userSession);
			} else {
				request.setAttribute("basicErrorMsg", basicErrorMsg);
			}
			
			doGet(request, response);
        }
		
        if("password".equals(action)){
        	String password = request.getParameter("password");
        	String userName = userSession.getUsername();
        	ProfileDAO profileDAO = new ProfileDAO();
			boolean isSuccess = profileDAO.updatePasswordDetails(password, userName);
			if(isSuccess) {
				request.getSession().invalidate();
				response.sendRedirect("index.html");
			} else {
				request.setAttribute("pwdErrorMsg", pwdErrorMsg);
				doGet(request, response);
			}
			
			
        }
	}

}
