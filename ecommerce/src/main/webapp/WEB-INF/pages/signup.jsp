<%@ include file="header.jsp" %>
<head>
	<link rel="stylesheet" href="./resources/css/bootstrap.min.css" type="text/css">
	<script type="text/javascript" src="./resources/js/bootstrap.min.js"></script>
	<script src="./resources/js/jquery-3.2.1.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="./resources/css/Style.css" rel="stylesheet" type="text/css">
    
<script>
	document.getElementById("signinfeature").children[0].style.display="none";
	document.getElementById("signinfeature").children[1].style.display="none";

	function validateForm()
	{
		var fnameErr =document.getElementById("fnameError");
		var lname =document.getElementById("lname").value;
		var lnameErr =document.getElementById("lnameError");
		var fname =document.getElementById("fname").value;
		fname = fname.toLowerCase();
		lname = lname.toLowerCase();
		if(fname == "null")
			  {
			   fnameErr.innerHTML = "*Invalid Name";
			   return false;
			  }
		else if( fname.length == 1)
			  {
			  fnameErr.innerHTML = "*Name Too Short";
			  return false;
			  }
		  if( lname.toLowerCase() == "null")
			  {
			  lnameErr.innerHTML ="*Invalid Last Name";
			  return false;
			  }
		  else if( lname.length == 1)
			  {
			  lnameErr.innerHTML = "*Last Name Too Short";
			  return false;
			  }
				
		var phone=document.getElementById("phone").value;
		if( phone.length != 10)
			{
			document.getElementById("phoneError").innerHTML = "*Enter 10 Digit Valid Number";
			return false;
			}
	
		var password = document.getElementById("password").value;
		var confirm = document.getElementById("confirmpassword").value;
		var passError = document.getElementById("passwordError");
		var confirmError = document.getElementById("confirmpasswordError");
		if(password.length < 5)
			{
			passError.innerHTML = "*Password Too Short";
			return false;
			}
		if(password.length > 15)
		{
		passError.innerHTML = "*Password Too Long";
		return false;
		}
		
		if(confirm.length < 5)
		{
		confirmError.innerHTML = "*Password Too Short";
		return false;
		}

		if(confirm.length > 15)
		{
		confirmError.innerHTML = "*Password Too Long";
		return false;
		}
		
		if( password !== confirm)
			{
			confirmError.innerHTML = "*Password Did Not Match";
			return false;
			}
		
	return true;
	}
</script>
</head>

	<div class="row" style="margin-top:50px;">
		<div class="col-xs-12 col-sm-8 col-sm-offset-2">
			<div class="row">
				<div class="signUpHeading">
					<h3>SIGN UP</h3>
					<hr style="margin-top: 0px;"/>
				</div>
		  	</div>
		  	<div class="row">
				<div class="col-xs-12 col-sm-10 col-sm-offset-1" style="border-right: 1px solid white;">
					<form onsubmit="return validateForm()" name="form" action="createUser" method="post" class="form-horizontal" accept-charset="UTF-8"> 
						<div class="row details">
							<div class="col-xs-12 col-sm-2">
							<label>Name&nbsp;*</label>
							</div>
							<div class="col-xs-12 col-sm-5">
							<input id="fname" type="text" placeholder="First Name" name="signUpFirstName" class="form-control" title="Your First Name" required/>
							<div id="fnameError" style="color: coral;letter-spacing: 1px; font-size:14px;"></div>
							</div>
							<div class="col-xs-12 col-sm-5 ">
							<input id="lname" type="text" placeholder="Last Name" name="signUpLastName" class="form-control" title="Your Last Name" required/>
							<div id="lnameError" style="color: coral;letter-spacing: 1px; font-size:14px;"></div>
							
							</div>
						</div>
					  	<div class="row details">
							<div class="col-xs-12 col-sm-2">
							<label>Address&nbsp;</label>
							</div>
							<div class="col-xs-12 col-sm-10 text-area">
							<textarea id="address" name="signUpAddress" placeholder="Address" title="Address" value="null"></textarea>
							</div>
						
						</div>
						<div class="row details">
							<div class="col-xs-12 col-sm-6">
								<div class="col-xs-12">
									<label>Email&nbsp;*</label>
								
								</div>		
								<div class="col-xs-12">
									<input id="email" type="email" name="signUpEmail" placeholder="Email" class="form-control" title="Email ID" required/>
									<div id="emailError"></div>
							
								</div>		
							
							</div>
						
							<div class="col-xs-12 col-sm-6">
								<div class="col-xs-12">
									<label>Phone&nbsp;* </label>
								
								</div>		
									<div class="col-xs-12">
									<input id="phone" type="tel" name="signUpPhone" placeholder="Contact Number" class="form-control" title="10 Digit Phone Number" required/>
									<div id="phoneError" style="color: coral;letter-spacing: 1px; font-size:14px;"></div>
							
								</div>		
							
							</div>
					
						</div>
						<div class="row details">
							<div class="col-xs-12 col-sm-6">
								<div class="col-xs-12">
									<label>Password&nbsp;*</label>
								
								</div>		
								<div class="col-xs-12">
									<input id="password" type="password" name="signUpPassword" placeholder="Password" class="form-control" title="Min 5 and Max 15 characters" required/>
								   <div id="passwordError" style="color: coral;letter-spacing: 1px; font-size:14px;"></div>
							
								</div>		
							
							</div>
						
							<div class="col-xs-12 col-sm-6">
								<div class="col-xs-12">
									<label>Confirm Password&nbsp;* </label>
								
								</div>		
									<div class="col-xs-12">
									<input id="confirmpassword" type="password" name="signUpConfirmPassword" placeholder="Confirm Password" class="form-control" required/>
									<div id="confirmpasswordError" style="color: coral;letter-spacing: 1px; font-size:14px;"></div>
							
								</div>		
							
							</div>
					
						</div>
						
						<div class="row details">
							<div class="col-xs-12 col-sm-offset-3">
								<input type="submit" value="SIGN UP" class="btn btn-success"/>
								<a href="login"><button type="button" value="EXISTING USER? LOGIN" class="btn btn-danger">EXISTING USER? LOGIN</button></a>
							
							</div>
													
						</div>
					</form>
				
				
				</div>	  	
		  	
		  	
		  	</div>
		
		</div>
	</div>
<%@ include file="footer.jsp" %>






</body>
</html>