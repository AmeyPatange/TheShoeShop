<link href="resources/css/divs.css" rel="stylesheet">


<div class="container-fluid" style="margin-top: 20px" ng-controller="myCtrl">
	<div class="panel panel-default">
		<div class="panel-heading">
			
			<div class="row row1">
				<p>Casuals for Men&nbsp;&nbsp;
				<a class="btn btn-info btn-md" href="#imageGallery" onclick="myFunction()" id="anchor" >View More</a>
				<a class="btn btn-danger btn-md" href="#">View All</a></p>
				<hr  style="margin-top :5px; margin-bottom: 5px; border-top: 1px solid OliveDrab;">
				
				
			</div>
			<div class="row">
				<div class="col col-xs-6 col-sm-3 divonhover" ng-repeat="list in casualMenList | limitTo:4">
					<a href="#"><img src="./resources/images/{{list.productId}}.jpg" class="img-responsive" style="height: 140px; width:95%;"/>
					<p>{{list.productBrand}}&nbsp;{{list.productName}}</p>
					<p><span>&#8377;</span>{{list.productPrice - (list.productDiscountPercent / 100) * list.productPrice | number:0}}  &nbsp;<del style="color:gray;font-size:85%;"><span>&#8377;</span> {{list.productPrice}}</del>&nbsp;<mark style="background-color:silver;opacity:0.8;">{{list.productDiscountPercent}}% off</mark> </p>	</a>
							
						
				
				</div>
		
			</div>
	
		<div class="panel-body collapse" id="imageGallery">
				<div class="col col-xs-6 col-sm-3 divonhover1" ng-repeat="list in casualMenList | limitTo:-4">
					<a href="#"><img src="./resources/images/{{list.productId}}.jpg" class="img-responsive" style="height: 140px; width:95%;"/>
					<p>{{list.productBrand}}&nbsp;{{list.productName}}</p>
					<p><span>&#8377;</span>{{list.productPrice - (list.productDiscountPercent / 100) * list.productPrice | number:0}}<del style="color:gray;font-size:85%;"><span>&#8377;</span> {{list.productPrice}}</del>&nbsp;<mark style="background-color:silver;opacity:0.8;">{{list.productDiscountPercent}}% off</mark> </p>	</a>
							
				</div>
			
		</div>
 	
		
	
	
	</div>
	

	</div>


</div>

<script>

function myFunction()
{
	var myName = document.getElementById("anchor").innerHTML;
	if( myName == "View More")
	{	
		document.getElementById("imageGallery").style.display="block";
		document.getElementById("anchor").innerHTML="View Less";
	}
	else
		{
		document.getElementById("imageGallery").style.display="none";
		document.getElementById("anchor").innerHTML="View More";
		}
}
</script>