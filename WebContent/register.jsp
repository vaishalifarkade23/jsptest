<%@ page import="java.sql.*" %>

 <%
    String first=request.getParameter("FirstName");
	String last=request.getParameter("LastName");
	String gen=request.getParameter("gender");
	String course=request.getParameter("chk");
    String address=request.getParameter("fulladdress");
	String cities=request.getParameter("city");
	String state=request.getParameter("dropdown");
	String phone=request.getParameter("contact");
	String dob=request.getParameter("date");
	String mail=request.getParameter("Email");
	String pass=request.getParameter("password");
	String cpass=request.getParameter("confirmpassword");
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dbjsp","root","");
		String sql="insert into db_registration (FirstName,LastName,Gender,Course,Address,City,State,Contact,Dob,Email,Password) values('"+first+"','"+last+"','"+gen+"','"+course+"','"+address+"','"+cities+"','"+state+"','"+phone+"','"+dob+"','"+mail+"','"+pass+"')";
		PreparedStatement pst=con.prepareStatement(sql);
		int i =pst.executeUpdate();
		
	    if( i>0)
		{
			session.setAttribute("sesreg","Successfully Registered!!");
			response.sendRedirect("index.jsp");
			//out.print("Register Successfully");
		}
		
	}
	catch(Exception e)
	{
       out.print("Exception" +e); 
	}
	%>  