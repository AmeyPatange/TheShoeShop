<%@ include file="AdminHeader.jsp" %>
<head>
<link href="resources/css/AdminPage.css" rel="stylesheet" >
<script src= "http://ajax.googleapis.com/ajax/libs/angularjs/1.2.26/angular.min.js"></script>

<script src="resources/js/script.js"></script>

</head>


<script>

var productlist=${productList}
console.log(productlist.length);
var catlist = ${catlist}
var supplist = ${supplier}
var app = angular.module('myApp', []);


app.controller('myCtrl', function($scope) 
{
	$scope.showlist =supplist;
	if(productlist != undefined)
    $scope.productList=productlist;
	if(catlist != false )
    $scope.catList = catlist;
	if( supplist != false)
		$scope.suppList = supplist;
	
	if( $scope.showlist != false ){
		$scope.resultList = $scope.productList.length;
		$scope.itemsPerPage = 15;
		$scope.pagesRequired = Math.ceil($scope.resultList / $scope.itemsPerPage) ;
	
		$scope.currentPage = 1;
		
		$scope.goNext= function()
		{
			$scope.currentPage++;
		
		}
		$scope.goPrev= function()
		{
			if($scope.currentPage==1){}
			else
			$scope.currentPage--;
		}
	
	}
}
);



app.filter('customFilter' , function()
		
		{	
			return function(input , limit ,  begin )
			{
				begin = 15 * begin;
				return input.slice(begin , begin + limit);
			}
		}	
		);

</script>



<div class="container" onload="displayModal()"  ng-app="myApp">
  		<div class="row">
		
  				<div class="col-xs-12 col-xs-offset-4">
  				<button  class="btn btn-success">WELCOME ${AdminDetails.signUpFirstName}!</button>
  				<a href="index" ><button  class="btn btn-danger">LOG OUT</button></a>
  				</div>
  		</div>
  		<div class="row">
  			<div class="col-xs-12">
  			<div class="panel-group" style="margin-top:20px;">
   		 		<div class="panel">
      	 			<div class="panel-heading head">
      	 				<a href="#" id="expandid1" onclick="expand1()">
      	 				-</a><label>&nbsp;MANAGE PRODUCTS</label>
      	 			</div>
        	   <div class="panel-body collapseid1">
		        	  <div class="row">
        	   			<div class="col-xs-12">
        	   				<button class="btn btn-success" style="letter-spacing: 1px;" onclick="addprod()">
        	   				ADD PRODUCT
        	   				</button>
        	   				<button class="btn btn-success" style="letter-spacing: 1px;" onclick="viewprod()">
        	   				VIEW PRODUCTS
        	   				</button>
        	   			</div>
               	   </div>
               	   
               	   <div class="row addprod" style="margin-top:5px;">
               	   			<div class="col-xs-12">
               	   				<form action="addproduct"  onsubmit="return checkForError()"  method="post"  enctype="multipart/form-data" class="form-horizontal">
									<div class="row">
										<div class="col-xs-12 col-sm-4" style="background: linear-gradient(to top, #343, #232);text-align:center;">
										<label>BRAND</label>
										<input  type="text" id="Brand" name="productBrand" class="form-control" placeholder="Brand"/>
											<div id="BrandErr" style="color: coral;letter-spacing: 1px; font-size:14px;"></div>
										
										</div>
										
									
										<div class="col-xs-12 col-sm-4" style="background: linear-gradient(to top, #343, #232);text-align: center;">
										<label> NAME</label>
										<input name="productName" id="nameInput" type="text" class="form-control" placeholder="Name" />
										<div id="nameInputErr" style="color: coral;letter-spacing: 1px; font-size:14px;"></div>
										</div>
										<div class="col-xs-12 col-sm-4" style="background: linear-gradient(to top, #343, #232);text-align: center;">
										<label > DESCRIPTION</label>
										<input id="desc" name="productDescription" type="text" class="form-control" placeholder="Description" />
										<div id="descInputErr" style="color: coral;letter-spacing: 1px; font-size:14px;"></div>
										<input type="text" value="${id}" name="adminid"  hidden/>
										</div>
								</div>               	   				
               	   				
               	   				<div class="row">
               	   						<div class="col-xs-12 col-sm-4" style="background: linear-gradient(to top, #343, #232);text-align: center;">
										<label>PRICE</label>
										<input id="price" name="productPrice" type="text" class="form-control" placeholder="Price" />
										<div id="priceInputErr" style="color: coral;letter-spacing: 1px; font-size:14px;"></div>
								
									</div>
               	   						<div class="col-xs-12 col-sm-4" style="background: linear-gradient(to top, #343, #232);text-align: center;">
										<label>DISCOUNT PERCENT(IF ANY)</label>
										<input id="discount" name="productDiscountPercent" type="text" class="form-control" placeholder="FLAT % OFF" />
										<div id="discountInputErr" style="color: coral;letter-spacing: 1px; font-size:14px;"></div>
								
									</div>
               	   						<div class="col-xs-12 col-sm-4" style="background: linear-gradient(to top, #343, #232);text-align: center;">
										<label>STOCK</label>
										<input id="stock" name="productStock" type="text" class="form-control" placeholder="Items In Stock" />
										<div id="stockInputErr" style="color: coral;letter-spacing: 1px; font-size:14px;"></div>
								
									</div>
               	   				</div>
               	   				<div class="row">
               	   						<div class="col-xs-12 col-sm-4" style="background: linear-gradient(to bottom, #343, #232);text-align: center;">
										<label>FOR </label>
										<div class="col-xs-12"><select id="select" name="productSex"  class="form-control" style="width:100%;">
											<option value="Men">MEN</option>
											<option value="Women">WOMEN</option>
											<option value="BOTH">BOTH</option>
										</select>
										<div id="selectErr" style="color: coral;letter-spacing: 1px; font-size: 14px;">
										</div>
										</div></div>
               	   						<div class="col-xs-12 col-sm-4" style="background: linear-gradient(to bottom, #343, #232);text-align: center;">
										<label>CATEGORY</label>
										<div class="col-xs-12"  ng-controller="myCtrl">
											<select  name="productCategory"  class="form-control">
												<option ng-repeat="cat in catList" value="{{cat.categoryType}}">{{cat.categoryType}}</option>
											</select>
										</div>
										</div>
               	   						<div class="col-xs-12 col-sm-4" style="background: linear-gradient(to bottom, #343, #232);text-align: center;height:69px;  ">
										 <label> IMAGE</label>
										<div class="col-xs-12"><input name="productImage" type="file" /></div>
									</div>
									
										
               	   				</div>
               	   				<div ng-controller="myCtrl" class="row" style="background:linear-gradient(to top, black, #343);text-align:center;">
               	   						<label>SUPPLIER</label><hr style="margin-top:0px;">
               	   						<select name="productSupplierId" style="margin-top:0px;" >
               	   							<option ng-repeat="sup in suppList" value="{{sup.SupplierId}}">{{sup.supplierFirstName}}&nbsp;&nbsp;&nbsp;&nbsp;{{sup.supplierLastName}}&nbsp;&nbsp;&nbsp;&nbsp;{{sup.supplierEmail}}&nbsp;&nbsp;&nbsp;&nbsp;{{sup.supplierAddress}}</option>
               	   						
               	   						</select>
               	   						
               	   				</div>
               	   				<div class="row" style="margin:5px;">
        	   					<div class="col-xs-12 col-xs-offset-4">
        	   						<input type="submit" class="btn btn-danger" value="ADD PRODUCT TO DATABASE"/>
        	   					</div>
        	   					</div>
        	   					
        	   					</form>
        	   				
               	   		</div>
               	   </div>
        	   		 <div class="row viewprod" style="background:linear-gradient(to top, black, #343);margin-top:5px;" >
               	   		<div ng-controller="myCtrl">
							<div class="col-md-12">
								
									<div id="custom-search-input">
									<div class="input-group col-md-12" style="width:100%;">
										<input type="text" class="search-query form-control" placeholder="Search By Id, Name , Brand & More..." ng-model="seachproduct"/></span>
									</div>
								<div style=" text-align:center;margin-top :10px;margin-bottom : 10px;" class="row">
									 <div class="col-xs-6">
								 		<label>Jump To Page&nbsp;&nbsp;</label><input type="text" ng-model="currentPage" placeholder="Page Number" style="width:120px;"/>
									 </div>
									
									<div clas="col-xs-6">
										<button ng-hide="currentPage==1" ng-click="goPrev()"  class="btn btn-success">PREVIOUS</button>
								
										<button class="btn btn-info ">{{currentPage}}/{{pagesRequired}}</button>
								
										<button ng-hide="currentPage == pagesRequired" ng-click="goNext()" class="btn btn-success">NEXT</button>
								 	</div>
									
								</div>
							
							</div>
							
							<div  class="col-xs-4"  ng-repeat="prod in productList|filter:seachproduct | customFilter: 15 : currentPage-1 ">
					
							<a href="displaymodal?prodid={{prod.productId}}&id=${id} ">
							<img alt="TheShoeShop" src="resources/images/{{prod.productId}}.jpg" class="img-responsive img-thumbnail" style="height:100px;width:200px;cursor:pointer;">
							</a>
	
							</div>


										<div id="displayDetails"
											style="margin: auto; background-color: rgba(0, 0, 0, 0.4);">
											<div class="container">
												<div class="panel">
													<div class="panel-heading head"
														style="background-color: OliveDrab;">
														<a href="previous?id=${id}"><button
																style="float: right; cursor: pointer;"
																class="btn btn-danger">
																<big>&times;</big>
															</button></a>
													</div>
													<div class="panel-body"
														style="margin-top: 15px; background: linear-gradient(to bottom, #343, black);">
														<form action="updateproduct"
															onsubmit="return checkForUpdateError()" method="post"
															enctype="multipart/form-data" class="form-horizontal">
															<div class="row">
																<div class="col-xs-12 col-sm-4">
																	<label>BRAND</label> <input id="BrandChange2"
																		type="text" value="{{productList.productBrand}}"
																		name="productBrand"
																		placeholder="{{productList.productName}}"
																		class="form-control" />
																	<div id="BrandChange2Err"
																		style="color: coral; letter-spacing: 1px; font-size: 14px;"></div>
																	<input id="IdChange2" type="text"
																		value="{{productList.productId}}" name="productId"
																		hidden />
																</div>
																<div class="col-xs-12 col-sm-4">
																	<label>NAME</label> <input id="NameChange2" type="text"
																		value="{{productList.productName}}" name="productName"
																		placeholder="{{productList.productName}}"
																		class="form-control" />
																	<div id="NameChange2Err"
																		style="color: coral; letter-spacing: 1px; font-size: 14px;"></div>

																</div>
																<div class="col-xs-12 col-sm-4">
																	<label>DESCRIPTION</label> <input id="DescChange2"
																		type="text" value="{{productList.productDescription}}"
																		name="productDescription"
																		placeholder="{{productList.productDescription}}"
																		class="form-control" />
																	<div id="DescChange2Err"
																		style="color: coral; letter-spacing: 1px; font-size: 14px;"></div>

																</div>
															</div>

															<div class="row">
																<div class="col-xs-12 col-sm-2">
																	<label>PRICE</label> <input id="PriceChange2"
																		type="text" value="{{productList.productPrice}}"
																		name="productPrice"
																		placeholder="{{productList.productPrice}}"
																		class="form-control" />
																	<div id="PriceChange2Err"
																		style="color: coral; letter-spacing: 1px; font-size: 14px;"></div>

																</div>
																<div class="col-xs-12 col-sm-2">
																	<label>FOR</label> <input id="SexChange2" type="text"
																		value="{{productList.productSex}}" name="productSex"
																		placeholder="{{productList.productSex}}"
																		class="form-control" />
																	<div id="SexChange2Err"
																		style="color: coral; letter-spacing: 1px; font-size: 14px;"></div>

																</div>

																<div class="col-xs-12 col-sm-2">
																	<label>% OFF</label> <input id="DiscChange2"
																		type="text"
																		value="{{productList.productDiscountPercent}}"
																		name="productDiscountPercent"
																		placeholder="{{productList.productDiscountPercent}}"
																		class="form-control" />
																	<div id="DiscChange2Err"
																		style="color: coral; letter-spacing: 1px; font-size: 14px;"></div>

																</div>
																<div class="col-xs-12 col-sm-2">
																	<label>STOCK</label> <input id="StockChange2"
																		type="text" value="{{productList.productStock}}"
																		name="productStock"
																		placeholder="{{productList.productStock}}"
																		class="form-control" />
																	<div id="StockChange2Err"
																		style="color: coral; letter-spacing: 1px; font-size: 14px;"></div>

																</div>

																<div class="col-xs-12 col-sm-2">
																	<label>CATEGORY</label> <input id="CategoryChange2"
																		type="text" value="{{productList.productCategory}}"
																		name="productCategory"
																		placeholder="{{productList.productCategory}}"
																		class="form-control" />
																	<div id="CategoryChange2Err"
																		style="color: coral; letter-spacing: 1px; font-size: 14px;"></div>

																</div>

																<div class="col-xs-12 col-sm-2">
																	<label>IMAGE</label> <input type="file"
																		name="productImage" />

																</div>
																<div class="col-xs-12 col-sm-3">

																	<label>SUPPLIER ID</label> <input id="SupplierChange2"
																		value="{{productList.productSupplierId}}"
																		name="productSupplierId" class="form-control"
																		type="text" /> <input type="text" value="${id}"
																		name="id" hidden />
																</div>
															</div>

															<div
																style="margin-top: 30px; font-family: Courier; letter-spacing: 1px; font-size: 15px; margin-left: 40%;">
																<input type="submit" class="btn btn-warning"
																	value="UPDATE" />
															</div>
														</form>

														<div
															style="margin-top: 10px; font-family: Courier; letter-spacing: 1px; font-size: 15px; margin-left: 40%;">
															<form action="deleteproduct" onsubmit="return toDelete()"
																method="get">
																<input type="text" name="productid"
																	value="{{productList.productId}}" hidden /> <input
																	type="text" name="id" value="${id}" hidden /> <input
																	type="Submit" class="btn btn-danger" value="DELETE" />
															</form>
														</div>

													</div>
												</div>
											</div>



										</div>





									
							
							
						</div>
 							
 							
					</div>
						
					
						
               	 </div>
     </div>
     
     				
     				
     				
     				<div class="panel">
    				  <div class="panel-heading head">
    				  	<a href="#" id="expandid3" onclick="expand3()">
      	 					+</a><label style="white-space:nowrap;">&nbsp;CATEGORIES & SUPPLIERS</label>
    				  </div>
   			   		  <div class="panel-body collapseid3">
   			 			 <div class="row container">
        	   				<div class="row">
        	   				<div class="col-xs-12">
        	   					<button onclick="managecat()" class="btn btn-success">MANAGE CATEGORIES</button>
        	   					<button onclick="managesup()" class="btn btn-success">MANAGE SUPPLIERS</button>
        	   				</div>
        	   				</div>
        	   				<div  class="row managecategories" style="margin-top:5px;">
        	   					<div class="col-xs-12 col-md-5" style="border-right:1px solid white;margin-top:5px;float:left;">
        	   						<label style="margin-top:0px;">ADD CATEGORY</label>
        	   						<form action="addCategory" method="get" onsubmit="return checkCategory()" class="form-horizontal">
        	   							<div class="row">
        	   								<div class="col-xs-5">
        	   							<label style="margin-top:0px;"><small>NEW CATEGORY&nbsp;</small></label>
        	   								</div>
        	   								<div class="col-xs-5">
        	   							<input id="val1" type="text" name="name" placeholder="New Category" style="font-family:courier;border:none;background-color:#343;border-bottom:2px solid white;letter-spacing:1px;" required/>
        	   							<div id="val1err" style="color:coral;letter-spacing:1px;"></div>
        	   								</div>
        	   							<input type="text" name="adminid" value="${id}" hidden/>
        	   							
        	   								<div class="col-xs-2">
        	   							<input type="submit" class="btn btn-danger btn-xs" style="letter-spacing:1px;" value="ADD"/>
        	   								</div>
        	   							</div>
        	   						</form>
        	   						
        	   					</div>
        	   					<div class="col-xs-12 col-md-1" style="text-align:center;">
        	   					<label >OR</label></div>
        	   					<div ng-controller="myCtrl" class=" col-xs-12 col-md-5" style="border-left:1px solid white;margin-top:5px;float:right;">
        	   						<label style="margin-top:0px;">DELETE CATEGORY</label>
        	   						<form action="deleteCategory" method="get" class="form-horizontal">
        	   							<label style="margin-top:0px;"><small>SELECT TO DELETE</small></label>
        	   							<select name="id"  style="bcakground-color:#343;">
        	   								<option ng-repeat="cat in catList" value="{{cat.categoryID}}"  style="background-color:#343;">{{cat.categoryType}}</option>
        	   							</select>
        	   								<input type="text" value="${id}" name="adminid" hidden/>
        	   								<input type="submit" class="btn btn-danger btn-xs" style="letter-spacing:1px;" value="DELETE"/>
        	   							
        	   						</form>
        	   						
        	   					</div>
        	   				
        	   				</div>
        	   				
        	   				<div class=" managesuppliers">
        	   					<div class="row  supplier" style="width:99.5%;">
        	   						<label>&nbsp;&nbsp;
        	   						ADD SUPPLIER</label>
        	   						<form  onsubmit="return addsupplier()" action="addSupplier"  method="post" class="form-horizontal">
        	   							<div class="row">
        	   								<div class="col-xs-12 col-sm-6">
        	   									<label><small>FIRST NAME</small></label>
        	   									<input id="firstName" type="text" name="supplierFirstName" placeholder="First Name" class="form-control" required />
        	   									<div id="firstNameErr" style="color: coral; letter-spacing: 1px;"></div>
        	   								</div>
        	   								<div class="col-xs-12 col-sm-5">
        	   									<label><small>LAST NAME</small></label>
        	   									<input id="lastName" type="text" name="supplierLastName" placeholder="Last Name" class="form-control" required/>
        	   									<div id="lastNameErr" style="color: coral; letter-spacing: 1px;"></div>
        	   								</div>
        	   							</div>
        	   							<div class="row">
        	   								<div class="col-xs-12 col-sm-6">
        	   									<label><small>ADDRESS</small></label>
        	   									<textarea  name="supplierAddress"  class="form-control" required>Address</textarea>
        	   								</div>
        	   								<div class="col-xs-12 col-sm-5">
        	   									<label><small>EMAIL</small></label>
        	   									<input type="email" name="supplierEmail" placeholder="Email" class="form-control" required/>
        	   								</div>
        	   								<input type="text" value="${id}" name="id" hidden/>
        	   							</div>
        	   						
        	   							<div class="row" style="margin-top:15px;">
        	   								<div class="col-xs-12 col-xs-offset-4">
        	   							
        	   									<input type="submit" value="ADD SUPPLIER" class="btn btn-danger" />
        	   								</div>
        	   							</div>
        	   						
        	   						</form>
        	   					</div>
        	   					<div class="row deletesupplier" style="margin-top:5px; width: 99.5%;">
        	   						<div class="col-xs-12" ng-controller="myCtrl">
        	   							<label>DELETE SUPPLIER</label>
        	   							<form action="deleteSupplier" method="get">
        	   									<label><small>SELECT TO DELETE</small></label>
        	   									<select name="catid">
        	   										<option ng-repeat="sup in suppList" value="{{sup.SupplierId}}">{{sup.supplierFirstName}}&nbsp;&nbsp;{{sup.supplierLastName}}&nbsp;&nbsp;{{sup.supplierAddress}}&nbsp;&nbsp;{{sup.supplierEmail}}</option>
        	   									</select>
        	   									<input type="text" name="id" value="${id}" hidden/>
        	   									<input type="submit" class="btn btn-danger" value="REMOVE SUPPLIER"/>
        	   							</form>
        	   						
        	   						</div>
        	   						
        	   						
        	   					</div>
        	   				
        	   				</div>
        	   				
               	   	</div>
   			 	</div>
  		  	</div>
     				
     				
     				
     				
     				
     				
     	
     		
     		
     		
     	
     	
     	
     	
     
   				 <div>
    				  <div class="panel-heading head">
    				  	<a href="#" id="expandid2" onclick="expand2()">
      	 					+</a><label>&nbsp;PERSONAL DETAILS</label>
    				  </div>
   			   	<div class="panel-body collapseid2">
   			 			 <div class="row container">
        	   				<div class="col-xs-12">
        	   					<form onsubmit="return validate()" action="updateUserAdmin" method="post" accept-charset="UTF-8">
        	   						<div class="row styling">
        	   							<div class="col-xs-4">
        	   								<label>FIRST NAME*</label>
        	   								<input id="fname" onclick="removepassword()" title="First Name" type="text" class="form-control" name="signUpFirstName" value="${AdminDetails.signUpFirstName}" required/> 
        	   								<div id="fnameError" style="color: coral;letter-spacing: 1px; font-size:14px;"></div>
							
        	   							</div>
        	   						<div class="col-xs-4">
        	   							<label>LAST NAME*</label>
        	   							<input id="lname" type="text" onclick="removepassword()" title="Last Name" name="signUpLastName" class="form-control" value="${AdminDetails.signUpLastName}" required/> 
        	   							<div id="lnameError" style="color: coral;letter-spacing: 1px; font-size:14px;"></div>
							
        	   						</div>
        	   					
        	   					</div>
        	   					<div class="row styling">
        	   						<div class="col-xs-4">
        	   							<label>EMAIL*</label>
        	   							<input id="email" type="email"  title="Email ID" name="signUpEmail" class="form-control" value="${AdminDetails.signUpEmail}"  readonly/> 
        	   							<div id="emailError"></div>
							
        	   						</div>
        	   						<div class="col-xs-4">
        	   							<label>CONTACT NUMBER*</label>
        	   							<input id="phone" type="tel" onclick="removepassword()" name="signUpPhone" class="form-control" title="Contact Number" value="${AdminDetails.signUpPhone}" required/> 
        	   							<div id="phoneError" style="color: coral;letter-spacing: 1px; font-size:14px;"></div>
							
        	   						</div>
        	   					
        	   					</div>
        	   					<div class="row styling">
        	   						<div class="col-xs-4">
        	   							<label>ADDRESS</label>
        	   							<textarea id="address" name="signUpAddress" onclick="removepassword()" class="form-control">${AdminDetails.signUpAddress}</textarea> 
        	   							
        	   						</div>
        	   					
        	   					</div>
        	   					
        	   					<div class="row styling">
        	   						<div class="col-xs-4">
        	   							<label>PASSWORD*</label>
        	   							<input id="password" type="password"  name="signUpPassword" class="form-control" value="${AdminDetails.signUpPassword}" title="Min 5 and Max 15 Characters" required/> 
        	   							<div id="passwordError" style="color: coral;letter-spacing: 1px; font-size:14px;"></div>
							
        	   						</div>
        	   						<div class="col-xs-6" id="hideConfirm">
        	   							<label>CONFIRM PASSWORD*</label>
        	   							<input id="confirmpassword" type="password"  name="confirmPassword" class="form-control pass" title="Must Be Filled Last. Only Before Updating"required/> 
        	   							<div  style="color: coral;letter-spacing: 1px; font-size:14px;">*ELEMENT SHOULD BE FILLED LAST</div>
										<div id="confirmpasswordError" style="color: coral;letter-spacing: 1px; font-size:14px;"></div>
							
        	   						</div>
        	   					</div>
        	   					
        	   					<div id="update" class="row" style="text-align:center;margin-top:10px;">
        	   					<input type="Submit"  class="btn btn-danger" value="UPDATE
        	   					">
        	   					</div>
        	   					
        	   				</form>
        	   			</div>
               	   </div>
   			 		
   			 		
   			 
   			 </div>
  		  </div>
		</div>
	</div>
  </div>	
</div>
</div>


<script>

var element1 = document.getElementById("expandid1").innerHTML;
var count1=1;
function expand1()
{
	
	if(count1 == 0)
		{
		document.getElementById("expandid1").innerHTML = "-";
		$(".collapseid1").slideDown(500);
		count1 = 1;
		}
	else
		{
		document.getElementById("expandid1").innerHTML = "+";
		$(".collapseid1").slideUp(500);
		count1 = 0;
		}
	
}

var count2=0;
function expand2()
{
	
	if(count2 == 0)
		{
		document.getElementById("expandid2").innerHTML = "-";
		$(".collapseid2").slideDown();
		count2 = 1;
		}
	else
		{
		document.getElementById("expandid2").innerHTML = "+";
		$(".collapseid2").slideUp();
		count2 = 0;
		}
	
}


var count3=0;
function expand3()
{
	
	if(count3 == 0)
		{
		document.getElementById("expandid3").innerHTML = "-";
		$(".collapseid3").slideDown();
		count3 = 1;
		}
	else
		{
		document.getElementById("expandid3").innerHTML = "+";
		$(".collapseid3").slideUp();
		count3 = 0;
		}
	
}



function addprod()
{
	$(".viewprod").hide();
	$(".addprod").show();
}

function viewprod()
{
	$(".addprod").hide();
	$(".viewprod").show();
}

function managecat()
{
	$(".managecategories").show();
	$(".managesuppliers").hide();
}

function managesup()
{
	$(".managecategories").hide();
	$(".managesuppliers").show();
}



function gone()
{
	var going =document.getElementById("displayDetails");
	going.style.zIndex="0";
	going.style.display= "none";
}

$( window ).on( "load", function(){
	var dis = ${displayModal};
	
	if( dis == true)
	{
	$(".addprod").hide();
	$(".viewprod").show();	

	$("#displayDetails").show();
	document.getElementById("displayDetails").style.zIndex ="20";
	document.getElementById("displayDetails").style.display= "block";
	
	}
	else
		{
		$(".addprod").hide();
		$(".viewprod").show();	
		
		}
	
});


</script>
<%@ include file="AdminFooter.jsp" %>