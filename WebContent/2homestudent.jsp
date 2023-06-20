<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert t<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>Home Page</title>
    <link rel="stylesheet" href="css/navbar.css">
    <script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
  </head>
  <body>
   <%
    String hname = "";
	String hemail = (String)session.getAttribute("lemail");
	String husername="";
	String hpassword = "";
	String hcpassword="";
	String hgender = "";
	String hcity="";
	String husertype = "";
	String hadd="";
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbjsp", "root", "");
		String sql = "select * from adminregtable2 where email = '"+hemail+"'";
		PreparedStatement pst = con.prepareStatement(sql);
		ResultSet rs = pst.executeQuery();
		if(rs.next())
		{
			hname = rs.getString("fullname");
			hemail = rs.getString("email");
			husername=rs.getString("username");
			hpassword = rs.getString("password");
			hcpassword=rs.getString("confirmpassword");
			hgender = rs.getString("gender");
			hcity=rs.getString("city");//inide bracket table content name
			husertype = rs.getString("usertype");
			hadd=rs.getString("address");
		}
		
	}
	catch(Exception ex)
	{
		out.println("Exception : "+ex);
	}
  
  %>
  <div class="wrapper">
  	<div class="sidebar">
  		<h2>Sidebar</h2>
  			<ul>
  				<li><a href="#"><i class="fas fa-home"></i>Home</a></li>
  				<li><a href="#"><i class="fas fa-user"></i>Profile</a></li>
  				<li><a href="#"><i class="fas fa-address-card"></i>About</a></li>
  				<li><a href="#"><i class="fas fa-project-diagram"></i>Portfolio</a></li>
  				<li><a href="#"><i class="fas fa-blog"></i>Blogs</a></li>
  				<li><a href="#"><i class="fas fa-address-book"></i>Contact</a></li>
  				<li><a href="#"><i class="fas fa-map-pin"></i>Map</a></li>
  			</ul>
  			<div class="social-media">
  				<a href="#"><i class="fab fa-facebook"></i></a>
  				<a href="#"><i class="fab fa-twitter"></i></a>
  				<a href="#"><i class="fab fa-instagram"></i></a>
  			</div>
  	</div>
  	<div class="main_content">
  		<div class="header">Welcome!! Have a nice day.</div>
  		<div class="info">
  			<div></div>
  		</div>
  	</div>
  </div>
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
                                        <input type="text" id="fullname" class="form-control" name="fullname" value="<%=hname%>">
                                    </div>
                                </div>
                                
                                
                                        <div class="form-group row">
                                    <label for="email_address" class="col-md-4 col-form-label text-md-right">E-Mail</label>
                                    <div class="col-md-6">
                                        <input type="text" id="email" class="form-control" name="email" value="<%=hemail%>">
                                    </div>
                                </div>
                                
          
            <div class="form-group row">
                                    <label for="full_name" class="col-md-4 col-form-label text-md-right">User Name</label>
                                    <div class="col-md-6">
                                        <input type="text" id="username" class="form-control" name="username" value="<%=husername%>">
                                    </div>
                                </div>
                                
                                
           <small class="text-danger" id="chkusername"></small>
                               
                                

                                <div class="form-group row">
                                    <label for="user_name" class="col-md-4 col-form-label text-md-right">Password</label>
                                    <div class="col-md-6">
                                        <input type="password" id="user_name" class="form-control" name="password" value="<%=hpassword%>">
                                    </div>
                                </div>
                                
        <small class="text-danger" id="chkpassward"></small>
        
                                <div class="form-group row">
                                    <label for="user_name" class="col-md-4 col-form-label text-md-right">  Confirm Password</label>
                                    <div class="col-md-6">
                                        <input type="password" id="user_name2" class="form-control" name="cpassword" value="<%=hcpassword%>">
                                    </div>
                                </div>
                                
        <small class="text-danger" id="chkCpassward"></small>
        
                                 <div class="form-group row">
                                    <label for="user_name" class="col-md-4 col-form-label text-md-right">Gender</label>
                                    <div class="col-md-6">
                                        <select name="comboaction" class="form-control" id="gender">
                                             <option value="select"  >select</option>
        									<option value="Male" 
        									<%
			                              if(husertype.equalsIgnoreCase("male")){
		                                    %>
		                                     selected
		                                     <%
		                                     }
		                                     %>
        									 >Male</option>
        									<option value="Female"
        									<%
			                                if(husertype.equalsIgnoreCase("female")){
		                                    %>
		                                     selected
		                                     <%
		                                     }
		                                     %>
        									 >Female</option>
      									</select>
                                    </div>
                                </div>
                                
          <small class="text-danger" id="chkgender"></small>
                               
        						<div class="form-group row">
                                    <label for="user_name" class="col-md-4 col-form-label text-md-right">City</label>
                                    <div class="col-md-6">
                                        <select name="combocity" class="form-control" id="city">
                                        
                                          <option value="select"  >select</option>
        								<option value="Nagpur" 
        								<%
			                              if(husertype.equalsIgnoreCase("nagpur")){
		                                    %>
		                                     selected
		                                     <%
		                                     }
		                                     %>
		                                     >Nagpur</option>
        									<option value="Chandrapur" 
        									<%
        									 if(husertype.equalsIgnoreCase("chandrapur")){
		                                    %>
		                                     selected
		                                     <%
		                                     }
		                                     %>
        									>Chandrapur</option>
        									<option value="Hydrabad" 
        									<%
        									 if(husertype.equalsIgnoreCase("hydrabad")){
		                                    %>
		                                     selected
		                                     <%
		                                     }
		                                     %>
		                                      >Hydrabad</option>
        									<option value="Chennai"
        									<%
        									 if(husertype.equalsIgnoreCase("chennai")){
		                                    %>
		                                     selected
		                                     <%
		                                     }
		                                     %>
        									 >Chennai</option>
        									<option value="Delhi" 
        									<%
        									 if(husertype.equalsIgnoreCase("delhi")){
		                                    %>
		                                     selected
		                                     <%
		                                     }
		                                     %>
        									 >Delhi</option>
        									<option value="Mumbai"
        									<%
        									 if(husertype.equalsIgnoreCase("mumbai")){
		                                    %>
		                                     selected
		                                     <%
		                                     }
		                                     %>
        									 >Mumbai</option>
        									
      									</select>
                                    </div>
                                </div>
                                
         
	<div class="form-group row">
        <label for="user_name" class="col-md-4 col-form-label text-md-right">User Type</label>
         <div class="col-md-6">
       <select name="combotype" class="form-control" id="user">
         
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
   </div>                             
                                
          
           <div class="form-group row">
       	            <label for="user_name" class="col-md-4 col-form-label text-md-right">Address :</label>
       	             <div class="col-md-6">
				    <textarea><%=hadd %></textarea>
			        </div>
                      </div>         
                      </form>
                       </div>
                    </div>
            </div>
        </div>
    </div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>itle here</title>
</head>
<body>

</body>
</html>