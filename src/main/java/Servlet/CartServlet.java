package Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import Dao.CartOperation;
import Dao.ProductOperationDao;
import entities.Cart;
import helper.ConnectionProvider;

@WebServlet
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public CartServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String Operation=request.getParameter("operation");
		int pId=Integer.parseInt(request.getParameter("pid"));
		int uid=Integer.parseInt(request.getParameter("uid"));
		int pprice=Integer.parseInt(request.getParameter("pprice"));
		String pname=request.getParameter("pname");
		
		Cart cart=new Cart(pId,pname,23,pprice,uid);
		CartOperation co=new CartOperation(ConnectionProvider.getConnection());
		if(Operation.equals("cart"))
		{
			co.addProductToCart(cart);
		}
			
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
