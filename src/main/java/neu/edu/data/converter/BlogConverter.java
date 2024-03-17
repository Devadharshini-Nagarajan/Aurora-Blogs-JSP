package neu.edu.data.converter;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.bson.Document;

import org.bson.types.ObjectId;
import neu.edu.data.UserBlog;


public class BlogConverter {

	public static Document toDocument(UserBlog userBlog) {

		Document doc = new Document("title",userBlog.getTitle())
				.append("description", userBlog.getDescription())
				.append("tag", userBlog.getTag())
				.append("image", userBlog.getImage())
				.append("userName", userBlog.getUserName())
				.append("createdAt", userBlog.getCreatedAt())
				.append("upVote", userBlog.getUpVote())
				.append("downVote", userBlog.getDownVote());

		if (userBlog.getId() != null) {
			doc.append("_id", new ObjectId(userBlog.getId()));
		}
		return doc;
	}
	
	
	public static UserBlog toBlog(Document doc) {

		UserBlog userBlog = new UserBlog();
		
		
		userBlog.setId(((ObjectId) doc.get("_id")).toString());
		userBlog.setTitle((String) doc.get("title",""));
		userBlog.setDescription((String) doc.get("description",""));
		userBlog.setTag((String) doc.get("tag",""));
		userBlog.setImage((String) doc.get("image",""));
		userBlog.setUserName((String) doc.get("userName",""));
		userBlog.setCreatedAt((String) doc.get("createdAt",""));
		userBlog.setUpVote((List<String>) doc.get("upVote"));
		userBlog.setDownVote((List<String>) doc.get("downVote", new ArrayList<String>()));
		
		System.out.println("");
		System.out.println("");


		return userBlog;
	}
}
