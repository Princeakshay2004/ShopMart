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


public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public EditServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException,NumberFormatException{
	
		PrintWriter out=response.getWriter();
		
		String Fname=request.getParameter("user_fname");
		String Lname=request.getParameter("user_lname");
		String Email=request.getParameter("user_email");
		String Phone=request.getParameter("user_mobile");
		String Password=request.getParameter("user_password");
		String Address=request.getParameter("user_address");
		String City=request.getParameter("user_city");
		String State=request.getParameter("user_state");
		Integer Zip=Integer.parseInt(request.getParameter("user_zip"));
		
		
		// getting user from session
		HttpSession session=request.getSession();
		User user=(User)request.getAttribute("CurrentUser");
		user.setUserFName(Fname);
		user.setUserLName(Lname);
		user.setUserEmail(Email);
		user.setUserPhone(Phone);
		user.setUserPassword(Password);
		user.setUserAddress(Address);
		user.setUserCity(City);
		user.setUserState(State);
		user.setUserZip(Zip);
		
		UserDao userdao=new UserDao(ConnectionProvider.getConnection());
		
		if(userdao.updateUser(user)) {
			if (user.getUserType().equals("admin"))
			{
				Message msg=new Message("Profile Details Updated Successfully","success","alert-success");
				session.setAttribute("updateMsg", msg);
				response.sendRedirect("admin.jsp");
			}
			else if(user.getUserType().equals("normal"))
			{
				Message msg=new Message("Profile Details Updated Successfully","success","alert-success");
				session.setAttribute("updateMsg", msg);
				response.sendRedirect("normal.jsp");
			}	
		}
		else
		{
			Message msg=new Message("Profile Details Not Updated!","erroe","alert-danger");
			session.setAttribute("msg", msg);
			response.sendRedirect("index.jsp");
		}
	
	}

}
