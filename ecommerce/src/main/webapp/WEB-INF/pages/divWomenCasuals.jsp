<link href="resources/css/divs.css" rel="stylesheet">

	

<div class="container-fluid" style="margin-top: 20px" ng-controller="myCtrl">
	<div class="panel panel-default">
		<div class="panel-heading">
			
			<div class="row row1">
				<p>Casuals for Women&nbsp;&nbsp;
				<a class="btn btn-info btn-md" href="#imageGalleryWomen" onclick="myFunctionWomen()" id="anchorWomen" >View More</a>
				<a class="btn btn-danger btn-md" href="#">View All</a></p>
				<hr style="margin-top :5px; margin-bottom: 5px; border-top: 1px solid OliveDrab;">
				
				
			</div>
			<div class="row">
				<div class="col col-xs-6 col-sm-3 divonhover" ng-repeat="li in casualWomenList | limitTo : 4">
					<a href="#"><img src="./resources/images/{{li.productId}}.jpg" class="img-responsive" style="height: 140px; width:95%;"/>
					<p>{{li.productBrand}} {{li.productName}}</p>
					<p>&#8377 {{(li.productPrice - (li.productDiscountPercent / 100) * li.productPrice) | number:0}} &nbsp;<del style="color:gray;font-size:85%;">&#8377 {{li.productPrice}}</del>&nbsp;<mark style="background-color:silver;opacity:0.8;">{{li.productDiscountPercent}}% off</mark> </p>	</a>
							
				</div>
				
				
			</div>		
		</div>
	
		 <div class="panel-body collapse" id="imageGalleryWomen">
				<div class="col col-xs-6 col-sm-3 divonhover1" ng-repeat="li in casualWomenList | limitTo : -4">
					<a href="#"><img src="./resources/images/{{li.productId}}.jpg" class="img-responsive" style="height: 140px; width:95%;"/>
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