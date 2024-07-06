<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About Page</title>
<%@include file="css_js.jsp" %>

</head>
<body >
<%@include file="navbar.jsp" %>
<main style="background-image: url('img/about.jpg');background-size: cover ;margin-top: 60px ; height: 800px">
	<div class="container p-4" >
		<div class="col-md-5"style="color: #81A263">
		<h1 class="font-weight-bold"><img src="img/shop.png" style="height: 30px"> Do business in the world's busiest market, the internet.</h1>
		</div>
			<div class="card" style="color:#E5E483  ; background-color: #B7B597 ;width: 700px">
					<div class="card-body primary">
						<h4>"ShopMart is an excellent e-commerce platform for our growth. It's a world-class product at an affordable price."</h4>
						<p class="card-text">Shop anytime anywere with the best discounts and affortable prices</p>
					</div>
			</div>
		</div>
</main>
</body>
<%@include file="footer.jsp" %>

</html>