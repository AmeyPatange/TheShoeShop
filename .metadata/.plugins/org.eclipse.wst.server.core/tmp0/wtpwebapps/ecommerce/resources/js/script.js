/* **Admin Page Script*/

function removepassword()
{
	$("#hideConfirm").show();
	$(".pass").val("");
	$("#update").show();
}


function validate()
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


function checkForError()
{
	console.log("Hello");
	var name = document.getElementById("nameInput").value;
	if( name== null || name =="null" || name== "" || name== "---")
		{
		document.getElementById("nameInputErr").innerHTML = "Invalid Product Name";
		return false;
		}
	var desc = document.getElementById("desc").value;
	if( desc == null || desc == "null" || desc == "" || desc.length== 1)
		{
		document.getElementById("descInputErr").innerHTML = "Invalid Product Description";
		return false;
		}
	var price = document.getElementById("price").value;
	if( price < 300 || price > 7000 || price.match(/[a-z]/i)== true)
		{
		document.getElementById("priceInputErr").innerHTML = "Invalid Product Price";
		return false;
		}
	var disc = document.getElementById("discount").value;
	if( disc <0 || disc > 75 || disc.match(/[a-z]/i) == true)
		{
		document.getElementById("discountInputErr").innerHTML = "Invalid Product Discount";
		return false;
		}
	var stock = document.getElementById("stock").value;
	if( stock < 10 || stock > 5000 || stock.match(/[a-z]/i) ==true )
		{
		document.getElementById("stockInputErr").value;
		return false;
		}
	var select = document.getElementById("Brand").value;
	if( select == "" || select =="null" || select == null || select.match(/[a-z]/i) ==true )
		{
		document.getElementById("BrandErr").innerHTML = "Invalid Brand";
		return false;
		
		}

	
	return true;
}

function checkForUpdateError()
{
	var name = document.getElementById("NameChange2").value;
	if( name== null || name =="null" || name== "" || name== "---")
		{
		document.getElementById("NameChange2Err").innerHTML = "Invalid Product Name";
		return false;
		}
	var desc = document.getElementById("DescChange2").value;
	if( desc == null || desc == "null" || desc == "" || desc.length== 1)
		{
		document.getElementById("DescChange2Err").innerHTML = "Invalid Product Description";
		return false;
		}
	var price = document.getElementById("PriceChange2").value;
	if( price < 300 || price > 7000 || price.match(/[a-z]/i)== true)
		{
		document.getElementById("PriceChange2Err").innerHTML = "Invalid Product Price";
		return false;
		}
	var disc = document.getElementById("DiscChange2").value;
	if( disc <0 || disc > 75 || disc.match(/[a-z]/i) == true)
		{
		document.getElementById("DiscChange2Err").innerHTML = "Invalid Product Discount";
		return false;
		}
	var stock = document.getElementById("StockChange2").value;
	if( stock < 10 || stock > 5000 || stock.match(/[a-z]/i) ==true )
		{
		document.getElementById("StockChange2Err").value;
		return false;
		}
	var select = document.getElementById("BrandChange2").value;
	if( select == "" || select =="null" || select == null || select.match(/[a-z]/i) ==true )
		{
		document.getElementById("BrandChange2Err").innerHTML = "Invalid Brand";
		return false;
		
		}

	
	return true;

	
}

function checkCategory()
{
	var value=document.getElementById("val1").value;
	if(value == "null" || value.length == 1 || value.match(/[0-9]/i) == true || value == "Invalid Brand")
		{
		document.getElementById("val1err").innerHTML= "Invalid Brand";
		}
	else
		{
		document.getElementById("val1err").innerHTML= "";
		}
}

function toDelete()
{
	    var r = confirm("Do You Want To Delete?");
	    if (r == true) {
	    		return true;
	    } else {
	        return false;
	    }

}

function addsupplier()
{
	console.log("Hello");
	var fname = document.getElementById("firstName").value;
	if( fname =="" || fname ==" " || fname== "null" || fname.match(/[0-9]/i)== true)
		{
		document.getElementById("firstNameErr").innerHTML = "Invalid Name";
		return false;
		}
	var lname = document.getElementById("lastName").value;
	if( lname == "" || lname == " " || lname == "null" || lname.match(/[0-9]/i) == true)
		{
		document.getElementById("lastNameErr").innerHTML = "Invalid Name";
		return false;
		}
	return true;
} 