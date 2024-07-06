package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import entities.Category;
import entities.Product;

public class ProductOperationDao {

	private Connection con;

	public ProductOperationDao(Connection con) {
		super();
		this.con = con;
	}
	
	// To add category
	public boolean AddCategory(Category category)
	{
		boolean status=false;
		try {
		String query="insert into category(catTitle,catDesc)values(?,?)";
		PreparedStatement pstmt=this.con.prepareStatement(query);
		pstmt.setString(1,category.getCategoryTitle());
		pstmt.setString(2,category.getCategoryDescription());
		pstmt.executeUpdate();
		
			    status=true;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	
	// To count  total category
	public int categoryCount()
	{
		int count=0;
		try {
			String query="select count(*) from category";
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
	
	// To get All Category
	public ArrayList<Category> getAllCategory()
	{
		ArrayList<Category> list=new ArrayList<Category>();
		try {
			String query="select * from category";
			PreparedStatement pstmt=this.con.prepareStatement(query);
			ResultSet set=pstmt.executeQuery();
			while(set.next())
			{
				Integer catId=set.getInt("catId");
				String catTitle=set.getString("catTitle");
				String catDesc=set.getString("catDesc");
				Category c=new Category(catId,catTitle,catDesc);
				list.add(c);
			}		
			
		}catch (Exception e) {
			e.printStackTrace();
		}	
		return list;		
	}
	
	// To add Product
	
	public boolean AddProduct(Product product)
	{
		boolean status=false;
		try {
			String query="insert into product(pName,pDesc,pPhoto,pPrice,pDiscount,pQuantity,cId)values(?,?,?,?,?,?,?)";
			PreparedStatement pstmt=this.con.prepareStatement(query);
			pstmt.setString(1,product.getpName());
			pstmt.setString(2,product.getpDesc());
			pstmt.setString(3,product.getpPhoto());
			pstmt.setInt(4,product.getpPrice());
			pstmt.setInt(5,product.getpDiscount());
			pstmt.setInt(6,product.getpQuantity());
			pstmt.setInt(7,product.getcId());
			pstmt.executeUpdate();

			status=true;
			
			
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}	
		return status;
	}
	// To count product
	public int productCount()
	{
		int count=0;
		try {
		String query="select count(*) from product";
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
	
	// To get all products
	public ArrayList<Product>getAllProduct()
	{
		ArrayList<Product>list1=new ArrayList<Product>();
		try {
			String query="select * from product";
			PreparedStatement pstmt=this.con.prepareStatement(query);
			ResultSet set=pstmt.executeQuery();
			
			while(set.next())
			{
				Integer pId=set.getInt("pId");
				String pName=set.getString("pName");
				String pDesc=set.getString("pDesc");
				String pPhoto=set.getString("pPhoto");
				Integer pPrize=set.getInt("pPrice");
				Integer pDiscount=set.getInt("pDiscount");
				Integer pQuantity=set.getInt("pQuantity");
				Integer cId=set.getInt("cId");
				
				Product product=new Product(pId,pName,pDesc,pPhoto,pPrize,pDiscount,pQuantity,cId);
				list1.add(product);
		   }
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return list1;
	}
	// To get product by category 
	public ArrayList<Product>getAllProductById(int cId)
	{
		ArrayList<Product>list1=new ArrayList<Product>();
		try {
			String query="select * from product where cId=?";
			PreparedStatement pstmt=this.con.prepareStatement(query);
			pstmt.setInt(1, cId);
			ResultSet set=pstmt.executeQuery();
			while(set.next())
			{
				Integer pId=set.getInt("pId");
				String pName=set.getString("pName");
				String pDesc=set.getString("pDesc");
				String pPhoto=set.getString("pPhoto");
				Integer pPrize=set.getInt("pPrice");
				Integer pDiscount=set.getInt("pDiscount");
				Integer pQuantity=set.getInt("pQuantity");
				
				Product product=new Product(pId,pName,pDesc,pPhoto,pPrize,pDiscount,pQuantity,cId);
				list1.add(product);
		   }
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return list1;
	}
	
	// To get product by Product Name 

	public ArrayList<Product> getProductsByName(String pName)
	{
		ArrayList<Product>productList=new ArrayList<Product>();
		
		try {
			String query="select * from product where pName=?";
			PreparedStatement pstmt=this.con.prepareStatement(query);
			pstmt.setString(1, pName);
			ResultSet set=pstmt.executeQuery();
			
			while(set.next())
			{
				Integer pId=set.getInt("pId");
				String pDesc=set.getString("pDesc");
				String pPhoto=set.getString("pPhoto");
				Integer pPrize=set.getInt("pPrice");
				Integer pDiscount=set.getInt("pDiscount");
				Integer pQuantity=set.getInt("pQuantity");
				Integer cId=set.getInt("cId");
				
				Product product=new Product(pId,pName,pDesc,pPhoto,pPrize,pDiscount,pQuantity,cId);
				productList.add(product);
			}
		}
		catch (Exception e) {
		}
		return productList;
		
	}
	
}
