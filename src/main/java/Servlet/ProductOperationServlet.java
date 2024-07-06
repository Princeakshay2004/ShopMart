package Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import Dao.ProductOperationDao;
import entities.Category;
import entities.Message;
import entities.Product;
import helper.ConnectionProvider;
import helper.FileOperations;

@WebServlet
@MultipartConfig
public class ProductOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public ProductOperationServlet() {
        super();

    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			PrintWriter out=response.getWriter();
		
			String Operation=request.getParameter("operation");
			if(Operation.trim().equals("addCategory"))
			{
			
				// Add category
				String Title=request.getParameter("catTitle");
				String Desc=request.getParameter("catDesc");
				
				Category category=new Category(Title,Desc);
				ProductOperationDao categoryDao  =new ProductOperationDao(ConnectionProvider.getConnection());
				HttpSession session=request.getSession();
				if(	categoryDao.AddCategory(category))
				{
					Message msg=new Message("success","category Added Successfully ","alert-success");
					session.setAttribute("categorymsg",msg);
					response.sendRedirect("admin.jsp");
				}
				else
				{	Message msg=new Message("alert","Error while adding category! ","alert-danger");
					session.setAttribute("categorymsg",msg);
					response.sendRedirect("admin.jsp");
				}
			}
			else if(Operation.trim().equals("addProduct"))
			{
				// Add Product
				
				String pName=request.getParameter("productName");
				Integer pQuantity=Integer.parseInt(request.getParameter("productQuantity"));
				Integer pPrize=Integer.parseInt(request.getParameter("productPrize"));
				Integer pDiscount=Integer.parseInt(request.getParameter("productDiscount"));
				Integer pCategory=Integer.parseInt(request.getParameter("productCategory"));
				String pDesc=request.getParameter("productDesc");
				Part part=request.getPart("productPic");

				Product product=new Product(pName,pDesc,part.getSubmittedFileName(),pPrize,pDiscount,pQuantity,pCategory);
				
				ProductOperationDao productDao=new ProductOperationDao(ConnectionProvider.getConnection());
				HttpSession session=request.getSession();
				
				
				if(productDao.AddProduct(product))
				{
					// file uploading
					String path=request.getServletContext().getRealPath("img")+File.separator+"product_img"+File.separator+part.getSubmittedFileName();
					out.print(path);
					FileOperations file=new FileOperations();
					file.saveFile(part.getInputStream(), path);
					
					
					Message msg=new Message("success","product Added Successfully ","alert-success");
					session.setAttribute("categorymsg",msg);
					response.sendRedirect("admin.jsp");
				}
				else
				{	Message msg=new Message("alert","Error while adding product! ","alert-danger");
					session.setAttribute("categorymsg",msg);
					response.sendRedirect("admin.jsp");
					
				}
			}
			
			
			
			
	}

}
