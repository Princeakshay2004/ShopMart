// add to cart function

function addToCart(pid,pname,pprice,uid)
{
	const data={
		pid:pid,
		pname:pname,
		pprice:pprice,
		uid:uid,
		operation:'cart'
	}
	
	$.ajax({
		
		url:'CartServlet',
		data:data,
		success:function(data,textStatus,jqHXR)
		{
			
			console.log(data);
			if(data.trim()=='true')
			{
			let c=$(".cart-items").html();
			c++;
			$('.cart-items').html(c);
			}
		},
		error:function(jqHXR,textStatus,errorThrown)
		{
			console.log(data);
		}
	})

}





//profile details button
$(document).ready(function() {
	let editStatus = false;
	$("#save-profile-button").hide()

	if (editStatus == false) {
		$("#edit-profile-button").click(function() {			
			$("#profile-details").hide()
			$("#profile-edit").show()
			$("#edit-profile-button").hide()
			$("#close-profile-button").hide()
			$("#save-profile-button").show()
			$("#modal-footer").hide()
			editStatus = true;
		})

		$("#back-profile-button").click(function() {
			editStatus = false;
			$("#profile-details").show()
			$("#profile-edit").hide()
			$("#edit-profile-button").show()
			$("#close-profile-button").show()
			$("#save-profile-button").hide()
			$("#modal-footer").show()

		})

	}
});
// end of profile button details

//Add product Function
function add_to_cart(pId,pName,pPrice)
{
	let cart=localStorage.getItem("cart");
	if(cart == null)
	{
		let products=[];
		let product={productId:pId,productName:pName,productQuantity:1,productPrice:pPrice};
		products.push(product);
		localStorage.setItem("cart",JSON.stringify(products));
		console.log("Product Is Added For FirstTime");
		
	}
	else{
	let pcart=JSON.parse(cart);
	let oldProduct=pcart.find((item)=>item.productId==pId)	
	if(oldProduct)
	{
		// we have to increase quantity
		oldProduct.productQuantity=oldProduct.productQuantity+1;
		pcart.map((item)=>
		{
			if(item.productId==oldProduct.productId)
			{
				item.productQuantity=oldProduct.productQuantity;
			}
		})
		localStorage.setItem("cart",JSON.stringify(pcart));
		console.log("Product Quantity Is Incresed")

	}	
	else{
		// we have to add product
	let product={productId:pId,productName:pName,productQuantity:1,productPrice:pPrice};
	pcart.push(product)
	localStorage.setItem("cart",JSON.stringify(pcart));
	console.log("Product Is incresed")
	}	
  }
  updateCart()
}
// End of add Product Function

// update cart
function updateCart()
{
	let cartString=localStorage.getItem("cart");
	let cart=JSON.parse(cartString);
	if(cart==null || cart.length==0)
	{
		console.log("Cart is empty")
		$(".cart-items").html("( 0 )");
		$(".cart-body").html("<h3>Cart Does not Have any item</h3>");
		$(".checkout-btn").attr('disabled',true);
	}
	else{
		$(".cart-items").html(`(${cart.length})`);
		let table=`
			<table class='table'>
			<thead class='thead-light'>
				<tr>
					<th> Name </th>
					<th>  Price </th>
					<th>  Quantity </th>
					<th> Total Price </th>
					<th> Action </th>

				</tr>
				<t
			</thead>
			`;
		let totalPrice=0;
		cart.map((item)=>{
		table+=`
				<tr>
					<td>${item.productName}</td>
					<td>${item.productPrice}</td>
					<td>${item.productQuantity}</td>
					<td>${item.productQuantity*item.productPrice}</td>
					<td><button onclick='deleteProduct(${item.productId})'class='btn btn-danger btn-sm'>Remove</button></td>
				</tr>`
			totalPrice+=item.productPrice*item.productQuantity;
		});
		table=table+`
		<tr> <td colspan='5' class='text-right font-weight-bold m-5'>Total Price : ₹ ${totalPrice}</td></tr>
		</table>`
		$(".cart-body").html(table);
		$(".checkout-btn").attr('disabled',false);
	}
}

// delete product from cart
 function deleteProduct(pId)
 {
	let cart=JSON.parse(localStorage.getItem('cart'));
	let newcart= cart.filter((item)=>item.productId != pId)
	localStorage.setItem('cart',JSON.stringify(newcart))
	updateCart();
 }
// end update cart


$(document).ready(function()
{
	updateCart()
})
//  Functon checkout
 function goTOCheckOut()
 {
	 window.location="checkOut.jsp"
 }