package neu.edu.dao;

import java.sql.PreparedStatement;


import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.bson.Document;
import org.bson.types.ObjectId;

import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.model.Filters;

import neu.edu.data.UserBlog;
import neu.edu.data.converter.BlogConverter;
import neu.edu.database.DatabaseConnector;
import static com.mongodb.client.model.Filters.*;


public class BlogDAO {
	
	private MongoCollection<Document> mongoCollectionBlogs;
	
	public BlogDAO(MongoClient mongo) {
		this.mongoCollectionBlogs = mongo.getDatabase("miniblog").getCollection("blogs");
	}
	
	
	public UserBlog createBlog(UserBlog userBlog) {
		Document blogDoc = BlogConverter.toDocument(userBlog);
		this.mongoCollectionBlogs.insertOne(blogDoc);
		
		ObjectId id = (ObjectId) blogDoc.get("_id");
		userBlog.setId(id.toString());
	    return userBlog;
	}
	
	public void update(UserBlog userBlog) {
		System.out.println("update");
		System.out.println(userBlog.getUpVote());
		System.out.println(BlogConverter.toDocument(userBlog));
        this.mongoCollectionBlogs.updateOne(Filters.eq("_id", new ObjectId(userBlog.getId())), new Document("$set", BlogConverter.toDocument(userBlog)));
    }
	
	 public void delete(String id) {
	        this.mongoCollectionBlogs.deleteOne(Filters.eq("_id", new ObjectId(id)));
	 }
	
	public List<UserBlog> getList() {
        List<UserBlog> blogs = new ArrayList<UserBlog>();
        MongoCursor<Document>  cursor = mongoCollectionBlogs.find().iterator();
        try {
            while (cursor.hasNext()) {
                Document doc = cursor.next();
                UserBlog UserBlog = BlogConverter.toBlog(doc);
                blogs.add(UserBlog);
            }
        } finally {
            cursor.close();
        }
        return blogs;
    }
	
	public List<UserBlog> searchList(String search) {
        List<UserBlog> blogs = new ArrayList<UserBlog>();
        FindIterable<Document>  findIterable = mongoCollectionBlogs.find(Filters.text(search));
        MongoCursor<Document> cursor = findIterable.iterator();
        try {
            while (cursor.hasNext()) {
                Document doc = cursor.next();
                UserBlog UserBlog = BlogConverter.toBlog(doc);
                blogs.add(UserBlog);
            }
        } finally {
            cursor.close();
        }
        return blogs;
    }
	
	public UserBlog getBlog(String id) {
        Document doc = this.mongoCollectionBlogs.find(Filters.eq("_id", new ObjectId(id))).first();
        return BlogConverter.toBlog(doc);
    }
}
