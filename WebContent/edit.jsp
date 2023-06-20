<!doctype html>
<%@ page import="java.sql.*" %>

<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>Hello, world!</title>
  </head>
  <body>
    <%
    String id=request.getParameter("id");
    String firstname="";
    String lastname="";
    String gender="";
    String course="";
    String address="";
    String city="";
    String state="";
    String contact="";
    String dob="";
    String email="";
    String pass="";
    
    try{
    	Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dbjsp","root","");
		String sql="select * from db_registration where Id='"+id+"'";
		PreparedStatement pst=con.prepareStatement(sql);
		ResultSet rs =pst.executeQuery();
		while(rs.next())
		{
			    firstname=rs.getString("FirstName");
				lastname=rs.getString("LastName");
			    gender=rs.getString("Gender");
			    course=rs.getString("Course");
			    address=rs.getString("Address");
				city=rs.getString("City");
				state=rs.getString("State");
				contact=rs.getString("Contact");
				dob=rs.getString("Dob");
				email=rs.getString("Email");
				pass=rs.getString("Password");
			    
		}
		
    }
    catch(Exception e)
	{
       out.print("Exception" +e); 
	}
    
    %>
     <div class="container">
  <div class="row">
               <div class="col col-lg-2 col-md-6 col-sm-6 col-xs-12">
               </div>
                <div class="col col-lg-8 col-md-6 col-sm-6 col-xs-12">
                 <div class="modal-body" >
                <div style="border: 2px;padding:20px">
                
               <form action="editserver.jsp"  method="get">
       	       <div class="form-group">
       	       <input type="hidden" name="id" class="form-control" value="<%= id %>">
       	      </div>
       	       
       	        <div class="form-group">
              <label>First Name:</label>
       	      <input type="text" name="FirstName" class="form-control"  value="<%= firstname %>">
       	      </div>
              
                    <div class="form-group">
                    <label> Last Name:</label>
       	            <input type="text" name="LastName" class="form-control" value="<%= lastname %>">
       	            </div>
       	            
       	            <div class="form-group">
       	            <label>Gender:</label><br>
       	            <input type="radio" name="gender"  
       	            <% 
       	                if(gender.equalsIgnoreCase("male"))
       	            	out.print("checked");
       	            %>
       	            >Male
       	            <input type="radio" name="gender"  
       	            <% 
       	                if(gender.equalsIgnoreCase("female"))
       	            	out.print("checked");
       	             %>
       	            >Female
       	            </div>
       	            
       	            <div class="form-group">
			        <label>Select Course:</label><br>
			        <input type="checkbox" name="chk" 
			        <%
			            String[] chkcourse=course.split(" ");
			            for(int i=0;i<chkcourse.length;i++){
   		   				if(chkcourse[i].equalsIgnoreCase("java"))
   		   				out.print("checked");
			        %>
			        >Java
			        <input type="checkbox" name="chk" 
			        <%
			            if(chkcourse[i].equalsIgnoreCase("php"))
   		   				out.print("checked");
			        %>
			        >Php
			        <input type="checkbox" name="chk" 
			        <%
			            if(chkcourse[i].equalsIgnoreCase("html"))
   		   				out.print("checked");
			        %>
			        >Html
			        <input type="checkbox" name="chk" 
			        <% 
			             if(chkcourse[i].equalsIgnoreCase("jsp"))
   		   				 out.print("checked");
			            
			         %>
			        >Jsp
			        <%
			            }
			        %>
			        </div>
       	            
       	            <div class="form-group">
       	            <label>Address :</label>
				    <textarea><%= address %></textarea>
			        </div>
			        
			        <div class="form-group">
       	            <label>City :</label>
       	            <input type="text" name="city" class="form-control" value="<%= city %>">
			        
			        <div class="form-group">
				    <label>Select State:</label> 
				    <select class="form-control"  name="dropdown"  >
					<option value="select">Select  State </option>
					<option value="Maharastra"
					<%
							if(state.equalsIgnoreCase("Maharastra")){
					%>
					selected
					<%
							}
					%>
					>Maharastra</option>
					<option value="Madhya Pradesh"
					<%
							if(state.equalsIgnoreCase("madhya padesh")){
					%>
					selected
					<%
							}
					%>
					>Madhya Pradesh</option>
					<option value="Chatisgadh"
					<%
							if(state.equalsIgnoreCase("chatisgadh")){
					%>
					selected
					<%
							}
					%>
					>Chatisgadh</option>
					<option value="Himachal Pradesh"
					<%
							if(state.equalsIgnoreCase("himachal pradesh")){
					%>
					selected
					<%
							}
					%>
					>Himachal Pradesh</option>
					<option value="Uttar pradesh"
					<%
							if(state.equalsIgnoreCase("uttar pradesh")){
					%>
					selected
					<%
							}
					%>
					>Uttar pradesh</option>
					<!-- <option>Rajastan</option>
					<option>Gujrat</option>
					<option>Tamilnadu</option>
					<option>Karnataka</option>
					<option>Telangana</option>
					<option>Kerla</option>
					<option>Sikkim</option>-->
				    </select>
			        </div>
			        
   
       	            <div class="form-group">
                    <label> Contact:</label>
       	           <input type="text" name="contact" class="form-control" value="<%= contact %>">
       	           </div>
       	            					 <!--  <div class="form-group">
                   						 <label> DOB:</label>
       	           						 <input type="text" name="DOB" class="form-control" >
       	           						 </div>-->
       	           						 
       	           	<div class="form-group">
       		        <label>Date Of Birth:</label>
       		        <input type="date" class="form-control" value="<%= dob %>" name="date">
                    </div>
                    
                                        <div class="form-group">
                     <label> Email:</label>
                     <input type="text" name="Email" class="form-control" value="<%= email %>">
       	             </div>
                    
       	            							
               		 <div class="form-group">
                  	 <label> Password:</label>
                      <input type="password" name="password" class="form-control" value="<%= pass %>">
                     </div>					          
       	             							
       	             <div class="form-group">
                    <label> confirm Password:</label>
                 	<input type="password" name="confirmpassword" class="form-control" >
       	             </div>
       	             
       	            <div class="form-group">
                    <button type="submit" class="btn btn-success">Update</button>
                    </div>
                    											 
               </div>
    		    <div class="col col-lg-2 col-md-6 col-sm-6 col-xs-12">
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
</html>