<%@page import="helper.ConnectionProvider"%>
<%@page import="Dao.ProductOperationDao"%>
<%@page import="Dao.UserDao"%>
<%@page import="entities.Message"%>
<%@page import="entities.User"%>
<%@page errorPage="error.jsp" %>

<% 
	ProductOperationDao category=new ProductOperationDao(ConnectionProvider.getConnection());
	UserDao userdao=new UserDao(ConnectionProvider.getConnection());
%>

<%
User user = (User) session.getAttribute("CurrentUser");
if (user == null) {
	response.sendRedirect("login.jsp");
	Message msg = new Message("alert-danger", "Please provide valid username and password", "alert-danger");
	session.setAttribute("msg", msg);
	return;
} else {
	if (user.getUserType().equals("normal")) {
		response.sendRedirect("login.jsp");
		Message msg = new Message("alert-danger", "You have restricted to access this page!", "alert-danger");
		session.setAttribute("msg", msg);
		return;
	}
}
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>
<%@ include file="css_js.jsp"%>
</head>
<style>	
.card-body:hover{
	background-color: #e2e2e2;
	cursor: pointer;		
}
.card-body{
background-color: #FDFFE2;
}


</style>
<body>
<%-- navbar  --%>
<%@include file="navbar.jsp"%>
<%-- navbar End  --%>
	
	<main style="margin-top: 100px">
		
		<div class="container">
		<%
			Message m=(Message)session.getAttribute("categorymsg");
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
				session.removeAttribute("categorymsg");
			}
			%>
			<div class="row">
				<div class="col-md-4">
					<div class="card ">
						<div class="card-body text-center " style="background-color: #FDFFE2">
							<div class="container">
								<img style="max-width: 125px" class="img-fluid"src="img/team.png">
							</div>
							<h3 class="text-uppercase text-muted">Users</h3>
							<h4><%=userdao.CountUsers() %></h4>
							
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card">
						<div class="card-body text-center" style="background-color: #FDFFE2">
							<div class="container">
								<img style="max-width: 125px" class="img-fluid "src="img/list.png">
							</div>
							<h3 class="text-uppercase text-muted">Category</h3>
							<h4><%= category.categoryCount()%></h4>			
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card">
						<div class="card-body text-center" style="background-color: #FDFFE2">
							<div class="container">
								<img style="max-width: 125px" class="img-fluid "src="img/products.png">
							</div>
							<h3 class="text-uppercase text-muted">Products</h3>
							<h4><%=category.productCount()%></h4>
						</div>
					</div>
				</div>
			</div>
		<div class="row mt-4">
				<div class="col-md-6">
					<div class="card " >
						<div class="card-body text-center add-category" data-toggle="modal" data-target="#add-category-modal" 	>
							<div class="container">
								<img style="max-width: 125px" class="img-fluid"src="img/plus.png">
							</div>
							<p class="mt-2">click here to add category</p>
							<h3 class="text-uppercase text-muted">Add Category</h3>
							<h4><%= category.categoryCount()%></h4>							
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="card">
						<div class="card-body text-center"  data-toggle="modal" data-target="#add-product-modal">
							<div class="container">
								<img style="max-width: 125px" class="img-fluid "src="img/shopping-cart.png">
							</div>
							<p class="mt-2">click here to add category</p>					
							<h3 class="text-uppercase text-muted">Add Product</h3>
							<h4><%=category.productCount()%></h4>			
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<%-- Add category Modal --%>		
		<!-- Modal -->
		<div class="modal fade" id="add-category-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog ">
		    <div class="modal-content">
		      <div class="modal-header text-white primary-background">
		        <h5 class="modal-title" id="exampleModalLabel">Fill Category Details</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		       	<form action="ProductOperationServlet" method="post">
		       		  <input type="hidden"  name="operation" value="addCategory" >
		       		  <div class="form-group">
					    <label for="title">Category Title</label>
					    <input name="catTitle" required="required" type="text" class="form-control" id="categoryTitle" aria-describedby="emailHelp" placeholder="Enter category Title">
					  </div>
					  <div class="form-group">
					    <label for="text">Category Description</label>
					    <textarea rows="5" name="catDesc" required="required" class="form-control" id="categoryDescription"placeholder="Enter category Description"></textarea>
					  </div>
					  <hr>
		       			<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		        		<button type="submit" class="btn primary-background text-white">Add Category</button>
		       	</form>
		      </div>     
		    </div>
		  </div>
		</div>
		<%-- End add category Modal --%>		
		
		<%-- Add product Modal --%>		
		<!-- Modal -->
		<div class="modal fade" id="add-product-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header text-white primary-background">
		        <h5 class="modal-title" id="exampleModalLabel">Fill Category Details</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		       	<form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
		       		 <input type="hidden"  name="operation" value="addProduct" >
		       		  <div class="form-row">		       		
		       		  <div class="form-group col-md-6">
					    <label for="title">Product Name</label>
					    <input name="productName" type="text" class="form-control" id="productName" aria-describedby="emailHelp" placeholder="Enter Product Name">
					  </div>
					   <div class="form-group col-md-6">
					    <label for="title">Product Quantity</label>
					    <input name="productQuantity" type="number" class="form-control" id="categoryTitle" aria-describedby="emailHelp" placeholder="Enter Product Quantity">
					  </div>
					  </div>
					  <div class="form-row">
					  <div class="form-group col-md-6">
					    <label for="title">Product Prize</label>
					    <input name="productPrize" type="text" class="form-control" id="categoryTitle" aria-describedby="emailHelp" placeholder="Enter Product Prize">
					  </div>
					  <div class="form-group col-md-6">
					    <label for="title">Product Discount</label>
					    <input name="productDiscount" type="text" class="form-control" id="categoryTitle" aria-describedby="emailHelp" placeholder="Enter Product Discount">
					  </div>
					  </div>
					   <div class="form-row">
					  <div class="form-group col-md-6">
					    <label for="title">Product Pic</label>
					    <input name="productPic" type="file" class="form-control" id="categoryTitle" aria-describedby="emailHelp" placeholder="Upload Product Pic">
					  </div>
					  <div class="form-group col-md-6">
				    	<label for="title">Product Category</label>
						<select name="productCategory" class="form-control">
							<% 
		        			   ArrayList <Category>list1=category.getAllCategory();
					           for(Category cc:list1)
					           {
					        %>
					        <option value="<%= cc.getCategoryId()%>"><%=cc.getCategoryTitle() %></option>
							 <%
					          }
					          %>
						</select>					  
						</div>	
					  </div>
					  <div class="form-group">
					    <label for="text">Product Description</label>
					    <textarea rows="5" name="productDesc" class="form-control" id="categoryDescription"placeholder="Enter Product Description"></textarea>
					  </div>		  
					  <hr>
		       			<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		        		<button type="submit" class="btn primary-background text-white">Add Product</button>
		       	</form>
		      </div>     
		    </div>
		  </div>
		</div>
		<%-- End add product Modal --%>			
			
	</main>
</body>

</html>























