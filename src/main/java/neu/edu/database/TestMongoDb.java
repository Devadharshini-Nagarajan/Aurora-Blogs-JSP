package neu.edu.database;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.bson.Document;

import com.mongodb.MongoClient;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.model.Filters;


import javax.servlet.ServletContext;

/**
 * Servlet implementation class TestMongoDb
 */
@WebServlet("/TestMongoDb")
public class TestMongoDb extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestMongoDb() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name = "";
		ServletContext application = request.getServletContext();
		MongoClient mongoClient = (MongoClient) application.getAttribute("mongodbClient");
		
		MongoCollection<Document> mongoCollectionUsers = mongoClient.getDatabase("miniblog").getCollection("users");
		MongoCursor<Document>  cursor = mongoCollectionUsers.find().iterator();
	        try {
	            while (cursor.hasNext()) {
	                Document doc = cursor.next();
	                name = doc.get("name","0");
	                System.out.println(doc.get("name","0"));
	            }
	        } finally {
	            cursor.close();
	        }
	        
	        
	        response.getWriter().append(name).append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
