package neu.edu.filter;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import neu.edu.data.UserSession;
/**
 * Servlet Filter implementation class ControllerFilter
 */
@WebFilter(urlPatterns = {"/controller","/login","/registration",
		"/userDashboard","/profile","/createBlog","/blogs","/blogView","/blogEdit",
		"/adminDashboard","/users","/userAndBlogView","/createUser"})
public class FrontControllerFilter extends HttpFilter implements Filter {
       
    /**
     * @see HttpFilter#HttpFilter()
     */
    public FrontControllerFilter() {
        super();
        // TODO Auto-generated constructor stub
    }
    /**
     * @see Filter#destroy()
     */
    public void destroy() {
        // TODO Auto-generated method stub
    }
    /**
     * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
     */
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
            HttpServletRequest req = (HttpServletRequest) request;
            HttpServletResponse res = (HttpServletResponse) response;
            
            HttpSession session = req.getSession();
            UserSession userSession = (UserSession) session.getAttribute("userSession");
            String url = ((HttpServletRequest)request).getRequestURL().toString();
            String queryString = ((HttpServletRequest)request).getQueryString();
            if((url.contains("login") || url.contains("registration")) && userSession == null) {
            	 chain.doFilter(request, response);
            }
            else if(userSession == null) {
                // Redirect to login
                res.sendRedirect(req.getContextPath() + "/login");
            } else {

            	 if(url.contains("login") || url.contains("registration")) {
            		 if(userSession.getCurrentPage().equals("adminDashboard")) {
            			 res.sendRedirect(req.getContextPath() + "/adminDashboard");
            		 } else {
            			 res.sendRedirect(req.getContextPath() + "/userDashboard");
            		 }
            	 } else {
            		//Continue to Servlet
                     chain.doFilter(request, response);
            	 }
                
            }
    }
    /**
     * @see Filter#init(FilterConfig)
     */
    public void init(FilterConfig fConfig) throws ServletException {
        // TODO Auto-generated method stub
    }
}