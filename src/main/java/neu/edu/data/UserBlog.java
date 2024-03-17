package neu.edu.data;



import java.time.LocalDate;
import java.util.List;

public class UserBlog {
	
	private String id;
	
	private String title;
	private String description;
	private String tag;
	private String image;
	private String userName;
	private String createdAt;
	private List<String> upVote;
	private List<String> downVote;
	
	public UserBlog() {
		
	}
	public UserBlog(String title, String description, String tag, String image, String userName, String createdAt,
			List<String> upVote, List<String> downVote) {
		super();
		this.title = title;
		this.description = description;
		this.tag = tag;
		this.image = image;
		this.userName = userName;
		this.createdAt = createdAt;
		this.upVote = upVote;
		this.downVote = downVote;
	}
	
	
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}
	public List<String> getUpVote() {
		return upVote;
	}
	public void setUpVote(List<String> upVote) {
		this.upVote = upVote;
	}
	public List<String> getDownVote() {
		return downVote;
	}
	public void setDownVote(List<String> downVote) {
		this.downVote = downVote;
	}
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}

}
