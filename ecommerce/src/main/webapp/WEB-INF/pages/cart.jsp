<%@ include file="header.jsp" %>

<head>
	<link rel="stylesheet" href="./resources/css/bootstrap.min.css" type="text/css">
	<script type="text/javascript" src="./resources/js/bootstrap.min.js"></script>
	<script src="./resources/js/jquery-3.2.1.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<script src= "https://ajax.googleapis.com/ajax/libs/angularjs/1.2.32/angular.js"></script>
	
	
<style>

#displayMod
{
display:none;
position: fixed;
z-index: 4;
width: 100%; /* Full width */
height: 100%; 
top:0;
left:0;
background-color: rgba(0,0,0,0.4); 
}

#displayMod .panel-primary
{
margin-left:15%;
width:70%;

}

#displayMod .panel-heading
{
padding-bottom:0;
}


</style>	
 	
</head>

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

<div class="container-fluid" ng-controller="myCtrl" style="margin-top:50px;background:linear-gradient(135deg , black , #343 , black);">
		<div style="font-family:courier; font-size:18px ;color: white; text-align:center;">Total : <span>&#8377;</span> ${number}</div>
		<div class="col-xs-12 col-sm-3" ng-repeat="prod in pList" ng-click="displayModal(prod.cartId , prod.productId , prod.productBrand , prod.productName ,prod.quantity , prod.amount , prod.productStock , prod.signUpEmail , prod.shippingCharges)" style="cursor:pointer;" title="Click To Update">
			 <img src="./resources/images/{{prod.productId}}.jpg" width="180px" height="150px"/>
			 <br>
			 <label>{{prod.productBrand}} {{prod.productName}}</label>
			 <br>
			 <label>Quantity  
			 <input style="width:40px;color: black;border-radius:40%;text-align:center;border:none;margin:1px;height:30px;" type="text" placeholder="{{prod.quantity}}" disabled/ >
			 <br/>
			 <label>Amount  &#8377; {{prod.amount}}</label>
			 <br/>
		</div>





	<div id="displayMod" class="container11">
		<div class="panel-primary">
			<div class="panel-heading">
		<button style="margin-left:90%;" onclick="displayModalOff()" class="btn btn-success">X</button>
			</div>
			<div class="panel-body" style="background: linear-gradient(to bottom , black , #343 , black);">
				<div class="row" style="text-align:center;">
					<label><span class="glyphicon glyphicon-shopping-cart"></span>&nbsp;CART ITEM</label><hr/>
				</div>
				<div class="row">
					<div class="col-xs-12 col-sm-5">
					<img ng-model="displayPic"  src="./resources/images/{{displayPic}}.jpg"  height="160px" width="160px"/>
					</div>
					
					<div class="col-xs-12 col-sm-5">
					<div ng-model="displayBrand" ng-model="displayName"><label>{{displayBrand}} {{displayName}}</label></div>
					<hr/>
					<div class="col-xs-12">
						<div ng-model="displayQuantity" ng-model="displayStock">
							<label>Quantity : </label>	
							<button class="btn btn-info" ng-hide="displayQuantity==1" ng-click="changeQuantity(1 , displayQuantity ,displayStock )">-</button>
							<input type="text" style="margin:1px;width:40px;border:none; border-radius:40%;text-align:center;" placeholder="{{displayQuantity}}" disabled/>
							<button class="btn btn-info" ng-hide="displayQuantity==displayStock" ng-click="changeQuantity2(1 , displayQuantity ,displayStock )">+</button>
						</div>
						</div>
					
					<div class="col-xs-12">
						<div ng-model="displayQuantity" ng-model="shippingCharges">
							<label>Amount : <span>&#8377;</span> {{displayAmount * displayQuantity | number:2}}</label>	
							<br>
							<label>Shipping Charges : &#8377; {{shippingCharges}}</label>
		
							</div>
											
					</div>
				
						</div>
			
			
				
		</div>
		<label>*No Shipping Charges Applied On Amount Greater Than &#8377; 1,000 </label>
			<div>
				<form action="updateInCart" method="post" id="CartUpdate">
					<input type="text" name="cartId" value="{{displayId}}" hidden/>
					<input type="text" name="productId" value="{{displayProdId}}" hidden />
					<input type="text" name="signUpEmail" value="{{displaysignUpEmail}}" hidden />
					<input type="text" name="quantity" value="{{displayQuantity}}" hidden/>
					<input type="text" name="shippingCharges" value="{{shippingCharges}}" hidden /> 
					<input type="text" name="amount" value="{{displayAmount * displayQuantity }}" hidden /> 
					<input type="text" name="productBrand" value="{{displayBrand}}" hidden/>
					<input type="text" name="productName" value="{{displayName}}" hidden/>
					<input type="text" name="productStock" value="{{displayStock}}" hidden />
			</form>
				
	
	
	
	
		<div class="row" style="text-align: center;margin-top:30px; letter-spacing: 1px;">
					<button form="CartUpdate" type="submit" class="btn btn-warning">UPDATE CART ITEM</button>
				</div>
			</div>
			
		<form action="removeCartItem" method="post" id="delCartItem">
			<input type="text"  name="cartId" value="{{displayId}}" hidden/>
			<input type="text" name="signUpEmail" value="{{displaysignUpEmail}}" hidden />
					
		</form>	
		<div class="row" style="text-align: center;margin-top:30px; letter-spacing: 1px;">
					<button type="submit" form="delCartItem" class="btn btn-danger">REMOVE CART ITEM</button>
				</div>
	</div>
</div>
<script>
function displayModalOff()
{
	document.getElementById("displayMod").style.display="none";	
}


</script>