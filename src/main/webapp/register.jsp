<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="entities.Message" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Now!</title>
<%@include file="css_js.jsp"%>
</head>

<body style="overflow: hidden">
	<%-- navbar --%>
	<%@include file="navbar.jsp"%>

	<%-- form --%>
<main>
<img src="img/cool-background.png" class="object-fit-cover card-img " style="margin-top: 50px; position: fixed;">
<div class="card-img-overlay">
	<div class="row "style="margin-top: 80px">
		<div class="col-md-5 offset-md-4">
			<div class="card">
				<div class="card-header text-center primary-background text-light">
			<%
			Message msg=(Message)session.getAttribute("regmsg");
			if(msg!=null)
			{
			%>
				
			<div class="alert <%=msg.getCssClass() %> alert-dismissible fade show" role="alert">
			  <strong><%=msg.getContent() %></strong> 
			  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
			    <span aria-hidden="true">&times;</span>
			  </button>
			</div>
				
			<% 
				session.removeAttribute("regmsg");
			}
			%>
				<span ><i class="fa-solid fa-user-plus fa-2x"></i></span>
					<h3 class="text-center ">Register Here!</h3>
					</div>
					<div class="card-body">
					
					<form action="RegisterServlet" method="post">
						<div class="form-row">
							<div class="col-md-6 mb-3">
								<label for="first_name">First name</label> <input type="text"
									name="user_fname" class="form-control" id="first_name" placeholder="First name"
									required>
							</div>

							<div class="col-md-6 mb-3">
								<label for="last_name">Last name</label> <input type="text"
								name="user_lname"	class="form-control" id="last_name" placeholder="Last name"
									required>
							</div>


							<div class="form-group col-md-6">
								<label for="email">Email</label> <input type="email"
								name="user_email"	class="form-control" id="email" placeholder="Email">
							</div>
							<div class="form-group col-md-6">
								<label for="Password">Password</label> <input
								name="user_password"	type="password" class="form-control" id="Password"
									placeholder="Password">
							</div>
						</div>
						<div class="form-group">
							<label for="phone">Mobile No</label> <input type="number"
							name="user_mobile"	class="form-control" id="mobile"
								placeholder="Mobile No">
						</div>
						<div class="form-group">
							<label for="Address">Address </label> <input type="text"
							name="user_address"	class="form-control" id="Address"
								placeholder="Apartment, studio, or floor">
						</div>
						<div class="form-row">
							<div class="form-group col-md-4">
								<label for="City">City</label> <input type="text" placeholder="City"
								name="user_city"	class="form-control" id="City">
							</div>
							<div class="form-group col-md-4">
								<label for="State">State</label> 
								<select id="State" name="user_state"class="form-control" inputmode="text">
									<option selected disabled="disabled">Choose...</option>
										<option>Andhra Pradesh</option>
										<option>Arunachal Pradesh</option>
										<option>Assam</option>
										<option>Bihar</option>
										<option>Chhattisgarh</option>
										<option>Goa</option>
										<option>Gujarat</option>
										<option>Haryana</option>
										<option>Himachal Pradesh</option>
										<option>Jharkhand</option>
										<option>Karnataka</option>
										<option>Kerala</option>
										<option>Maharashtra</option>
										<option>Madhya Pradesh</option>
										<option>Manipur</option>
										<option>Meghalaya</option>
										<option>Mizoram</option>
										<option>Nagaland</option>
										<option>Odisha</option>
										<option>Punjab</option>
										<option>Rajasthan</option>
										<option>Sikkim</option>
										<option>Tamil Nadu</option>
										<option>Tripura</option>
										<option>Telangana</option>
										<option>Uttar Pradesh</option>
										<option>Uttarakhand</option>
										<option>West Bengal</option>
										<option>Andaman & Nicobar (UT)</option>
										<option>Chandigarh (UT)</option>
										<option>Dadra & Nagar Haveli and Daman & Diu (UT)</option>
										<option>Delhi [National Capital Territory (NCT)]</option>
										<option>Jammu & Kashmir (UT)</option>
										<option>Ladakh (UT)</option>
										<option>Lakshadweep (UT)</option>
										<option>Puducherry (UT)</option>		
								</select>
							</div>
							<div class="form-group col-md-4">
								<label for="Zip">Zip Code</label> <input type="number" placeholder="zip Code"
									name="user_zip" class="form-control" id="Zip">
									
							</div>
						</div>
						<div class="text-center">
						<button type="submit" class="btn btn-primary mx-2">Register</button>
						<button type="reset" class="btn btn-danger mx-2">Reset</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	</div>
	</main>
</body>
</html>