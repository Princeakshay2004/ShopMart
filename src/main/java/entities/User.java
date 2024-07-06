package entities;

public class User {
	
	private int userId;
	private String userFName;
	private String userLName;
	private String userEmail;
	private String userPassword;
	private String userPhone;
	private String userPic;
	private String userAddress;
	private String userCity;
	private String userState;
	private int userZip;
	private String userType;

	// Constructor
	public User(int userId, String userFName, String userLName, String userEmail, String userPassword, String userPhone,
			String userPic, String userAddress, String userCity, String userState, int userZip) {
		super();
		this.userId = userId;
		this.userFName = userFName;
		this.userLName = userLName;
		this.userEmail = userEmail;
		this.userPassword = userPassword;
		this.userPhone = userPhone;
		this.userPic = userPic;
		this.userAddress = userAddress;
		this.userCity = userCity;
		this.userState = userState;
		this.userZip = userZip;
	}
	public User(String userFName, String userLName, String userEmail, String userPassword, String userPhone,String userPic, String userAddress, String userCity, String userState, int userZip) {
		super();
		this.userFName = userFName;
		this.userLName = userLName;
		this.userEmail = userEmail;
		this.userPassword = userPassword;
		this.userPhone = userPhone;
		this.userPic = userPic;
		this.userAddress = userAddress;
		this.userCity = userCity;
		this.userState = userState;
		this.userZip = userZip;
	}
	public User() {

	}
	// Gettors and settors
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUserFName() {
		return userFName;
	}
	public void setUserFName(String userFName) {
		this.userFName = userFName;
	}
	public String getUserLName() {
		return userLName;
	}
	public void setUserLName(String userLName) {
		this.userLName = userLName;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserPic() {
		return userPic;
	}
	public void setUserPic(String userPic) {
		this.userPic = userPic;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	public String getUserCity() {
		return userCity;
	}
	public void setUserCity(String userCity) {
		this.userCity = userCity;
	}
	public String getUserState() {
		return userState;
	}
	public void setUserState(String userState) {
		this.userState = userState;
	}
	public int getUserZip() {
		return userZip;
	}
	public void setUserZip(int userZip) {
		this.userZip = userZip;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	

}
