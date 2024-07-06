<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Something went wrong!</title>
<%@include file="css_js.jsp" %>

</head>
<body >
<%@include file="navbar.jsp" %>


<main >
<div class="card-img-overlay">
<div class="col-md-7 offset-md-3 text-center" style="margin-top: 150px;  ">
<img src="img/error.png" style="height: 200px">
<h2 class="font-weight-bold">404</h2>
<h3 class="font-weight-bold" > Something went Wrong !</h3>
<a class="btn primary-background font-weight-bold text-white outline-light" href="index.jsp">Home</a>
</div>
</div>



</main>
</body>
</html>