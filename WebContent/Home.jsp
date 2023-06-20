<!doctype html>
<%@ page import="java.sql.*" %>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <title>Home</title>
     <link rel="stylesheet" href="css/footer.css">
  </head>
  <body>
  		
   		  <!-- Header -->
          <div class="row">
          <div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12">
          <div class="jumbotron" style="background-color:violet">
               <h1 style="text-align: center">Thank You!!</h1>
   			   <h3 style="text-align: center">For Your Co-operation</h3>
   		 </div>
   		 </div>
   		 </div>
   		 
   		 <!--  Small Header   -->
          <div class="row">
          <div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12">
          <% String huser = (String)session.getAttribute("sesuser"); %>
           <h6 style="text-align: right">Welcome <%=huser %> <i class="fa fa-power-off" style="font-size:48px;color:red"></i></h6>
   		   		 </div>
   		 </div>
   		 
   		<!-- NavBar -->
		<div class="container">
  		<div class="row">
               <div class="col col-lg-1 col-md-6 col-sm-6 col-xs-12">
               
               <ul class="nav flex-column">
  <li class="nav-item">
    <a class="nav-link active" href="#">Active</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#">Student data </a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#">Another</a>
  </li>
  <li class="nav-item">
    <a class="nav-link " href="#">Disabled</a>
  </li>
</ul>
               </div>
                <div class="col col-lg-9 col-md-6 col-sm-6 col-xs-12">
                 <% 
   		         String sesdelete =(String)session.getAttribute("sesdelete");
   		         if(sesdelete==null)
  					{
  						
  					}
  					else
  					{
  			        %>	
  			       <!-- <script>
  			        swal("good!","","success");
  			        </script>-->
  			        	
  			        	<div class="alert alert-success">
  			        		<%= sesdelete%>
  			        		</div>	
  			        <%
  						session.setAttribute("sesdelete", null);
  					}
  					%>
  					 <% 
   		         String sesupdate =(String)session.getAttribute("sesupdate");
   		         if(sesupdate==null)
  					{
  						
  					}
  					else
  					{
  			        %>	
  			       <!-- <script>
  			        swal("good!","","success");
  			        </script>-->
  			        	
  			        	<div class="alert alert-success">
  			        		<%= sesupdate%>
  			        		</div>	
  			        <%
  						session.setAttribute("sesdelete", null);
  					}
  					%>
                <h1>Database </h1>
<table border="1">
<tr>
<td>Id</td>
<td>FirstName</td>
<td>LastName</td>
<td>Gender</td>
<td>Course</td>
<td>Address</td>
<td>City</td>
<td>State</td>
<td>Contact</td>
<td>Dob</td>
<td>Email</td>
<td>Password</td>
 <td>Edit</td>
 <td>Delete</td>
</tr>

<%
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dbjsp","root","");
	String sql="select * from db_registration";
	PreparedStatement pst=con.prepareStatement(sql);
	ResultSet rs =pst.executeQuery();
	while(rs.next())
	{
		%>
		<tr>
		<td><%=rs.getString("Id") %></td>
        <td><%=rs.getString("FirstName") %></td>
        <td><%=rs.getString("LastName") %></td>
        <td><%=rs.getString("Gender") %></td>
        <td><%=rs.getString("Course") %></td>
        <td><%=rs.getString("Address") %></td>
        <td><%=rs.getString("City") %></td>
        <td><%=rs.getString("State") %></td>
        <td><%=rs.getString("Contact") %></td>
        <td><%=rs.getString("Dob") %></td>
        <td><%=rs.getString("Email") %></td>
        <td><%=rs.getString("Password") %></td>
        <!-- Edit -->
        <td>
         <a href="edit.jsp?id=<%= rs.getInt("id") %>">
          <span class="glyphicon glyphicon-edit"></span>
        </a>
      </td>
      <!-- Delete -->
      <td>
      <a href="delete.jsp?id=<%= rs.getInt("id") %>">
          <span class="glyphicon glyphicon-trash"></span>
        </a>
        </td>
        </tr>
		<% 
	}
	
}
catch(Exception e)
{
	out.print("Exception" +e);
}
%>
</table>
                </div>
                 <div class="col col-lg-2 col-md-6 col-sm-6 col-xs-12">
               </div>
               </div>
               </div>
               
    
 <!--Footer -->
  <section id="footer">
		<div class="container">
			<div class="row text-center text-xs-center text-sm-left text-md-left">
				<div class="col-xs-12 col-sm-4 col-md-4">
					<h5>Quick links</h5>
					<ul class="list-unstyled quick-links">
						<li><a href="https://www.fiverr.com/share/qb8D02"><i class="fa fa-angle-double-right"></i>Home</a></li>
						<li><a href="https://www.fiverr.com/share/qb8D02"><i class="fa fa-angle-double-right"></i>About</a></li>
						<li><a href="https://www.fiverr.com/share/qb8D02"><i class="fa fa-angle-double-right"></i>FAQ</a></li>
						<li><a href="https://www.fiverr.com/share/qb8D02"><i class="fa fa-angle-double-right"></i>Get Started</a></li>
						<li><a href="https://www.fiverr.com/share/qb8D02"><i class="fa fa-angle-double-right"></i>Videos</a></li>
					</ul>
				</div>
				<div class="col-xs-12 col-sm-4 col-md-4">
					<h5>Quick links</h5>
					<ul class="list-unstyled quick-links">
						<li><a href="https://www.fiverr.com/share/qb8D02"><i class="fa fa-angle-double-right"></i>Home</a></li>
						<li><a href="https://www.fiverr.com/share/qb8D02"><i class="fa fa-angle-double-right"></i>About</a></li>
						<li><a href="https://www.fiverr.com/share/qb8D02"><i class="fa fa-angle-double-right"></i>FAQ</a></li>
						<li><a href="https://www.fiverr.com/share/qb8D02"><i class="fa fa-angle-double-right"></i>Get Started</a></li>
						<li><a href="https://www.fiverr.com/share/qb8D02"><i class="fa fa-angle-double-right"></i>Videos</a></li>
					</ul>
				</div>
				<div class="col-xs-12 col-sm-4 col-md-4">
					<h5>Quick links</h5>
					<ul class="list-unstyled quick-links">
						<li><a href="https://www.fiverr.com/share/qb8D02"><i class="fa fa-angle-double-right"></i>Home</a></li>
						<li><a href="https://www.fiverr.com/share/qb8D02"><i class="fa fa-angle-double-right"></i>About</a></li>
						<li><a href="https://www.fiverr.com/share/qb8D02"><i class="fa fa-angle-double-right"></i>FAQ</a></li>
						<li><a href="https://www.fiverr.com/share/qb8D02"><i class="fa fa-angle-double-right"></i>Get Started</a></li>
						<li><a href="https://wwwe.sunlimetech.com" title="Design and developed by"><i class="fa fa-angle-double-right"></i>Imprint</a></li>
					</ul>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 mt-2 mt-sm-5">
					<ul class="list-unstyled list-inline social text-center">
						<li class="list-inline-item"><a href="https://www.fiverr.com/share/qb8D02"><i class="fa fa-facebook"></i></a></li>
						<li class="list-inline-item"><a href="https://www.fiverr.com/share/qb8D02"><i class="fa fa-twitter"></i></a></li>
						<li class="list-inline-item"><a href="https://www.fiverr.com/share/qb8D02"><i class="fa fa-instagram"></i></a></li>
						<li class="list-inline-item"><a href="https://www.fiverr.com/share/qb8D02"><i class="fa fa-google-plus"></i></a></li>
						<li class="list-inline-item"><a href="https://www.fiverr.com/share/qb8D02" target="_blank"><i class="fa fa-envelope"></i></a></li>
					</ul>
				</div>
				<hr>
			</div>	
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 mt-2 mt-sm-2 text-center text-white">
					<p><u><a href="https://www.nationaltransaction.com/">National Transaction Corporation</a></u> is a Registered MSP/ISO of Elavon, Inc. Georgia [a wholly owned subsidiary of U.S. Bancorp, Minneapolis, MN]</p>
					<p class="h6">© All right Reversed.<a class="text-green ml-2" href="https://www.sunlimetech.com" target="_blank">Sunlimetech</a></p>
				</div>
				<hr>
			</div>	
		</div>
	</section>

 
   		 	
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>