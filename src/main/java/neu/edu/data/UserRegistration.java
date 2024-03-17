package neu.edu.data;

public class UserRegistration {
	private String username;
	private String password;
	private String email;
	private Role role;
	private String firstName;
	private String lastName;

	public enum Role {

		ADMIN("admin"), USER("user");

		private final String roleName;

		// private enum constructor
		private Role(String roleName) {
			this.roleName = roleName;
		}
		
		public String getRoleName() {
			return roleName;
		}

	}

	public UserRegistration() {
		// TODO Auto-generated constructor stub
	}

	public UserRegistration(String username, String password, String email, String firstName, String lastName) {
		super();
		this.username = username;
		this.password = password;
		this.email = email;
		this.firstName = firstName;
		this.lastName = lastName;
	}

	public UserRegistration(String username, String email, String role) {

		this.username = username;
		this.email = email;
		if("admin".equalsIgnoreCase(role)) {
			this.role = Role.ADMIN;
		}else if("user".equalsIgnoreCase(role)) {
			this.role = Role.USER;
		}
		
	}
	
	public UserRegistration(String role) {
		if("admin".equalsIgnoreCase(role)) {
			this.role = Role.ADMIN;
		}else if("user".equalsIgnoreCase(role)) {
			this.role = Role.USER;
		}
	}

	public String getUsername() {
		return username;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Role getRole() {
		return role;
	}
	
	public String getRoleString() {
		return role.toString();
	}
}
