<%@ include file="header.jsp" %>

	<link rel="stylesheet" href="./resources/css/bootstrap.min.css" type="text/css">
	<script type="text/javascript" src="./resources/js/bootstrap.min.js"></script>
	<script src="./resources/js/jquery-3.2.1.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<script src= "http://ajax.googleapis.com/ajax/libs/angularjs/1.2.26/angular.min.js"></script>
	
<style>

.onDiv
{
padding:5px;
padding-top:3px;

}

.onDiv a
{
color: white;
text-decoration: none;
}


.onDiv a:hover
{

text-decoration: none;
}

.onDiv:hover
{
background: linear-gradient(to top ,black ,  #343, black , #343);
border-radius: 10px;
border-left: 1px solid white;
border-right: 1px solid white;
}

</style>
	
	
	
<div class="container-fluid row" style="font-family:courier ; margin-top: 50px;margin-left:0px;background: linear-gradient(to top, black, #343 , black);padding:0px;">

	<div class="col-xs-12 col-md-1" style="border-right:1px solid white;border-radius: 5px;">
		<form action="getinfo" method="post" onsubmit="return checkAllTicks()">
			<div class="row">
				<label>Category</label>
				<div style="color: white;letter-spacing: 1px;margin: 1px;">
					<input type="radio" name="forWhom" value="Men" formaction="hello">&nbsp;MEN &nbsp;</input><br>
					<input type="radio" name="forWhom" value="Women">&nbsp;WOMEN &nbsp;</input><br>
					<input type="radio" name="forWhom" value="BOTH">&nbsp;BOTH &nbsp;</input>
				</div>
				<hr style="margin-top: 2px;"/>	
			</div>
			<div class="row" ng-controller="myCtrl">
				<label>Type</label>
				<div style="color: white;letter-spacing: 1px;margin: 1px;" ng-repeat="cat in category">
					<input  type="radio"  name="category" value="{{cat.categoryType}}">&nbsp;{{cat.categoryType}}&nbsp;</input>
				</div>
				<hr style="margin-top: 2px;"/>	
			</div>
			<div class="row" ng-controller="myCtrl">
				<label>Brand</label>
				<div style="color: white;letter-spacing: 1px;margin: 1px;" ng-repeat="brand in brandsList">
					<input  type="radio"  name="Brand" value="{{brand}}">&nbsp;{{brand}}&nbsp;</input>
				</div>
				<hr style="margin-top: 2px;"/>	
			</div>
			 <input type="reset" value="Reset" class="btn btn-warning btn-xs" style="width:90%;">
			  <input type="submit" value="Submit" class="btn btn-danger btn-xs" style="width:90%;margin-top:5px;margin-bottom: 5px;">
		</form>
		
	</div>
	<div class="col-xs-12 col-md-9"  ng-controller="myCtrl" style="margin-left:0px;text-align:center;color: white;letter-spacing:1px; font-family:courier;border-left:1px solid white;padding:0; border-radius:5px;">
		
		<div class="panel panel-primary">
				<div class="panel-heading"></div>
						<div class="panel-body col-xs-4 col-md-3 onDiv" ng-repeat="prod in pList">
							<a href="product?prodId={{prod.productId}}" ><img src="./resources/images/{{prod.productId}}.jpg"  height="150px" width="200px" style="position:relative;"/>
							<label ng-if="loginCheck== true &&  checkIfPresent(prod.productId)" class="glyphicon glyphicon-shopping-cart" style="position: absolute;right:0%;width:100% ;background-color:black ; opacity : 0.8 ;color:white ;text-shadow: none;margin-top:0; ;font-size:20px;"></label>
				
							<p>{{prod.productBrand}} {{prod.productName}}</p>			
							<p><span>&#8377;</span>{{prod.productPrice - (prod.productDiscountPercent / 100) * prod.productPrice | number:0}}  &nbsp;<del style="color:white;font-size:85%;"><span>&#8377;</span> {{prod.productPrice}}</del>&nbsp;<mark style="background-color:white;opacity:0.95;">{{prod.productDiscountPercent}}% off</mark> </p>
							</a>
						</div>
					
		</div>
	</div>
	<!-- <div class="col-xs-12 col-md-2"  ng-controller="myCtrl" style="margin-left:0px;text-align:center;color: white;letter-spacing:1px; font-family:courier;border-left:1px solid white;padding:0; border-radius:5px;">
		
		<div>
			<label>Sort By Price</label><br/>
			<input type="checkbox" value="">&nbsp;High To Low</input><br/>
			<input type="checkbox" value="">&nbsp;Low To High</input>		
		</div>
	</div>
 -->
</div>



<%@ include file="footer.jsp" %>

<script>

function checkAllTicks()
{
	var forWhom1 = document.getElementsByName('forWhom');
	var category1 = document.getElementsByName('category');
	var brand1 = document.getElementsByName('Brand');
	
	var isAllChecked  = false;
	
	for( var i=0 ; i< forWhom1.length ; i++)
		{
			if( forWhom1[i].checked)
				{
					return true;
					
				}
		}
	for( var i=0 ; i < category1.length ; i++)
		{
			if(category1[i].checked)
				{
				return true;
				}
		}
	for( var i=0 ; i < brand1.length ; i++)
		{
			if(brand1[i].checked)
				{
				return true;				
				}
		}
	
	alert("Please Select Atleast One Option");
	return false;
}


</script>
