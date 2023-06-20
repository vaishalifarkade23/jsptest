<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>SignUp</title>
  </head>
  <body>
   
   <div class="cotainer">
        <div class="row justify-content-center">
            <div class="col-md-8">
                    <div class="card">
                        <div class="card-header">Register Form</div>
                        <div class="card-body">
                            <form action="2signupserver.jsp" method="post" onsubmit="return validate()">
                                <div class="form-group row">
                                    <label for="full_name" class="col-md-4 col-form-label text-md-right">Full Name</label>
                                    <div class="col-md-6">
                                        <input type="text" id="fullname" class="form-control" name="fullname">
                                    </div>
                                </div>
                                
                                
           <small class="text-danger" id="chkfullname"></small>


                                <div class="form-group row">
                                    <label for="email_address" class="col-md-4 col-form-label text-md-right">E-Mail</label>
                                    <div class="col-md-6">
                                        <input type="text" id="email" class="form-control" name="email">
                                    </div>
                                </div>
                                
           <small class="text-danger" id="chkemail"></small> 
           
            <div class="form-group row">
                                    <label for="full_name" class="col-md-4 col-form-label text-md-right">User Name</label>
                                    <div class="col-md-6">
                                        <input type="text" id="username" class="form-control" name="username">
                                    </div>
                                </div>
                                
                                
           <small class="text-danger" id="chkusername"></small>
                               
                                

                                <div class="form-group row">
                                    <label for="user_name" class="col-md-4 col-form-label text-md-right">Password</label>
                                    <div class="col-md-6">
                                        <input type="password" id="user_name" class="form-control" name="password">
                                    </div>
                                </div>
                                
        <small class="text-danger" id="chkpassward"></small>
        
                                <div class="form-group row">
                                    <label for="user_name" class="col-md-4 col-form-label text-md-right">  Confirm Password</label>
                                    <div class="col-md-6">
                                        <input type="password" id="user_name2" class="form-control" name="cpassword">
                                    </div>
                                </div>
                                
        <small class="text-danger" id="chkCpassward"></small>
        
                                 <div class="form-group row">
                                    <label for="user_name" class="col-md-4 col-form-label text-md-right">Gender</label>
                                    <div class="col-md-6">
                                        <select name="comboaction" class="form-control" id="gender">
        									<option value="Male"  >Male</option>
        									<option value="Female" >Female</option>
      									</select>
                                    </div>
                                </div>
                                
          <small class="text-danger" id="chkgender"></small>
                               
        						<div class="form-group row">
                                    <label for="user_name" class="col-md-4 col-form-label text-md-right">City</label>
                                    <div class="col-md-6">
                                        <select name="combocity" class="form-control" id="city">
                                             <option value="select"  >select</option>
        									<option value="Nagpur"  >Nagpur</option>
        									<option value="Chandrapur" >Chandrapur</option>
        									<option value="Hydrabad"  >Hydrabad</option>
        									<option value="Chennai" >Chennai</option>
        									<option value="Delhi"  >Delhi</option>
        									<option value="Mumbai" >Mumbai</option>
        									
      									</select>
                                    </div>
                                </div>
                                
          <small class="text-danger" id="chkgender"></small>
				
								<div class="form-group row">
                                    <label for="user_name" class="col-md-4 col-form-label text-md-right">User Type</label>
                                    <div class="col-md-6">
                                        <select name="combotype" class="form-control" id="user">
                                             <option value="select"  >select</option>
        									<option value="Admin"  >Admin</option>
        									<option value="Student" id="student2">Student</option>
      									</select>
                                    </div>
                                </div>
                                
          <small class="text-danger" id="chkuser"></small>
          
           <div class="form-group row">
       	            <label for="user_name" class="col-md-4 col-form-label text-md-right">Address :</label>
       	             <div class="col-md-6">
				    <textarea rows="2" cols="" name="fulladdress" class="form-control"></textarea>
			        </div>
                      </div>         
                           	<div class="col-md-6 offset-md-4">
                                        <button type="submit" class="btn btn-primary">
                                        Register
                                        </button>
                                </div>
                                
                            </form>
                        </div>
                    </div>
            </div>
        </div>
    </div>
    
    
    
<script>
function validate() {
	//name
	var fullname=document.getElementById('fullname').value;
    var letters = /^[A-Za-z\s]+$/;
    
  //email
	var email=document.getElementById('email').value;
	var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	
	//password
	var password=document.getElementById('user_name').value;
	var passw=  /^[A-Za-z]\w{7,14}$/;
	
	//fordropdown
	var user=document.getElementById('user').value;
	
	
	//for male and Female
	var genderM=document.getElementById('genm').value;
	var genderF=document.getElementById('genf').value;
	
	if(fullname=="" ||  fullname==null)
	{
	    document.getElementById('chkfullname').innerHTML="*full name required";
		document.getElementById('fullname').focus;
		return false;
    }
else
	if(!fullname.match(letters))
	{
		 document.getElementById('chkfullname').innerHTML="Alpha numeric value should be in letter";
	     document.getElementById('fullname').focus;
		return false;
	}
	else
		   if(email=="" ||  email==null)
		  {
		        document.getElementById('chkemail').innerHTML="* email Id is Requied";
			     document.getElementById('email').focus;
			     return false;
	    }
	
	 else
	  		if(!email.match(mailformat))
			{
		     		 document.getElementById('chkemail').innerHTML="Alpha numeric value should be in letter";
			 		 document.getElementById('email').focus;
					return false;
			}

	
	  else
			if(password=="" ||  password==null)
			{
			    document.getElementById('chkpassward').innerHTML="* Password is Requied";
				document.getElementById('user_name').focus;
				return false;
		    }
	  else
		  if(!passw.match())
			{
			      document.getElementById('chkpassward').innerHTML="Alpha numeric value should be in letter";
				  document.getElementById('user_name').focus;
					return false;
			}
		
	else
		if(user=='Select ' || user ==""){
			document.getElementById('chkuser').innerHTML = "*Please Select City!";
			document.getElementById('user').focus();
			return false;
		}
			
	
	 
			 else
				 return true;
			
		}

</script>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>