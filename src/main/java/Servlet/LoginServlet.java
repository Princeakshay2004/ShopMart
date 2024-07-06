package Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import Dao.UserDao;
import entities.Message;
import entities.User;
import helper.ConnectionProvider;

@WebServlet
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public LoginServlet() {
        super();

    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		//Authenticating user
		
		UserDao userdao=new UserDao(ConnectionProvider.getConnection());
		User user=userdao.getUserByEmailAndPassword(email, password);
		HttpSession session=request.getSession();
		if(user==null) {
			Message msg= new Message("error","Invalid Details ! try with another ","alert-danger");
			session.setAttribute("msg",msg);
			response.sendRedirect("login.jsp");

		}
		
		else {
			session.setAttribute("CurrentUser",user);
			if(user.getUserType().equals("admin"))
			{
				response.sendRedirect("admin.jsp");
			}
			else
			{
				response.sendRedirect("normal.jsp");
			}
			
		}
	
	}

}
