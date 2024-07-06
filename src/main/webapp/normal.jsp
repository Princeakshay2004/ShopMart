<%@page errorPage="error.jsp"%>
<%@page import="entities.User"%>
<%@page import="entities.Message"%>
<%@page import="helper.FileOperations"%>
<%@page import="helper.ConnectionProvider"%>
<%@page import="Dao.ProductOperationDao"%>
<%@page import="entities.Product"%>
<%@page import="java.util.*"%>
<%
User user = (User) session.getAttribute("CurrentUser");
if (user == null) {
	response.sendRedirect("login.jsp");
	Message msg = new Message("alert-danger", "Please provide valid username and password", "alert-danger");
	session.setAttribute("msg", msg);
	return;
} else {
	if (user.getUserType().equals("admin")) {
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
<title>Product section | ShopMart</title>
<%@ include file="css_js.jsp"%>
</head>
<style>
body::-webkit-scrollbar {
	display: none;
}
#product-card:hover{
	background-color: #e2e2e2;
	cursor: pointer;
}


</style>
<body>
	<%@include file="navbar.jsp"%>
	<%-- main body start --%>
	<main style="margin-top: 60px">
		<%-- show products --%>
		<%
		FileOperations fileop = new FileOperations();// file operation for the trimming charector
				ProductOperationDao productdao = new ProductOperationDao(ConnectionProvider.getConnection());

				String category = request.getParameter("category");

				ArrayList<Product> list1 = null;
				// To load products category wize
				 if (category == null || category.trim().equals("all")) {
					list1 = productdao.getAllProduct();
					}
				 else{
					
					int cId = Integer.parseInt(category.trim());
					list1 = productdao.getAllProductById(cId);
				}
		%>
	
		<div class="row col-md-12">
			<div class="row  mx-4 mt-4">
				<div class="row col-md-12" style="margin-left: 30px;">
					<%
					for (Product product : list1) {
					%>
					<%--product card --%>
					<div class="card mx-4 mb-4  "style="width: 18rem; background-color: #F1F1F1" id="product-card">
						<div class="card-img-top">
							<img src="img/product_img/<%=product.getpPhoto()%>"
								class="card-img"
								style="max-width: 100%; height: 15rem; object-fit: fill;">
							<a class="btn  font-weight-bold  "
								style="width: 90px; font-size: 0.8rem;  ">&#8377; <%=product.getpPrice()%> </a>
							<a class="btn text-white font-weight-bold "
								style="background-color: #C80036; width: 90px; font-size: 0.5rem">Save
								Upto <%=product.getpDiscount()%>%
							</a>
						</div>
						<div class="card-body">
							<h5 class="card-title"><%=product.getpName()%></h5>
							<p class="card-text"><%=fileop.get10Words(product.getpDesc())%><a
									href="#!">Read More</a>
							</p>
						</div>
						<hr style="margin: 0em">
						<div>
							<a class="btn  font-weight-bold "
								style="width: 105px; font-size: 1rem;color:#006989"> &#8377; <%=product.getDiscountedPrize()%></a>
								
							<a  class="btn text-white font-weight-bold m-1 " onclick="addToCart(<%=product.getpId()%>,'<%=product.getpName()%>',<%=product.getDiscountedPrize()%>,<%=user.getUserId() %>)"
								style="width: 65px; font-size: 0.7rem; background-color: #FEB941"><span><i class="fa-solid fa-cart-shopping"></i></span> Cart</a> 
								
							<a href="#!" class="btn text-white font-weight-bold m-1 "
								style="width: 47px; font-size: 0.7rem; background-color: #FF8F00">Buy</a>
								
							<a class="btn btn-outline-danger" style="font-size: 0.7rem"><span><i
									class="fa-solid fa-heart"></i></span></a>
									
						</div>
					</div>
					<%
					}
					%>
				</div>
			</div>
		</div>
		<%-- Product section end --%>
	</main>
	<%-- Main section end --%>
	
	
	<script type="text/javascript" src="js/myjs.js"></script>
	
</body>
<%@include file="footer.jsp" %>

</html>