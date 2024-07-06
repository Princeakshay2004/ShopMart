package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import entities.Cart;

public class CartOperation {
	
	private Connection con;

	public CartOperation(Connection con) {
		super();
		this.con = con;
	}
	
	// To add product to cart

	public boolean addProductToCart(Cart cart)
	{
		boolean status=false;
		
		try {
			
			String query="insert into cart(product_id,productName,productQuantity,pPrice,uId)values(?,?,?,?,?) ";
			PreparedStatement pstmt=this.con.prepareStatement(query);
			pstmt.setInt(1,cart.getPid());
			pstmt.setString(2,cart.getPname());
			pstmt.setInt(3,cart.getpQuantity());
			pstmt.setInt(4,cart.getPprice());
			pstmt.setInt(5,cart.getUid());
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
