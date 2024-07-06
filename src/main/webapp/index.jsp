<%@page import="java.sql.Connection"%>
<%@page import="entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="helper.ConnectionProvider"%>
<%@page import="Dao.ProductOperationDao"%>
<%
User user = (User) session.getAttribute("CurrentUser");
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>shopmart-Home</title>
<%@include file="css_js.jsp"%>
</head>
<style>
body::-webkit-scrollbar {
	display: none;
}
</style>
<body>
<%@include file="navbar.jsp"%>

	<main style="background-color: #6DC5D1">
		<div class=" bg-dark text-white " >
			<img src="img/homepage-cover.jpg" class="object-fit-cover card-img "
				style="margin-top: 50px; border-radius: 0%">
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
			<div class="card-img-overlay row-4">
				<div class="h-100 d-flex align-items-center justify-content-end mx-5">					
						<div class="card" style="color:#E5E483  ; background-color: #6DC5D1">
							<div class="card-header "><img src="img/shop.png" style="height: 20px">   <b>ShopMart</b></div>
							<div class="card-body primary">
								<h5 class="card-title">Welcome to ShopMart</h5>
								<p class="card-text">Shop anytime anywere with the best discounts and affortable prices</p>
								
							<%
								if(user==null)
								{
							%>
								<a href="login.jsp" class="btn " style="background-color: #F1F5A8">shop now!</a>
							<%		
								}else{
									if(user.getUserType().equals("normal"))
									{
									%>
									<a href="normal.jsp" class="btn " style="background-color: #F1F5A8">shop now!</a>							
									<%
								}else if(user.getUserType().equals("admin"))
								{
									%>
									<a href="admin.jsp" class="btn " style="background-color: #F1F5A8">Manage Products</a>							
									<% 
								}
								}
							%>
								
							</div>
					</div>
				</div>
			</div>
		
		</div>
		
		
		

	</main>
</body>
<%@include file="footer.jsp" %>

</html>