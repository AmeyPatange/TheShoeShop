 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html ng-app="myApp">
<head lang="en-US">

	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>The Shoe Shop</title>
	<script type="text/javascript" src="./resources/js/bootstrap.min.js"></script>
	<script src="./resources/js/jquery-3.2.1.min.js"></script>
    
	<link rel="stylesheet" href="./resources/css/bootstrap.min.css" type="text/css">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="./resources/css/Style.css" rel="stylesheet" type="text/css">
    <link href="resources/css/footer.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 	<script src= "https://ajax.googleapis.com/ajax/libs/angularjs/1.2.32/angular.js"></script>
 	
 <script>
 

 var login = ${login} 
 var productList = ${productList}
 var casualMenList = ${casualMenList}
 var casualWomenList = ${casualWomenList}
 var sportsList = ${sportsList}
 var category = ${category} 
 var brandsList = ${brandsList}
 var cartList = ${cartList}
 var prodList = ${product}
 var app = angular.module('myApp', []);
 

 
 app.controller( 'myCtrl', function($scope){
	
		if (prodList != undefined )
	 	{
	 		 console.log("Hi");
	 		 $scope.pList = prodList;
	 	} 
	 	
		if(cartList != undefined)
			{
				$scope.cartList = cartList;
				
				$scope.checkIfPresent = function(prodId)
				{
					
					for( var i =0; i < $scope.cartList.length ; i++)
						{
							var idFetched = $scope.cartList[i].productId;
							if(idFetched == prodId)
								return true;
						}
				}
			}
		
    $('#displayMod').hide();	
	$scope.productList = productList;
	$scope.casualMenList = casualMenList;
 	$scope.casualWomenList = casualWomenList;
 	$scope.category = category;
 	$scope.brandsList = brandsList;
 	$scope.sportsList= sportsList;
	$scope.loginCheck = login;
	
 	
 	$scope.ul = false;
 	$scope.display = function()
 		{
 		console.log("Hello");
 		$scope.ul = true;
 		
 		if($scope.data == '')
 			{
 			$scope.ul = false;
 			}
 		}
 	
 	$scope.out = function()
 	{
 		$scope.ul = false;
 	}
 	
 	
 	
 	$scope.displayModal= function(id , prodId , Brand , Name, quantity , amount  , Stock , signUpEmail ,shippingCharges)
 	{
 		$scope.displayPic = prodId;
 		$scope.displayId = id;
 		$scope.displayBrand = Brand;
 		$scope.displayProdId = prodId;
 		$scope.displayName = Name;
 		$scope.displayQuantity = quantity;
 		$scope.displayAmount = amount;
 		$scope.displayStock = Stock;
 		$scope.displaysignUpEmail = signUpEmail;
 		$scope.shippingCharges = shippingCharges;
 		if($scope.displayAmount <1000)
			$scope.shippingCharges = 50;
 		else
 			$scope.shippingCharges = 0;
 			
 		
 		console.log("cartId" + id  );
 		console.log("productId" + prodId );
 		console.log("Brand" + Brand  );
 		console.log("Name" + Name  );
 		console.log("Quantity" + quantity  );
 		console.log("amount" + amount  );
 		console.log("Stock" + Stock  );
 		console.log(signUpEmail + " " + shippingCharges);
 		
 		console.log(id);
 		$('#displayMod').show();
 		
 		$scope.changeQuantity = function(min , current , max)
 	 	{
 	 		console.log(min+" "+current+ " "+max);
 	 		$scope.displayQuantity--;
 	 	}
 	 	$scope.changeQuantity2 = function(min , current , max)
 	 	{
 	 		console.log(min+" "+current+ " "+max+ "hello"+ $scope.displayStock);
 	 		
 	 		$scope.displayQuantity++;
 	 	}
	}
 	 	
 });
 

 
 
 </script>
    
       
    
</head>
<body>
	
<div class="container-fluid">
	
			<div class="row" style="background-color : white;">			<div class="col-xs-12 col-sm-2 col-md-2 logo">
						<a href="index"><img title="TheShoeShop.com" alt="TheShoeShop.com" src="./resources/images/logo.jpg" class="img-responsive" style="width: 170px; height: 100px; "></a>
				</div>
				<div class="col-xs-12 col-sm-10 col-md-10 header">
					<div class="row">
						<div class="col-xs-2 col-sm-12">
							<p class="h3"><small>The Smarter Way To Buy</small></p>	
						</div>
<div class="col-xs-12" ng-controller="myCtrl">						
	<nav class="navbar navbar-light navigation">
  		<div class="container-fluid">
    		<div class="navbar-header">
      			<button type="button" class="navbar-toggle buttonlayout" data-toggle="collapse" data-target="#myNavbar">
        			<i class="fa fa-bars" style="background-color : white;font-size:120%;"></i>                   
		      </button>
     
		    </div>
					    <div class="collapse navbar-collapse" id="myNavbar" ng-controller="myCtrl">
				    			  <ul class="nav navbar-nav main">
				        			<li class="dropdown">
						          		<a class="dropdown-toggle txt" data-toggle="dropdown" href="#">Men's Section <span class="caret"></span></a>
							          		<ul class="dropdown-menu drop">
							            		<li ng-repeat="li in category"><a href="productDescription?categoryId={{li.categoryID}}&for=Men">{{li.categoryType}}</a></li>
								          
								          </ul>
							        </li>
									
									<li class="dropdown">
						          		<a class="dropdown-toggle txt" data-toggle="dropdown" href="#">Women's Section <span class="caret"></span></a>
							          		<ul class="dropdown-menu drop">
							            		<li ng-repeat="li in category"><a href="productDescription?categoryId={{li.categoryID}}&for=Women">{{li.categoryType}}</a></li>
								          
								          </ul>
							        </li>
										
									  	<li class=" dropdown" style="cursor:pointer;">
								   		<a ng-show="loginCheck" class="dropdown-toggle txt"  data-toggle="dropdown" ><span class="glyphicon glyphicon-user"></span>&nbsp;Welcome ${CustomerDetails.signUpFirstName}&nbsp;<span class="caret"></span></a>     
								      			<ul class="dropdown-menu drop">	
								      				<!-- <li><a>Your Account Details</a></li>
								      				<li><a>Your Orders</a></li>-->
								      				<li><a href="checkCart">Your Cart</a></li>
								      				<li><a href="index">Log Out</a></li>
								      			</ul>
								      	
								     	</li>
									
									 <li ng-show="loginCheck!=false && cartList!= false" class="dropdown" style="padding-top:10px;padding-left:10px;padding-right:10px;color:OliveDrab;">
								      
								      	<span class="dropdown-toggle txt"  data-toggle="dropdown">
								      		 <span class="glyphicon glyphicon-shopping-cart"></span>&nbsp;Cart<sup><sup><label class="badge" style="background-color: transparent;color: OliveDrab;font-size: 14px;	text-shadow: none;">{{cartList.length}}</label></sup> </sup>
								      		</span>
								      </li> 
								    
						      </ul>
								      <ul ng-hide="loginCheck" id="signinfeature" class="nav navbar-nav navbar-right main">
									        <li><a href="signup" class="txt"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
									        <li><a href="login" class="txt"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
								      </ul>
								     
								 
    							</div>
							  </div>
						</nav>
						
				</div>	
		</div>
	</div>
</div>
</div>
<div class="row" style="background: linear-gradient(to top , OliveDrab , white); box-shadow: 0px 1px 2px black;" ng-controller="myCtrl">
		<div class="col-xs-4 col-xs-offset-4"  style="background-color : whitesmoke ;height: 20px;box-shadow: 0px 1px 2px black;">
		<hr style="margin-top: 10px; border-top: 1px solid OliveDrab;">
			<form>
			<div class="input-group searchbox">
				<input type="text" placeholder="Search for Products & Brands"
					class="form-control"  name="data" id="data"  ng-model="data" ng-keyup="display()"/>
					<span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>
				
			</div>
			</form>
				<ul  ng-show="ul" class="searchBox">
					<li ng-repeat="prod in productList | filter: data | limitTo : 5"><a  href="product?prodId={{prod.productId}}">{{prod.productBrand}}&nbsp;{{prod.productName}} for {{prod.productSex}}</a></li>
				</ul>
			
		</div>
</div>
