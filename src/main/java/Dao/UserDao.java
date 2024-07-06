package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import entities.User;

public class UserDao {

	private Connection con;

	public UserDao(Connection con) {
		super();
		this.con = con;
	}
	
	// to register user
	public boolean saveUser(User user)
	{
		boolean status=false;
		try {
			String query="insert into user(userFname,userLname,userEmail,userPassword,userPhone,userPic,userAddress,userCity,userState,userZip)values(?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pstmt=this.con.prepareStatement(query);
			pstmt.setString(1, user.getUserFName());
			pstmt.setString(2,user.getUserLName() );
			pstmt.setString(3,user.getUserEmail() );
			pstmt.setString(4,user.getUserPassword() );
			pstmt.setString(5,user.getUserPhone() );
			pstmt.setString(6,user.getUserPic() );
			pstmt.setString(7,user.getUserAddress() );
			pstmt.setString(8,user.getUserCity() );
			pstmt.setString(9,user.getUserState() );
			pstmt.setInt(10, user.getUserZip());

			pstmt.executeUpdate();
			
			status=true;	
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	
		return status;
		
	}
	
	// to login user 
	
	public User getUserByEmailAndPassword(String email,String password)
	{
			User user=null;
		try {
			String query="select * from user where userEmail=? and userPassword=?";
			PreparedStatement pstmt=this.con.prepareStatement(query);
			pstmt.setString(1,email);
			pstmt.setString(2,password);
			ResultSet set=pstmt.executeQuery();
			
			
			if(set.next())
			{
				user=new User();
				user.setUserId(set.getInt("userId"));
				user.setUserFName(set.getString("userFname"));
				user.setUserLName(set.getString("userLname"));
				user.setUserEmail(set.getString("userEmail"));
				user.setUserPassword(set.getString("userPassword"));
				user.setUserPhone(set.getString("userPhone"));
				user.setUserAddress(set.getString("userAddress"));
				user.setUserCity(set.getString("userCity"));
				user.setUserState(set.getString("userState"));
				user.setUserZip(set.getInt("userZip"));
				user.setUserType(set.getString("userType"));
				
			}

		}
		catch (Exception e) {
			e.printStackTrace();		
		}	
		return user;
	}
	
	// To count all Users
	public int CountUsers()
	{
		int count=0;
		try {
			String query="select count(*) from user where userType='normal'";
			PreparedStatement pstmt=this.con.prepareStatement(query);
			ResultSet set=pstmt.executeQuery();
			
			if(set.next())
			{
				count=set.getInt("count(*)");
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		return count;
	}
	
	// To update User
	public boolean updateUser(User user)
	{
		boolean status=false;
		try {
			String query="update user set userFname=?,userLname=?,userEmail=?,userPassword=?,userPhone=?,userAddress=?,userCity=?,userState=?,userZip=? where UserId=?";
			PreparedStatement pstmt=this.con.prepareStatement(query);
			pstmt.setString(1, user.getUserFName());
			pstmt.setString(2, user.getUserLName());
			pstmt.setString(3, user.getUserEmail());
			pstmt.setString(4, user.getUserPassword());
			pstmt.setString(5, user.getUserPhone());
			pstmt.setString(6, user.getUserAddress());
			pstmt.setString(7, user.getUserCity());
			pstmt.setString(8, user.getUserState());
			pstmt.setInt(9, user.getUserZip());
			pstmt.executeUpdate();
			
			status=true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return status;
	}
	
	
}
