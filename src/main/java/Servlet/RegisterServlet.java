package Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import Dao.UserDao;
import entities.Message;
import entities.User;
import helper.ConnectionProvider;



@WebServlet
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public RegisterServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {

			String userFname=request.getParameter("user_fname");
			String userLname=request.getParameter("user_lname");
			String userEmail=request.getParameter("user_email");
			String userPassword=request.getParameter("user_password");
			String userMobile=request.getParameter("user_mobile");
			String userAddress=request.getParameter("user_address");
			String userCity=request.getParameter("user_city");
			String userState=request.getParameter("user_state");
			Integer userZip=Integer.parseInt(request.getParameter("user_zip"));

			// Creating user Object

			User user=new User(userFname,userLname,userEmail,userPassword,userMobile,"akshay",userAddress,userCity,userState,userZip);
			
			// adding data into database
			UserDao userdao=new UserDao(ConnectionProvider.getConnection());
				HttpSession session=request.getSession();
				if(userdao.saveUser(user))
				{
					response.sendRedirect("login.jsp");

				}
				else {
					Message msg=new Message("alert-danger","Please Provide valid Details!","alert-danger");
					session.setAttribute("regmsg",msg);
					response.sendRedirect("register.jsp");
				}
		}
		catch (Exception e) {
			e.printStackTrace();
		}

	
	}

}
