<link href="resources/css/divs.css" rel="stylesheet">

	

<div class="container-fluid" style="margin-top: 20px" ng-controller="myCtrl">
	<div class="panel panel-default">
		<div class="panel-heading">
			
			<div class="row row1" style="text-align: center;letter-spacing:1px;">
				
				<form action="getinfo" method="post" id="myForm1">
						<input type="text" name="forWhom" value="Women" hidden/>
						<input type="text" name="category" value="Casuals" hidden/>
					</form>
			
				Casuals for Women&nbsp;&nbsp;
				<a class="btn btn-info btn-md" href="#imageGalleryWomen" onclick="myFunctionWomen()" id="anchorWomen" >View More</a>
				<button type="submit" form="myForm1" value="Submit" class="btn btn-danger btn-md">View All</button>
				<hr style="margin-top :5px; margin-bottom: 5px; border-top: 1px solid OliveDrab;">
				
				
			</div>
			<div class="row">
				<div class="col col-xs-6 col-sm-3 divonhover" ng-repeat="li in casualWomenList | limitTo : 4">
					<a href="product?prodId={{li.productId}}"><img src="./resources/images/{{li.productId}}.jpg" class="img-responsive" style="height: 140px; width:95%;position:relative;"/>
					<label ng-if="loginCheck== true &&  checkIfPresent(li.productId)" class="glyphicon glyphicon-shopping-cart" style="position: absolute;right:0%;width:100% ;background-color:black ; opacity : 0.8 ;color:white ;text-shadow: none;margin-top:0; ;font-size:20px;"></label>
				
					<p>{{li.productBrand}} {{li.productName}}</p>
					<p>&#8377 {{(li.productPrice - (li.productDiscountPercent / 100) * li.productPrice) | number:0}} &nbsp;<del style="color:gray;font-size:85%;">&#8377 {{li.productPrice}}</del>&nbsp;<mark style="background-color:silver;opacity:0.8;">{{li.productDiscountPercent}}% off</mark> </p>	</a>
							
				</div>
				
				
			</div>		
		</div>
	
		 <div class="panel-body collapse" id="imageGalleryWomen">
				<div class="col col-xs-6 col-sm-3 divonhover1" ng-repeat="li in casualWomenList | limitTo : -4">
					<a href="product?prodId={{li.productId}}"><img src="./resources/images/{{li.productId}}.jpg" class="img-responsive" style="height: 140px; width:95%;position:relative;"/>
		     		<label ng-if="loginCheck== true &&  checkIfPresent(li.productId)" class="glyphicon glyphicon-shopping-cart" style="position: absolute;right:0%;width:100% ;background-color:black ; opacity : 0.8 ;color:white ;text-shadow: none;margin-top:0; ;font-size:20px;"></label>
				
					<p>{{li.productBrand}} {{li.productName}}</p>
					<p>&#8377 {{(li.productPrice - (li.productDiscountPercent / 100) * li.productPrice) | number:0}} &nbsp;<del style="color:gray;font-size:85%;">&#8377 {{li.productPrice}}</del>&nbsp;<mark style="background-color:silver;opacity:0.8;">{{li.productDiscountPercent}}% off</mark> </p>	</a>
									
	
		</div>		
		
	
	
		</div>
	
	</div>

	

</div>

<script>

function myFunctionWomen()
{
	var myName = document.getElementById("anchorWomen").innerHTML;
	if( myName == "View More")
	{	
		document.getElementById("imageGalleryWomen").style.display="block";
		document.getElementById("anchorWomen").innerHTML="View Less";
	}
	else
		{
		document.getElementById("imageGalleryWomen").style.display="none";
		document.getElementById("anchorWomen").innerHTML="View More";
		}
}
</script>