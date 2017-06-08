<%@ include file="header.jsp" %>

	<link rel="stylesheet" href="./resources/css/bootstrap.min.css" type="text/css">
	<script type="text/javascript" src="./resources/js/bootstrap.min.js"></script>
	<script src="./resources/js/jquery-3.2.1.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
   


<style>
.displayProd
{
	background: linear-gradient( 135deg , black, #343, black);
	box-shadow: 2px 2px 20px 1px black;
	font-family: courier;
	border-radius: 20%;
	
}

#imageProd:hover
{
margin-left: 5px;
margin-bottom: 5px;

box-shadow:2px 2px 10px 1px black;
}

.cartAdd:hover
{
	background: linear-gradient( to right , #eee , gray , #eee);
	color: black;
	text-shadow : none;
	box-shadow: 2px 2px 10px 1px black;
}
</style>


<div class="row displayProd" style="margin-top:50px;" ng-controller="myCtrl">
<hr style="width: 80%;"/>
	<div class="col-xs-12 col-sm-4 col-sm-offset-1">
		
		<img id="imageProd" src="./resources/images/{{pList.productId}}.jpg" class="img-responsive">
			
		
		
	</div>
	<div class="row">
		<div class="col-xs-12 col-sm-4">
				<div class="row" style="margin-top:0px;">
					<big><label style="text-decoration: underline;">{{pList.productBrand}} {{pList.productName}}</label></big>
				</div>
				<div class="row">
					<label>{{pList.productCategory}} for {{pList.productSex}}</label>
				</div>
				<div class="row">
					<label><big>&#8377; {{(pList.productPrice) - (pList.productDiscountPercent/ 100) * pList.productPrice | number: 0}}</big>&nbsp; <del>&#8377; {{pList.productPrice}}</del>&nbsp;<mark style="box-shadow: 1px 1px 2px black;text-shadow: none;background: linear-gradient(to right, white, gray);">{{pList.productDiscountPercent}}% OFF</mark></label>	
				</div>
		
		</div>
		<div class="col-xs-12 col-sm-4">
			<div class="row">
				<label style="text-decoration: underline;">DESCRIPTION </label>
					<br>
				<label>{{pList.productDescription}}</label>
			</div>
			
			
			<div ng-if="loginCheck==true && checkIfPresent(pList.productId)!= true" class="row cartAdd" style="border:10% ;border: 1px solid white; text-align: center;">
				<label><button style="background-color: transparent;" form="Cart" type="submit">ADD TO CART</button></label>
				
				
				<form action="addToCart" method="post" id="Cart">
					<input type="text" name="cartId" value="0" hidden/>
					<input type="text" name="productId" value="{{pList.productId}}" hidden/>
					<input type="text" name="signUpEmail" value="${CustomerDetails.signUpEmail}" hidden/>
					<input type="text" name="quantity" value="1" hidden/>
					<input type="text" name="shippingCharges" value="50" hidden/> 
					<input type="text" name="amount" value="{{(pList.productPrice) - (pList.productDiscountPercent/ 100) * pList.productPrice}}" hidden/> 
					<input type="text" name="productBrand" value="{{pList.productBrand}}" hidden/>
					<input type="text" name="productName" value="{{pList.productName}}" hidden/>
					<input type="text" name="productStock" value="{{pList.productStock}}" hidden/>
			</form>
				
		  </div>
		</div>
	</div>
	<hr style="width: 80%;"/>
	
</div>

<script>
$( window ).on( "load", function(){
	$(".displayProd").hide();
	$(".displayProd").slideDown(2000);
	
	
});

</script>