<%@ include file="header.jsp" %>
<head>
	<link rel="stylesheet" href="./resources/css/bootstrap.min.css" type="text/css">
	<script type="text/javascript" src="./resources/js/bootstrap.min.js"></script>
	<script src="./resources/js/jquery-3.2.1.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="./resources/css/Style.css" rel="stylesheet" type="text/css">
     
</head>
<body style="background: linear-gradient(to right , black, #343 , black);">
<div class="container" style="margin-top: 50px;">
	<div class="col-xs-12 col-sm-6 col-sm-offset-3">
		<div class="row ">
			<div class="row logindetails">
				<div class="col-xs-12">
					<h3 style="font-size:18px;padding-top:5px; padding-bottom:10px;"><% if(request.getAttribute("count")==null)%>LOG IN<%else if(request.getAttribute("count")=="User Already Present") %>USER ALREADY EXIST.PLEASE LOGIN<%else%> RE-ENTER CREDENTIALS </h3>
					
				</div>
			</div>
			<div class="row">
			  <form action="logincheck" method="post" onsubmit="return validatelogin()" accept-charset="UTF-8">
				<div class="col-xs-12  loginform">
					<label>Email ID&nbsp;*</label>	
					<input id="mail" type="email" name="email" placeholder="Email ID" class="form-control" title="Email ID" required/>
				
				</div>
				<div class="col-xs-12  loginform">
					<label>Password&nbsp;*</label>	
					<input id="passwordlogin" type="password" name="password" placeholder="Password" class="form-control" title="Min 5 and Max 15 Characters" required/>
					<div id="err" onload="checkMessage()" style="color: coral;letter-spacing: 1px; font-size:14px;"></div>
				</div>
					<div class="col-xs-12  loginform">
						<input type="submit" value="LOG IN"/>
						<a href="signup"><button type="button" class="btn btn-danger">NEW USER? SIGN UP</button></a>
						
				</div>
			  </form>
			</div>
		</div>
	
	</div>


</div>

<script>
	document.getElementById("signinfeature").children[0].style.display="none";
	document.getElementById("signinfeature").children[1].style.display="none";
	
	var msg = '${message}';
	document.getElementById("err").innerHTML = msg;
	
	function validatelogin()
	{
	 var err = document.getElementById("err");
	 var pass = document.getElementById("passwordlogin").value;
	 if( pass.length <5)
		 {
		 err.innerHTML = "*Password Too Short";
		 return false;
		 }
	 if( pass.length >15)
	 {
	 err.innerHTML = "*Password Too Long";
	 return false;
	 }
	}
	
</script>

</body>
<%@ include file="footer.jsp" %>