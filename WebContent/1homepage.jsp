                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    <%@ page import="java.sql.*" %>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js">  
    </script>
      
    <title>Home Page</title>
  </head>
  
 <style>
.container{
background-color: white;
}
</style>
  
  <body>
  
<%
	
	//int id = (Integer)session.getAttribute("id");
	String hname = "";
	String hemail = (String)session.getAttribute("lemail");
	String hpassword = "";
	String husertype = "";
	int hgender = 0;
	String himage="";
	//out.println(hname);
	
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbjsp", "root", "");
		String sql = "select * from adminregtable where email = '"+hemail+"'";
		PreparedStatement pst = con.prepareStatement(sql);
		ResultSet rs = pst.executeQuery();
		if(rs.next())
		{
			hname = rs.getString("fullname");
			hemail = rs.getString("email");
			hpassword = rs.getString("password");
			husertype = rs.getString("usertype");
			hgender = rs.getInt("gender");
			himage = rs.getString("image");
			//out.println(hemail);
		}
		
	}
	catch(Exception ex)
	{
		out.println("Exception : "+ex);
	}
%>   

<div class="container">
<h1 style="text-align: center;">Home Page</h1>
<nav class="navbar justify-content-between" style="background-color: #e3f2fd;">
<img src="<%= himage%>" class="rounded-circle mb-3" style="width: 100px;" />

  <h5 class="mb-2"><strong>Upload Image</strong></h5>
<label class="text-SlateBlue font-weight-bold">Welcome <%=hname%></label>
<ul class="nav">
	<li class="nav-item">
		<a class="nav-link" href="#">Home</a>
	</li>
	<li class="nav-item">
		<a class="nav-link" href="#">Java</a>
	</li>
	<li class="nav-item">
		<a class="nav-link" href="#">CSS</a>
	</li>
	<li class="nav-item">
		<a class="nav-link" href="#">HTML</a>
	</li>
	<li class="nav-item">
		<a class="nav-link" href="#">Javascript</a>
	</li>
</ul>
<form class="form-inline">
	<a href="index.jsp"><i class="fa fa-power-off" style="font-size:24px"></i></a>
</form>
</nav>
<div class="row">

<%
	if(husertype.equalsIgnoreCase("admin")){
	
%>

<div class="col col-lg-3 col-md-3 col-sm-12 col-xs-12">
<ul class="list-group">
	<li class="list-group-item">
		<a class="list-group-item-action" href="#oops"></a>
	</li>
	<li class="list-group-item">
		<a class="list-group-item-action" href="#"></a>
	</li>
	<li class="list-group-item">
		<a class="list-group-item-action" href="#">OOPs</a>
	</li>
	<li class="list-group-item">
		<a class="list-group-item-action" href="#">SQL</a>
	</li>
	<li class="list-group-item">
		<a class="list-group-item-action" href="#">HTML</a>
	</li>
	<li class="list-group-item">
		<a class="list-group-item-action" href="#">CSS</a>
	</li>
	<li class="list-group-item">
		<a class="list-group-item-action" href="#">JavaScript</a>
	</li>
	<li class="list-group-item">
		<a class="list-group-item-action" href="#">Bootstrap</a>
	</li>
	<li class="list-group-item">
		<a class="list-group-item-action" href="#">JSP</a>
	</li>
	<li class="list-group-item">
		<a class="list-group-item-action" href="#">Servlet</a>
	</li>
</ul>
</div>

<%
	}else{
%>

<div class="col col-lg-3 col-md-3 col-sm-12 col-xs-12">
<ul class="list-group">
	<li class="list-group-item">
		<a class="list-group-item-action" href="#"><span id="profileitem">Profile</span></a>
	</li>
	<li class="list-group-item">
		<a class="list-group-item-action" href="#"><span id="tableitem">Table View</span></a>
	</li>
	<li class="list-group-item">
		<a class="list-group-item-action" href="#"><span id="emailitem">Send Email</span></a>
	</li>
	<li class="list-group-item">
		<a class="list-group-item-action" href="#"><span id="passworditem">Create New Password</span></a>
	</li>
	<li class="list-group-item">
		<a class="list-group-item-action" href="#"><span id="uploaditem">Upload</span></a>
	</li>
	<li class="list-group-item">
		<a class="list-group-item-action" href="#"><span id="uploadprofileitem">Upload profile</span></a>
	</li>
	<li class="list-group-item">
		<a class="list-group-item-action" href="#">Account</a>
	</li>
	<li class="list-group-item">
		<a class="list-group-item-action" href="#">Course</a>
	</li>
	<li class="list-group-item">
		<a class="list-group-item-action" href="#">Inbox</a>
	</li>
	<li class="list-group-item">
		<a class="list-group-item-action" href="#">Help</a>
	</li>
	<li class="list-group-item">
		<a class="list-group-item-action" href="#">Question</a>
	</li>
</ul>
</div>

<%
}
%>

<div class="col col-lg-9 col-md-9 col-sm-12 col-xs-12">

<!-- Form Section -->
<section id="profile">
<form action="#">

<div class="form-group">
	<label>Full Name</label>
	<input type="text" class="form-control" name="fullname" value="<%=hname%>" disabled>
</div>

<div class="form-group">
	<label>E-Mail</label>
	<input type="text" class="form-control" name="email" value="<%=hemail%>" disabled>
</div>

<div class="form-group">
	<label>Password</label>
	<input type="password" class="form-control" name="password" value="<%=hpassword%>" disabled>
</div>

<div class="form-group">
	<label>User Type</label>
	<select class="form-control" name="">
		<option
		<%
			if(husertype.equalsIgnoreCase("admin")){
		%>
		selected
		<%
			}else{
		%>
		disabled
		<%
		}
		%>
		>Admin
		</option>
		<option 
		<%
			if(husertype.equalsIgnoreCase("Student")){
		%>
		selected
		<%
			}else{
		%>
		disabled
		<% 
		}
		%>
		>Student
		</option>
	</select>
</div>

<div class="form-group">
	<label>Gender</label>
	<div class="form-check">
	<input type="radio" name="gender" class="form-check-input" 
	<%
		if(hgender==0){
	%>
	checked
	<%
		}else{
	%>
	disabled
	<% 
	}
	%>
	>
	<label class="form-check-label">Male</label>
	<input type="radio" name="gender" 
	<%
		if(hgender==1){
	%>
	checked
	<%
		}else{
	%>
	disabled
	<% 
	}
	%>
	>
	<label class="form-check-label">Female</label>
	</div>
	</div>

</form>
</section>

<!-- Tabel Section -->
<section id="tableview">
<div class="container">
  <h2>Filterable Table</h2>
  <p>Type something in the input field to search the table for user names or emails:</p>  
  <input class="form-control" id="myInput" type="text" placeholder="Search..">
  <br>
  <form action="1tableserver.jsp" method="post">
  <table class="table table-bordered table-striped" id="table">
  
    <thead>
      <tr>
      	<th>Select</th>
      	<th>ID</th>
        <th>FullName</th>
        <th>Email</th>
        <th>Password</th>
        <th>Usertype</th>
         <th>Gender</th>
      </tr>
    </thead>
    
    <tbody id="myTable">
      
    <% 
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbjsp", "root", "");
        String sql = "select * from adminregtable";
        PreparedStatement pst = con.prepareStatement(sql);
        ResultSet rs = pst.executeQuery();
        while(rs.next())
        {
        	%>
        	<tr>
        		<td><input type="checkbox" id="checkboxid" name="checkboxname" value=<%= rs.getInt("id")%>></td>
        		<td><%= rs.getInt("id")%></td>
        		<td><%= rs.getString("fullname")%></td>
        		<td><%= rs.getString("email")%></td>
        		<td><%= rs.getString("password")%></td>
        		<td><%= rs.getString("usertype")%></td>
        		<td><%= rs.getString("gender")%></td>
        	</tr>
        	<%
		}
	}
	catch (Exception ex) 
	{
		out.print("Exception : "+ex);
	}
	%>
      
    </tbody>
  </table>
  			<div class="col-md-6 offset-md-4">
        		 <button type="submit" class="btn btn-primary" name="deletebtn" onclick="deleteRow();">Delete</button>
            </div>
  </form>
</div>
</section>

<!-- Email Section -->
<section id="emailview">
<div class="container">
    <div class="row">
        <div class="col">
            <div class="card">
                <div class="card-header bg-primary text-white"><i class="fa fa-envelope"></i> Contact us.
                </div>
                <div class="card-body">
                    <form action="sendemail.jsp">
                        <div class="form-group">
                            <label for="toemail">To</label>
                            <input type="email" class="form-control" id="toemail" aria-describedby="emailHelp" name="to" required>
                        </div>
                        <div class="form-group">
                            <label for="fromemail">From</label>
                            <input type="email" class="form-control" id="fromemail" aria-describedby="emailHelp" name="from" required>
                            <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                        </div>
                         <div class="form-group">
                            <label for="message">Subject</label>
                            <input class="form-control" id="subject"   name="sub" required>
                        </div>
                        <div class="form-group">
                            <label for="message">Message</label>
                            <textarea class="form-control" id="message" rows="6"  name="mess" required></textarea>
                        </div>
                        <div class="mx-auto">
                        <button type="submit" class="btn btn-primary text-right" >Send</button></div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
                    
</section>
<!-- Create new password -->
<section id="passwordview">
<div class="container">
  	<div class="row">
  	
  	<div class="col col-lg-2 col-md-6 col-sm-6 col-xs-12">
  	</div>
  
  	<div class="col col-lg-8 col-md-6 col-sm-6 col-xs-12">
  	<div class="modal-body" >
  	<div style="border:thin solid black; padding:20px">
  	<form action="enterNewPasswordServer.jsp" method="post">
  
  	<div class="form-group">
  		<div class="col-md-5">
  			<label>New Password</label>
  			<input type="text" name="newpassword" class="form-control">
  		</div>
  	</div>
  	
  	<div class="form-group">
  		<div class="col-md-5">
  			<label>Confirm Password</label>
  			<input type="password" name="confpassword" class="form-control">
  		</div>
  	</div>
  	
  	<div class="form-group">
    	<div class="col-md-9">
        	<button type="submit" class="btn btn-info">Reset</button>
        </div>
    </div>
    
  	</form>
  	</div>
  	</div>
 	</div>
 	
 	<div class="col col-lg-2 col-md-6 col-sm-6 col-xs-12">
  	</div>
 	
  	</div>
  </div>
</section>

<!--  Upload Section -->
<section id="uploadsection">
<form action="uploadserver.jsp" method="post" enctype="multipart/form-data">

	<div class="form-group">
  		<div class="col-md-5">
  			<input type="file" name="file" class="form-control">
  		</div>
  	</div>
  	
  	<div class="form-group">
  		<div class="col-md-5">
  			<button type="submit" class="btn btn-primary">Upload</button>
  		</div>
  	</div>
  	
</form>
</section>
<!-- upload image -->
<section id="uploadimageview">
	<form action="uploadImageserver1.jsp" method="post" enctype="multipart/form-data">

	<div class="form-group">
  		<div class="col-md-5">
  			<input type="file" name="file" class="form-control">
  		</div>
  	</div>
  	
  	<div class="form-group">
  		<div class="col-md-5">
  			<button type="submit" class="btn btn-primary">Upload</button>
  		</div>
  	</div>
  	
</form>
</section>
</div>
</div>
</div>

<script>
	$(document).ready(function(){
		//alert('Hello');
		$("#profile").show();
		$("#tableview").hide();
		$("#emailview").hide();
		$("#passwordview").hide();
		$("#uploadsection").hide();
		$("uploadimageview").hide();
		
		
		$("#profileitem").click(function(){
			$("#profile").show();
			$("#tableview").hide();
			$("#emailview").hide();
			$("#passwordview").hide();
			$("#uploadsection").hide();
			$("#uploadimageview").hide();
		});
		
		$("#tableitem").click(function(){
			$("#profile").hide();
			$("#tableview").show();
			$("#emailview").hide();
			$("#passwordview").hide();
			$("#uploadsection").hide();
			$("#uploadimageview").hide();
		});
		
		$("#emailitem").click(function(){
			$("#profile").hide();
			$("#tableview").hide();
			$("#emailview").show();
			$("#passwordview").hide();
			$("#uploadsection").hide();
			$("#uploadimageview").hide();
		});
		
		$("#passworditem").click(function(){
			$("#profile").hide();
			$("#tableview").hide();
			$("#emailview").show();
			$("#passwordview").hide();
			$("#uploadsection").hide();
			$("#uploadimageview").hide();
		});
		
		$("#uploaditem").click(function(){
			$("#profile").hide();
			$("#tableview").hide();
			$("#emailview").hide();
			$("#passwordview").hide();
			$("#uploadsection").show();
			$("#uploadimageview").hide();
		});
		
		$("#uploadprofileitem").click(function(){
			$("#profile").hide();
			$("#tableview").hide();
			$("#emailview").hide();
			$("#passwordview").hide();
			$("#uploadsection").hide();
			$("#uploadimageview").show();
		});
		
	});
</script>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>






                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           