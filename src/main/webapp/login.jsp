
<%@page import="entities.Message" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<%@include file="css_js.jsp" %>

</head>
<body>
<%@include file="navbar.jsp" %>

<main>
<img src="img/cool-background.png" class="object-fit-cover card-img " style="margin-top: 50px; position: fixed;">
<div class="card-img-overlay">
<div class="container" style="margin-top: 150px">
	
	<div class="row">
		<div class="col-md-7 offset-md-3">
			<div class="card">
			<div class="card-header primary-background text-white text-center">
			<h4>Login Here</h4>
			</div>
			<%
			Message m=(Message)session.getAttribute("msg");
			if(m!=null)
			{
			%>		
			<div class="alert <%=m.getCssClass() %> alert-dismissible fade show" role="alert">
			  <strong><%=m.getContent()%></strong> 
			  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
			    <span aria-hidden="true">&times;</span>
			  </button>
			</div>
				
			<% 
				session.removeAttribute("msg");
			}
			%>
			
			<div class="card-body">
			<form action="LoginServlet" method="post">
		  <div class="form-group">
		    <label for="email">Email</label>
		    <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
		  </div>
		  <div class="form-group">
		    <label for="password">Password</label>
		    <input type="password" name="password" class="form-control" id="exampleInputPassword1"placeholder="Enter password">
		  </div>
		  <a href="register.jsp" class="text-center d-block mb-3">If you are not Registered?</a>
		  <div class="text-center">
		  <button type="submit" class="btn btn-info mx-2">Submit</button>
		  <button type="reset" class="btn btn-secondary mx-2">Reset</button>
		  
		</div>
		  
		  
		</form>
		</div>	
		</div>
		</div>
	</div>
</div>
</div>
</main>

</body>
</html>
