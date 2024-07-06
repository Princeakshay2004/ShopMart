<%@page import="entities.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="helper.ConnectionProvider"%>
<%@page import="Dao.ProductOperationDao"%>
<%@page import="entities.Category"%>
<%@page import="entities.Message"%>
<%@page import="entities.User"%>
<%
User user2 = (User) session.getAttribute("CurrentUser");
%>

<nav class="navbar navbar-expand-lg navbar-dark primary-background fixed-top mb-5">
	<a class="navbar-brand font-weight-bold" href="index.jsp"><span><img
			src="img/shop.png" style="height: 20px"></span> ShopMart</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse " id="navbarSupportedContent">
		<ul class="navbar-nav col-2">
			<li class="nav-item active"><a class="nav-link" href="about.jsp"><i class="fa-solid fa-location-dot"></i> About
					<span class="sr-only">(current)</span>
			</a></li>


			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" role="button"
				data-toggle="dropdown" aria-expanded="false"><i class="fa-solid fa-list"></i> Categories </a>
				<div class="dropdown-menu col-md-1">
					<a class="dropdown-item text-white " href="normal.jsp?category=all"
						style="background-color: #4D869C;">All Products</a>

					<%
					ProductOperationDao categorydao = new ProductOperationDao(ConnectionProvider.getConnection());
					ArrayList<Category> list = categorydao.getAllCategory();
					for (Category cc : list) {
					%>
					<a class="dropdown-item" href="normal.jsp?category=<%=cc.getCategoryId()%>"><%=cc.getCategoryTitle()%></a>
					<%
					}
					%>


				</div></li>
		</ul>
		<form class="form-inline col-5 my-1 my-1g-0">
			<input class="form-control col-10  mr-sm-2" type="search" name="search-item" 
				placeholder="Search for Products,Brands More" aria-label="Search">
			<button class="btn btn-outline-light "  type="submit" >Search</button>
		</form>
		
			<%
			if (user2 == null) {
			%>
			<ul class="navbar-nav ml-auto form-inline mx-4">
			<li class="nav-item active"><a class="nav-link" href="login.jsp"><span><i
						class="fa-solid fa-user"></i></span> Login</a></li>
			<li class="nav-item active"><a class="nav-link mx-3"
				href="register.jsp"><span><i
						class="fa-solid fa-user-plus"></i></span>Register</a></li>
			</ul>
			<%
			} else {
			%>
			<ul class="navbar-nav col-5 form-inline mx-4">
			<li class="nav-item active"><a class="nav-link mx-1.5" href="#!"><span><i
						class="fa-solid fa-bell"></i></span>Notification</a></li>
			<li class="nav-item active"><a class="nav-link mx-1.5" href="#!"data-toggle="modal" data-target="#wishlist-modal"><span><i
						class="fa-solid fa-heart"></i></span> WishList</a></li>
			<li class="nav-item active"><a class="nav-link mx-1.5" href="#!" data-toggle="modal" data-target="#cart-modal">
					<span><i class="fa-solid fa-cart-shopping"></i></span><span class="cart-items"></span> Cart
			</a></li>
			<li class="nav-item active"><a class="nav-link mx-1.5" href="#!"
				data-toggle="modal" data-target="#profile-modal"><span><i
						class="fa-solid fa-user"></i></span> <%=user2.getUserFName() + user2.getUserLName()%></a>
			</li>
			<li class="nav-item active"><a class="nav-link mx-1.5"
				href="LogoutServlet"><span><i
						class="fa-solid fa-right-from-bracket"></i></span> Logout</a></li>
			<%
			}
			%>
		</ul>

	</div>
</nav>


<%
if (user2 != null) {
%>
<%-- Modals --%>
<%-- Profile Modal --%>
<div class="modal fade mt-4" id="profile-modal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog ">
		<div class="modal-content">
			<div class="modal-header text-white primary-background text-center">
				<h5 class="modal-title mx-5 " id="exampleModalLabel">
					<span><img src="img/shop.png" style="height: 20px"></span>ShopMart
				</h5>
			</div>
			<div class="modal-body">
				<div class="container text-center">
					<img src="img/profile_pic.png"
						style="max-width: 130px; border-radius: 50%">
					<h5 class="modal-title font-weight-bold"><%=user2.getUserFName() + " " + user2.getUserLName()%></h5>
					<br>
					<%-- Profile Details --%>
					<div id="profile-details">
						<table class="table">
							<tbody>
								<tr>
									<th scope="row">ID :</th>
									<td><%=user2.getUserId()%></td>

								</tr>
								<tr>
									<th scope="row">Email :</th>
									<td><%=user2.getUserEmail()%></td>
								</tr>
								<tr>
									<th scope="row">Type:</th>
									<td><%=user2.getUserType()%></td>
								</tr>
								<tr>
									<th scope="row">Mobile No:</th>
									<td><%=user2.getUserPhone()%></td>
								</tr>
								<tr>
									<th scope="row">Address:</th>
									<td><%=user2.getUserAddress()%>,<%=user2.getUserCity()%>,<%=user2.getUserState()%>-<%=user2.getUserZip()%>
									</td>


								</tr>

							</tbody>
						</table>
					</div>
					<%-- edit profile modal --%>
					<div id="profile-edit" style="display: none">
						<h4>Please Edit Carefully</h4>
						<form action="EditServlet" method="post"
							enctype="multipart/form-data">
							<table class="table">
								<tbody>
									<tr>
										<th scope="row">ID :</th>
										<td><%=user2.getUserId()%></td>

									</tr>
									<tr>
										<th scope="row">Name :</th>
										<td><input type="text" class="form-control"
											name="user_fname" value="<%=user2.getUserFName()%>"></td>
										<td><input type="text" class="form-control"
											name="user_lname" value="<%=user2.getUserLName()%>"></td>
									</tr>
									<tr>
										<th scope="row">Email :</th>
										<td><input type="text" class="form-control col-md-15"
											name="user_email" value="<%=user2.getUserEmail()%>"></td>
									</tr>
									<tr>
										<th scope="row">Mobile :</th>
										<td><input type="text" class="form-control"
											name="user_mobile" value="<%=user2.getUserPhone()%>"></td>
									</tr>
									<tr>
										<th scope="row">Password :</th>
										<td><input type="password" class="form-control"
											name="user_password" value="<%=user2.getUserPassword()%>"></td>
									</tr>
									<tr>
										<th scope="row">Address :</th>
										<td><input type="text" class="form-control"
											name="user_address" value="<%=user2.getUserAddress()%>"></td>
									</tr>
									<tr>
										<th scope="row">City :</th>
										<td><input type="text" class="form-control"
											name="user_city" value="<%=user2.getUserCity()%>"></td>
									</tr>
									<tr>
										<th scope="row">State :</th>
										<td><input type="text" class="form-control"
											name="user_state" value="<%=user2.getUserState()%>"></td>
									</tr>
									<tr>
										<th scope="row">Zip:</th>
										<td><input type="number" class="form-control"
											name="user_zip" value="<%=user2.getUserZip()%>"></td>
									</tr>

								</tbody>
							</table>

							<div class="modal-footer">
								<button id="back-profile-button" type="button"
									class="btn btn-primary">Back</button>
								<button id="save-profile-button" type="submit"
									class="btn btn-primary">Save</button>
							</div>
						</form>


					</div>
				</div>
			</div>
			<div class="modal-footer" id="modal-footer">
				<button id="close-profile-button" type="button"
					class="btn btn-secondary" data-dismiss="modal">Close</button>
				<button id="edit-profile-button" type="button"
					class="btn btn-primary">Edit</button>
			</div>
		</div>
	</div>
</div>
<%-- End Profile Modal --%>
<%-- Cart Modal --%>
<div class="modal fade  mt-5" id="cart-modal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog ">
		<div class="modal-content">
			<div class="modal-header text-white primary-background text-center">
				<h5 class="modal-title mx-5 " id="exampleModalLabel">
					<span><img src="img/shop.png" style="height: 20px"></span>Your Cart
				</h5>
			</div>
			<div class="modal-body">
				<div class="cart-body">
				
				
				</div>
				<button type="button"  class="btn btn-primary checkout-btn" onclick="goTOCheckOut()">Checkout</button>
				
			</div>
		</div>
	</div>
</div>
<%-- End of cart modal --%>
<%-- Wishlist Modal --%>
<div class="modal fade mt-5" id="wishlist-modal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog ">
		<div class="modal-content">
			<div class="modal-header text-white primary-background text-center">
				<h5 class="modal-title mx-5 " id="exampleModalLabel">
					<span><img src="img/shop.png" style="height: 20px"></span>ShopMart
				</h5>
			</div>
			<div class="modal-body">
				<div class="container text-center">
				
				
				</div>
			</div>
		</div>
	</div>
</div>
<%-- End of Whishlist modal --%>
<%
}
%>
<script type="text/javascript" src="js/myjs.js"></script>



