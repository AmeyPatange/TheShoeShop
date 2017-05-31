<link href="resources/css/divs.css" rel="stylesheet">


<div class="container-fluid" style="margin-top: 20px" ng-controller="myCtrl">
	<div class="panel panel-default">
		<div class="panel-heading">
			
			<div class="row row1">
				<p>Sports Shoes &nbsp;&nbsp;
				<a class="btn btn-info btn-md" href="#imageGalleryS" onclick="myFunctionS()" id="anchorS" >View More</a>
				<a class="btn btn-danger btn-md" href="#">View All</a></p>
				<hr  style="margin-top :5px; margin-bottom: 5px; border-top: 1px solid OliveDrab;">
				
				
			</div>
			<div class="row">
				<div class="col col-xs-6 col-sm-3 divonhover" ng-repeat="list in sportsList | limitTo:4">
					<a href="#"><img src="./resources/images/{{list.productId}}.jpg" class="img-responsive" style="height: 140px; width:95%;"/>
					<p>{{list.productBrand}}&nbsp;{{list.productName}}</p>
					<p><span>&#8377;</span>{{list.productPrice - (list.productDiscountPercent / 100) * list.productPrice | number:0}}  &nbsp;<del style="color:gray;font-size:85%;"><span>&#8377;</span> {{list.productPrice}}</del>&nbsp;<mark style="background-color:silver;opacity:0.8;">{{list.productDiscountPercent}}% off</mark> </p>	</a>
							
						
				
				</div>
		
			</div>
	
		<div class="panel-body collapse" id="imageGalleryS">
				<div class="col col-xs-6 col-sm-3 divonhover1" ng-repeat="list in sportsList | limitTo:-4">
					<a href="#"><img src="./resources/images/{{list.productId}}.jpg" class="img-responsive" style="height: 140px; width:95%;"/>
					<p>{{list.productBrand}}&nbsp;{{list.productName}}</p>
					<p><span>&#8377;</span>{{list.productPrice - (list.productDiscountPercent / 100) * list.productPrice | number:0}}<del style="color:gray;font-size:85%;"><span>&#8377;</span> {{list.productPrice}}</del>&nbsp;<mark style="background-color:silver;opacity:0.8;">{{list.productDiscountPercent}}% off</mark> </p>	</a>
							
				</div>
			
		</div>
 	
		
	
	
	</div>
	

	</div>


</div>

<script>

function myFunctionS()
{
	var myName = document.getElementById("anchorS").innerHTML;
	if( myName == "View More")
	{	
		document.getElementById("imageGalleryS").style.display="block";
		document.getElementById("anchorS").innerHTML="View Less";
	}
	else
		{
		document.getElementById("imageGalleryS").style.display="none";
		document.getElementById("anchorS").innerHTML="View More";
		}
}
</script>